"use strict";

var map, marker, markerContent, searchClicked;
var optimizedDatabaseLoading = 0;

function heroMap(_latitude,_longitude, element, mapDefaultZoom, mapAutoZoom){

    if( document.getElementById(element) !== null ){

        // Create google map first -------------------------------------------------------------------------------------

        if( !mapDefaultZoom ){
            mapDefaultZoom = 14;
        }

        if( !optimizedDatabaseLoading ){
            optimizedDatabaseLoading = 0;
        }

        map = new google.maps.Map(document.getElementById(element), {
            zoom: mapDefaultZoom,
            scrollwheel: false,
            center: new google.maps.LatLng(_latitude, _longitude),
            mapTypeId: "roadmap",
            styles: [{"featureType":"administrative.locality","elementType":"all","stylers":[{"hue":"#c79c60"},{"saturation":7},{"lightness":19},{"visibility":"on"}]},{"featureType":"landscape","elementType":"all","stylers":[{"hue":"#ffffff"},{"saturation":-100},{"lightness":100},{"visibility":"simplified"}]},{"featureType":"poi","elementType":"all","stylers":[{"hue":"#ffffff"},{"saturation":-100},{"lightness":100},{"visibility":"off"}]},{"featureType":"road","elementType":"geometry","stylers":[{"hue":"#c79c60"},{"saturation":-52},{"lightness":-10},{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels","stylers":[{"hue":"#c79c60"},{"saturation":-93},{"lightness":31},{"visibility":"on"}]},{"featureType":"road.arterial","elementType":"labels","stylers":[{"hue":"#c79c60"},{"saturation":-93},{"lightness":-2},{"visibility":"simplified"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"hue":"#c79c60"},{"saturation":-52},{"lightness":-10},{"visibility":"simplified"}]},{"featureType":"transit","elementType":"all","stylers":[{"hue":"#c79c60"},{"saturation":10},{"lightness":69},{"visibility":"on"}]},{"featureType":"water","elementType":"all","stylers":[{"hue":"#c79c60"},{"saturation":-78},{"lightness":67},{"visibility":"simplified"}]}]
        });

        // Load necessary data for markers using PHP (from database) after map is loaded and ready ---------------------

        var allMarkers;

        //  When optimization is enabled, map will load the data in Map Bounds every time when it's moved. Otherwise will load data at once

        if( optimizedDatabaseLoading === 1 ){
            google.maps.event.addListener(map, 'idle', function(){
                if( searchClicked !== 1 ){
                    var ajaxData = {
                        optimized_loading: 1,
                        north_east_lat: map.getBounds().getNorthEast().lat(),
                        north_east_lng: map.getBounds().getNorthEast().lng(),
                        south_west_lat: map.getBounds().getSouthWest().lat(),
                        south_west_lng: map.getBounds().getSouthWest().lng()
                    };
                    if( markerCluster !== undefined ){
                        markerCluster.clearMarkers();
                    }
                    loadData("assets/php/data.php", newMarkers, ajaxData);
                }
            });
        }
        else {
            google.maps.event.addListenerOnce(map, 'idle', function(){
                loadData("assets/php/data.php", newMarkers);
            });
        }

        // Create and place markers function ---------------------------------------------------------------------------

        var i;
        var a;
        var newMarkers = [];
        var resultsArray = [];
        var visibleMarkersId = [];
        var visibleMarkersOnMap = [];
        var markerCluster;



        $('.geo-location').on("click", function(e) {
            e.preventDefault();
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(success);
            } else {
                console.log('Geo Location is not supported');
            }
        });

        // Automatic Geo Location

        if( automaticGeoLocation === true ){
            navigator.geolocation.getCurrentPosition(success);
        }

        // Autocomplete

        autoComplete(map,marker);

    }
    else {
        //console.log("No map element");
    }

}

function placeMarkers(markers){

    var newMarkers = [];

    for ( var i = 0; i < markers.length; i++) {

        var marker;
        var markerContent = document.createElement('div');
        var thumbnailImage;

        if( markers[i]["marker_image"] !== undefined ){
            thumbnailImage = markers[i]["marker_image"];
        }
        else {
            thumbnailImage = "assets/img/items/default.png";
        }

        markerContent.innerHTML =
            '<div class="marker" data-id="'+ markers[i]["id"] +'">' +
            '<img src="assets/img/map-marker.png" alt="">' +
            '</div>';

        // Latitude, Longitude and Address

        if ( markers[i]["latitude"] && markers[i]["longitude"] && markers[i]["address"] ){
            renderRichMarker(i,"latitudeLongitude");
        }

        // Only Address

        else if ( markers[i]["address"] && !markers[i]["latitude"] && !markers[i]["longitude"] ){
            renderRichMarker(i,"address");
        }

        // Only Latitude and Longitude

        else if ( markers[i]["latitude"] && markers[i]["longitude"] && !markers[i]["address"] ) {
            renderRichMarker(i,"latitudeLongitude");
        }

        // No coordinates

        else {
            console.log( "No location coordinates");
        }
    }

    // Create marker using RichMarker plugin -------------------------------------------------------------------

    function renderRichMarker(i,method){
        if( method === "latitudeLongitude" ){
            marker = new RichMarker({
                position: new google.maps.LatLng( markers[i]["latitude"], markers[i]["longitude"] ),
                map: map,
                draggable: false,
                content: markerContent,
                flat: true
            });

            google.maps.event.addListener(marker, 'click', (function(marker, i) {
                return function() {
                    openInfobox( $(this.content.firstChild).attr("data-id"), this, i );
                    //console.log( $(this.content.firstChild).attr("data-id") );
                }
            })(marker, i));
            newMarkers.push(marker);

        }
        else if ( method === "address" ){
            var a = i;
            var geocoder = new google.maps.Geocoder();
            var geoOptions = {
                address: markers[i]["address"]
            };
            geocoder.geocode(geoOptions, geocodeCallback(markerContent));

        }

        if ( mapAutoZoom === 1 ){
            var bounds  = new google.maps.LatLngBounds();
            for (var i = 0; i < newMarkers.length; i++ ) {
                bounds.extend(newMarkers[i].getPosition());
            }
            map.fitBounds(bounds);
        }

    }

    // Ajax loading of infobox -------------------------------------------------------------------------------------

    var lastInfobox;

    function openInfobox(id, _this, i){
        $.ajax({
            url: "assets/php/infobox.php",
            dataType: "html",
            data: { id: id },
            method: "POST",
            success: function(results){
                var infoboxOptions = {
                    content: results,
                    disableAutoPan: false,
                    pixelOffset: new google.maps.Size(-125, -30),
                    zIndex: null,
                    alignBottom: true,
                    boxClass: "infobox-wrapper",
                    enableEventPropagation: true,
                    closeBoxMargin: "0px 0px -8px 0px",
                    closeBoxURL: "assets/img/close-btn.png",
                    infoBoxClearance: new google.maps.Size(1, 1)
                };

                if( lastInfobox !== undefined ){
                    lastInfobox.close();
                }

                newMarkers[i].infobox = new InfoBox(infoboxOptions);
                newMarkers[i].infobox.open(map, _this);
                lastInfobox = newMarkers[i].infobox;

                setTimeout(function(){
                    $(".item.infobox[data-id="+ id +"]").parent().addClass("show");
                }, 10);

                google.maps.event.addListener(newMarkers[i].infobox,'closeclick',function(){
                    $(lastClickedMarker).removeClass("active");
                });
            },
            error : function () {
                console.log("error");
            }
        });
    }

    // Geocoder callback ---------------------------------------------------------------------------------------

    function geocodeCallback(markerContent) {
        return function(results, status) {
            if (status === google.maps.GeocoderStatus.OK) {
                marker = new RichMarker({
                    position: results[0].geometry.location,
                    map: map,
                    draggable: false,
                    content: markerContent,
                    flat: true
                });
                newMarkers.push(marker);
                if ( mapAutoZoom === 1 ){
                    var bounds  = new google.maps.LatLngBounds();
                    for (var i = 0; i < newMarkers.length; i++ ) {
                        bounds.extend(newMarkers[i].getPosition());
                    }
                    map.fitBounds(bounds);
                }
                google.maps.event.addListener(marker, 'click', (function(marker, i) {
                    return function() {
                        openInfobox( $(this.content.firstChild).attr("data-id"), this, 0 );
                    }
                })(marker, i));
            } else {
                console.log("Geocode failed " + status);
            }
        }
    }

    // Marker clusters -----------------------------------------------------------------------------------------

    var clusterStyles = [
        {
            url: 'assets/img/cluster.png',
            height: 36,
            width: 36
        }
    ];

    var markerCluster = new MarkerClusterer(map, newMarkers, { styles: clusterStyles, maxZoom: 16, ignoreHidden: true });

}

function loadData(url, newMarkers, ajaxData){
    $.ajax({
        url: url,
        dataType: "json",
        method: "POST",
        data: ajaxData,
        cache: false,
        success: function(results){
            for( var i=0; i < newMarkers.length; i++ ){
                newMarkers[i].setMap(null);
            }
            var allMarkers = results;
            placeMarkers(results);
        },
        error : function (e) {
            console.log(e);
        }
    });
}

// Geo Location ------------------------------------------------------------------------------------------------

function success(position) {
    var center = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    map.panTo(center);
    marker = new google.maps.Marker({
        position: center,
        map: map,
        icon: "assets/img/map-marker.png"
    });
}
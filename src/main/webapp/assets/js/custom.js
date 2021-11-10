////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// jQuery
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
var automaticGeoLocation = false;
var resizeId;

$(document).ready(function($) {
    "use strict";

//  Geo Location button

    if( $(".geo-location").length > 0 && $(".map").length === 0 ){
        $("body").append("<div id='map-helper' style='display: none'></div>");
        var map = new google.maps.Map(document.getElementById("map-helper"));
        autoComplete(map);
    }

//  Selectize

    $("[data-enable-search=true]").each(function(){
        $(this).selectize({
            onDropdownOpen: dropdownOpen,
            onDropdownClose: dropdownClose,
            allowEmptyOption: false
        });
    });

    var select = $("select");
    select.selectize({
        onDropdownOpen: dropdownOpen,
        onDropdownClose: dropdownClose,
        allowEmptyOption: true,        
    });

    function dropdownOpen($dropdown){
        $dropdown.addClass("opening");
    }
    function dropdownClose($dropdown){
        $dropdown.removeClass("opening");
    }


//  Disable inputs in the non-active tab

    $(".form-slide:not(.active) input, .form-slide:not(.active) select, .form-slide:not(.active) textarea").prop("disabled", true);

//  Change tab button


    $("select.change-tab").each(function(){
        var _this = $(this);
        if( $(this).find(".item").attr("data-value") !== "" ){
            changeTab( _this );
        }
    });

    $(".change-tab").on("change", function() {
        changeTab( $(this) );
    });

    $(".box").each(function(){
        if( $(this).find(".background .background-image").length ) {
            $(this).css("background-color","transparent");
        }
    });

//  Star Rating

    $(".rating").each(function(){
        for( var i = 0; i <  5; i++ ){
            if( i < $(this).attr("data-rating") ){
                $(this).append("<i class='active fa fa-star'></i>")
            }
            else {
                $(this).append("<i class='fa fa-star'></i>")
            }
        }
    });

//  Button for class changing

    $(".change-class").on("click", function(e){
        e.preventDefault();
        var parentClass = $( "."+$(this).attr("data-parent-class") );
        parentClass.removeClass( $(this).attr("data-change-from-class") );
        parentClass.addClass( $(this).attr("data-change-to-class") );
        $(this).parent().find(".change-class").removeClass("active");
        $(this).addClass("active");
        readMore();
    });

    if( $(".masonry").length ){
        $(".items.masonry").masonry({
            itemSelector: ".item",
            transitionDuration: 0
        });
    }

    $(".ribbon-featured").each(function() {
        var thisText = $(this).text();
        $(this).html("");
        $(this).append(
            "<div class='ribbon-start'></div>" +
            "<div class='ribbon-content'>" + thisText + "</div>" +
            "<div class='ribbon-end'>" +
                "<figure class='ribbon-shadow'></figure>" +
            "</div>"
        );
    });

//  File input styling

    if( $("input[type=file].with-preview").length ){
        $("input.file-upload-input").MultiFile({
            list: ".file-upload-previews"
        });
    }

    $(".single-file-input input[type=file]").change(function() {
        previewImage(this);
    });

    $(".has-child a[href='#'].nav-link").on("click", function (e) {
        e.preventDefault();
       if( !$(this).parent().hasClass("hover") ){
           $(this).parent().addClass("hover");
       }
       else {
           $(this).parent().removeClass("hover");
       }
    });

    if( $(".owl-carousel").length ){
        var galleryCarousel = $(".gallery-carousel");

        galleryCarousel.owlCarousel({
            loop: false,
            margin: 0,
            nav: true,
            items: 1,
            navText: ["<i class='fa fa-chevron-left'></i>","<i class='fa fa-chevron-right'></i>"],
            autoHeight: true,
            dots: false
        });

        $(".tabs-slider").owlCarousel({
            loop: false,
            margin: 0,
            nav: false,
            items: 1,
            autoHeight: true,
            dots: false,
            mouseDrag: true,
            touchDrag: false,
            pullDrag: false,
            freeDrag: false
        });

        $(".full-width-carousel").owlCarousel({
            loop: true,
            margin: 10,
            nav: true,
            items: 3,
            navText: ["<i class='fa fa-chevron-left'></i>","<i class='fa fa-chevron-right'></i>"],
            autoHeight: false,
            center: true,
            dots: false,
            autoWidth:true,
            responsive: {
                768: {
                    items: 3
                },
                0 : {
                    items: 1,
                    center: false,
                    margin: 0,
                    autoWidth: false
                }
            }
        });

        $(".gallery-carousel-thumbs").owlCarousel({
            loop: false,
            margin: 20,
            nav: false,
            dots: true,
            items: 5,
            URLhashListener: true
        });

        $("a.owl-thumb").on("click", function () {
            $("a.owl-thumb").removeClass("active-thumb");
            $(this).addClass("active-thumb");
        });

        galleryCarousel.on('translated.owl.carousel', function() {
            var hash = $(this).find(".active").find("img").attr("data-hash");
            $(".gallery-carousel-thumbs").find("a[href='#" + hash + "']").trigger("click");
        });
    }

//  Bootstrap tooltip initialization

    $('[data-toggle="tooltip"]').tooltip();

//  iCheck

    $("input[type=checkbox], input[type=radio]").iCheck();

    var framedInputRadio = $(".framed input[type=radio]");
    framedInputRadio.on('ifChecked', function(){
        $(this).closest(".framed").addClass("active");
    });
    framedInputRadio.on('ifUnchecked', function(){
        $(this).closest(".framed").removeClass("active");
    });

//  "img" into "background-image" transfer

    $("[data-background-image]").each(function() {
        $(this).css("background-image", "url("+ $(this).attr("data-background-image") +")" );
    });

    $(".background-image").each(function() {
        $(this).css("background-image", "url("+ $(this).find("img").attr("src") +")" );
    });

//  Custom background color

    $("[data-background-color]").each(function() {
        $(this).css("background-color", $(this).attr("data-background-color") );
    });

//  Form Validation

    $(".form.email .btn[type='submit']").on("click", function(e){
        var button = $(this);
        var form = $(this).closest("form");
        button.prepend("<div class='status'></div>");
        form.validate({
            submitHandler: function() {
                $.post("assets/php/email.php", form.serialize(),  function(response) {
                    button.find(".status").append(response);
                    form.addClass("submitted");
                });
                return false;
            }
        });
    });

//  No UI Slider -------------------------------------------------------------------------------------------------------

    if( $('.ui-slider').length > 0 ){

        $.getScript( "assets/js/jquery.nouislider.all.min.js", function() {
            $('.ui-slider').each(function() {
                if( $("body").hasClass("rtl") ) var rtl = "rtl";
                else rtl = "ltr";

                var step;
                if( $(this).attr('data-step') ) {
                    step = parseInt( $(this).attr('data-step') );
                }
                else {
                    step = 10;
                }
                var sliderElement = $(this).attr('id');
                var element = $( '#' + sliderElement);
                var valueMin = parseInt( $(this).attr('data-value-min') );
                var valueMax = parseInt( $(this).attr('data-value-max') );
                $(this).noUiSlider({
                    start: [ valueMin, valueMax ],
                    connect: true,
                    direction: rtl,
                    range: {
                        'min': valueMin,
                        'max': valueMax
                    },
                    step: step
                });
                if( $(this).attr('data-value-type') == 'price' ) {
                    if( $(this).attr('data-currency-placement') == 'before' ) {
                        $(this).Link('lower').to( $(this).children('.values').children('.value-min'), null, wNumb({ prefix: $(this).attr('data-currency'), decimals: 0, thousand: '.' }));
                        $(this).Link('upper').to( $(this).children('.values').children('.value-max'), null, wNumb({ prefix: $(this).attr('data-currency'), decimals: 0, thousand: '.' }));
                    }
                    else if( $(this).attr('data-currency-placement') == 'after' ){
                        $(this).Link('lower').to( $(this).children('.values').children('.value-min'), null, wNumb({ postfix: $(this).attr('data-currency'), decimals: 0, thousand: ' ' }));
                        $(this).Link('upper').to( $(this).children('.values').children('.value-max'), null, wNumb({ postfix: $(this).attr('data-currency'), decimals: 0, thousand: ' ' }));
                    }
                }
                else {
                    $(this).Link('lower').to( $(this).children('.values').children('.value-min'), null, wNumb({ decimals: 0 }));
                    $(this).Link('upper').to( $(this).children('.values').children('.value-max'), null, wNumb({ decimals: 0 }));
                }
            });
        });
    }

//  Read More

    readMore();

    footerHeight();

    $("form").each(function(){
        $(this).validate();
    });

});

$(window).on("resize", function(){
    clearTimeout(resizeId);
    resizeId = setTimeout(doneResizing, 250);
});

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Functions
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Do after resize

function doneResizing(){
    footerHeight();
}

// Change Tab

function changeTab(_this){
    var parameters = _this.data("selectize").items[0];
    var changeTarget = $("#" + _this.attr("data-change-tab-target"));
    var slide = changeTarget.find(".form-slide");
    if( parameters === "" ){
        slide.removeClass("active");
        slide.first().addClass("default");
        changeTarget.find("input").prop("disabled", true);
        changeTarget.find("select").prop("disabled", true);
        changeTarget.find("textarea").prop("disabled", true);
    }
    else {
        slide.removeClass("default");
        slide.removeClass("active");
        changeTarget.find("input").prop("disabled", true);
        changeTarget.find("select").prop("disabled", true);
        changeTarget.find("textarea").prop("disabled", true);
        changeTarget.find( "#" + parameters ).addClass("active");
        changeTarget.find( "#" + parameters + " input").prop("disabled", false);
        changeTarget.find( "#" + parameters + " textarea").prop("disabled", false);
        changeTarget.find( "#" + parameters + " select").prop("disabled", false);
    }
}

// Footer Height

function footerHeight(){
    if( !viewport.is("xs") ) {
        var footer = $(".footer");
        var footerHeight = footer.height() + parseInt( footer.css("padding-top"), 10 ) + parseInt( footer.css("padding-bottom"), 10 ) ;
        $(".page >.content").css("margin-bottom", footerHeight + "px");
    }
    else if(viewport.is("xs")) {
        $(".page >.content").css("margin-bottom", "0px");
    }
}

// Read More

function readMore() {
    $(".read-more").each(function(){
        var readMoreLink = $(this).attr("data-read-more-link-more");
        var readLessLink = $(this).attr("data-read-more-link-less");
        var collapseHeight = $(this).find(".item:first").height() + parseInt( $(this).find(".item:first").css("margin-bottom"), 10 );
        $(".read-more").readmore({
            moreLink: '<div class="center"><a href="#" class="btn btn-primary btn-rounded btn-framed">' + readMoreLink + '</a></div>',
            lessLink: '<div class="center"><a href="#" class="btn btn-primary btn-rounded btn-framed">' + readLessLink + '</a></div>',
            collapsedHeight: 500
        });
    });
}

// Google Map

function simpleMap(latitude, longitude, markerImage, mapTheme, mapElement, markerDrag){
    if (!markerDrag){
        markerDrag = false;
    }
    if ( mapTheme === "light" ){
        var mapStyles = [{"featureType":"administrative.locality","elementType":"all","stylers":[{"hue":"#c79c60"},{"saturation":7},{"lightness":19},{"visibility":"on"}]},{"featureType":"landscape","elementType":"all","stylers":[{"hue":"#ffffff"},{"saturation":-100},{"lightness":100},{"visibility":"simplified"}]},{"featureType":"poi","elementType":"all","stylers":[{"hue":"#ffffff"},{"saturation":-100},{"lightness":100},{"visibility":"off"}]},{"featureType":"road","elementType":"geometry","stylers":[{"hue":"#c79c60"},{"saturation":-52},{"lightness":-10},{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels","stylers":[{"hue":"#c79c60"},{"saturation":-93},{"lightness":31},{"visibility":"on"}]},{"featureType":"road.arterial","elementType":"labels","stylers":[{"hue":"#c79c60"},{"saturation":-93},{"lightness":-2},{"visibility":"simplified"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"hue":"#c79c60"},{"saturation":-52},{"lightness":-10},{"visibility":"simplified"}]},{"featureType":"transit","elementType":"all","stylers":[{"hue":"#c79c60"},{"saturation":10},{"lightness":69},{"visibility":"on"}]},{"featureType":"water","elementType":"all","stylers":[{"hue":"#c79c60"},{"saturation":-78},{"lightness":67},{"visibility":"simplified"}]}];
    }
    else if ( mapTheme === "dark" ){
        mapStyles = [{"featureType":"all","elementType":"labels.text.fill","stylers":[{"saturation":36},{"color":"#000000"},{"lightness":40}]},{"featureType":"all","elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#000000"},{"lightness":16}]},{"featureType":"all","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":17},{"weight":1.2}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":21}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#000000"},{"lightness":17}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":29},{"weight":0.2}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":18}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":16}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":19}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":17}]}]
    }
    var mapCenter = new google.maps.LatLng(latitude,longitude);
    var mapOptions = {
        zoom: 13,
        center: mapCenter,
        disableDefaultUI: false,
        scrollwheel: false,
        styles: mapStyles
    };
    var element = document.getElementById(mapElement);
    var map = new google.maps.Map(element, mapOptions);
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(latitude,longitude),
        map: map,
        icon: markerImage,
        draggable: markerDrag
    });

    google.maps.event.addListener(marker, 'dragend', function(){
        var latitudeInput = $('#latitude');
        var longitudeInput = $("#longitude");
        if( latitudeInput.length ){
            latitudeInput.val( marker.getPosition().lat() );
        }
        if( longitudeInput.length ){
            longitudeInput.val( marker.getPosition().lng() );
        }
    });

    autoComplete(map, marker);

}

//Autocomplete ---------------------------------------------------------------------------------------------------------

function autoComplete(map, marker){
    if( $("#input-location").length ){
        if( !map ){
            map = new google.maps.Map(document.getElementById("input-location"));
        }
        var mapCenter;
        var input = document.getElementById('input-location');
        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo('bounds', map);
        google.maps.event.addListener(autocomplete, 'place_changed', function() {
            var place = autocomplete.getPlace();
            if (!place.geometry) {
                return;
            }
            if (place.geometry.viewport) {
                map.fitBounds(place.geometry.viewport);
            } else {
                map.setCenter(place.geometry.location);
                map.setZoom(17);
            }
            mapCenter = place.geometry.location;
            if( marker ){
                marker.setPosition(place.geometry.location);
                marker.setVisible(true);
                $('#latitude').val( marker.getPosition().lat() );
                $('#longitude').val( marker.getPosition().lng() );
            }
            var address = '';
            if (place.address_components) {
                address = [
                    (place.address_components[0] && place.address_components[0].short_name || ''),
                    (place.address_components[1] && place.address_components[1].short_name || ''),
                    (place.address_components[2] && place.address_components[2].short_name || '')
                ].join(' ');
            }
        });

        $('.geo-location').on("click", function(e) {
            e.preventDefault();
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(success);
            } else {
                console.log('Geo Location is not supported');
            }
        });

        function success(position) {
            var locationCenter = new google.maps.LatLng( position.coords.latitude, position.coords.longitude);
            map.setCenter( locationCenter );
            map.setZoom(14);
            if(marker){
                marker.setPosition(locationCenter);
            }

            var geocoder = new google.maps.Geocoder();
            geocoder.geocode({
                "latLng": locationCenter
            }, function (results, status) {
                if (status === google.maps.GeocoderStatus.OK) {
                    var lat = results[0].geometry.location.lat(),
                        lng = results[0].geometry.location.lng(),
                        placeName = results[0].address_components[0].long_name,
                        latlng = new google.maps.LatLng(lat, lng);

                    $("#input-location").val(results[0].formatted_address);
                    var latitudeInput = $('#latitude');
                    var longitudeInput = $("#longitude");
                    if( latitudeInput.length ){
                        latitudeInput.val( marker.getPosition().lat() );
                    }
                    if( longitudeInput.length ){
                        longitudeInput.val( marker.getPosition().lng() );
                    }
                }
            });

        }
    }

}

/*
if( $("#input-location2").length ){
	if( !map ){
		var map = new google.maps.Map(document.getElementById("input-location2"));
	}
	var mapCenter;
	var input = document.getElementById('input-location2');
	var autocomplete = new google.maps.places.Autocomplete(input);
	autocomplete.bindTo('bounds', map);
	google.maps.event.addListener(autocomplete, 'place_changed', function() {
		var place = autocomplete.getPlace();
		if (!place.geometry) {
			return;
		}
	});       
}
*/

function previewImage(input) {
    var ext = $(input).val().split('.').pop().toLowerCase();
    if($.inArray(ext, ['gif','png','jpg','jpeg']) === -1) {
        alert('invalid extension!');
    }
    else {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $(input).parents(".profile-image").find(".image").attr("style", "background-image: url('" + e.target.result + "');" );
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
}

// Viewport ------------------------------------------------------------------------------------------------------------

var viewport = (function() {
    var viewPorts = ['xs', 'sm', 'md', 'lg'];

    var viewPortSize = function() {
        return window.getComputedStyle(document.body, ':before').content.replace(/"/g, '');
    };

    var is = function(size) {
        if ( viewPorts.indexOf(size) === -1 ) throw "no valid viewport name given";
        return viewPortSize() === size;
    };

    var isEqualOrGreaterThan = function(size) {
        if ( viewPorts.indexOf(size) === -1 ) throw "no valid viewport name given";
        return viewPorts.indexOf(viewPortSize()) >= viewPorts.indexOf(size);
    };

    // Public API
    return {
        is: is,
        isEqualOrGreaterThan: isEqualOrGreaterThan
    }

})();
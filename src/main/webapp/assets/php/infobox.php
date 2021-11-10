<?php

$serverName = "localhost";
$username = "root";
$password = "";
$databaseName = "craigs_database";

$currentItem = "";

$connection = mysqli_connect($serverName, $username, $password, $databaseName);
if (!$connection)  die("Connection failed: " . mysqli_connect_error());

mysqli_set_charset($connection, "utf8");

$queryData = mysqli_query( $connection, "SELECT * FROM items WHERE id = " . $_POST['id'] );

//$data = mysqli_fetch_all( $queryData, MYSQLI_ASSOC );
// This is alternative if your server doesn't support "mysqli_fetch_all"
$data = mysqli_fetch_all( $queryData, MYSQLI_ASSOC );

$currentItem = $data[0];

mysqli_close($connection);

// Infobox HTML code

echo
'<a href="'. $currentItem['url'] .'">';
    if( $currentItem['featured'] == 1 ){
        echo
            '<div class="ribbon-featured"><i class="fa fa-thumbs-up"></i></div>';
    }
    echo
    '<div class="infobox" data-id="'. $currentItem['id'] .'">
        <div class="image-wrapper">';
            if( !empty($currentItem['type']) ){
                echo
                '<div class="tag type">'. $currentItem['type'] .'</div>';
            }
            echo
            '<h3>';
                if( !empty($currentItem['category']) ){
                    echo
                        '<span class="tag category">'. $currentItem['category'] .'</span>';
                }
                if( !empty($currentItem['title']) ){
                    echo
                        '<span>'. $currentItem['title'] .'</span>';
                }
            echo
            '</h3>';

            if( !empty($currentItem['price']) ){
                echo
                    '<div class="price">';
                    if( !empty($currentItem['price_appendix']) ){
                        echo
                            '<span class="appendix">'. $currentItem['price_appendix'] .'</span>';
                    }
                    echo
                        '<span>$'. $currentItem['price'] .'</span>';
                echo
                '</div>';
            }

            if( !empty($currentItem["image"]) ){
                echo
                    '<div class="image" style="background-image: url('. $currentItem["image"] .')"></div>';
            }
            echo
            '</div>
        </div>
    </div>
</a>';
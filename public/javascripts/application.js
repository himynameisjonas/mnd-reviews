// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function initialize_show_map(adress) {
    var geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(59.3140065, 18.0568956);
    var myOptions = {
        zoom: 15,
        center: latlng,
        mapTypeControl: false,
        scrollwheel: false,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"),
    myOptions);
    var directionsService = new google.maps.DirectionsService();
    var address = adress+", stockholm"
    geocoder.geocode( { 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
                map: map,
                icon: 'http://google-maps-icons.googlecode.com/files/restaurant.png',
                position: results[0].geometry.location
            });
            var marker = new google.maps.Marker({
                map: map,
                icon: 'http://www.mynewsdesk.com/favicon.png',
                position: latlng
            });
            var request = {
            origin: latlng,
            destination: results[0].geometry.location,
            travelMode: google.maps.DirectionsTravelMode.WALKING
            }
            directionsService.route(request, function(response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    distance = response.routes[0].legs[0].distance.text;
                    duration = response.routes[0].legs[0].duration.text;
                    $("#adress p").last().after($('<p>', { 
                    html: "<strong>Avstånd:</strong> "+distance + " (" + duration +")"
                    }))
                } else {
                  console.log(status)
                }
            });
        } else {
            alert("Adress felaktig, vänligen redigera" + status);
        }
    });
}
function initialize_index_map() {
    var geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(59.3140065, 18.0568956);
    var myOptions = {
        zoom: 14,
        center: latlng,
        mapTypeControl: false,
        scrollwheel: false,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("index_map_canvas"),
    myOptions);
    var marker = new google.maps.Marker({
        map: map,
        icon: 'http://www.mynewsdesk.com/favicon.png',
        position: latlng
    });
    
    $("td.address").each(function(index){
        var url = $(this).siblings(".url").find("a").attr("href")
        var adress = $(this).text()+", stockholm"
        var name = $(this).siblings(".url").find("a").text()
        
        geocoder.geocode( { 'address': adress}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                var marker = new google.maps.Marker({
                    map: map,
                    title: name,
                    icon: 'http://google-maps-icons.googlecode.com/files/restaurant.png',
                    position: results[0].geometry.location
                });
                google.maps.event.addListener(marker, 'click', function() {
                  location.href = url
                });
            }
        });        
    });
}
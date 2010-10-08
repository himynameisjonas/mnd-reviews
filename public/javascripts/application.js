// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function initialize_map() {
    var geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(59.3140065, 18.0568956);
    var myOptions = {
        zoom: 15,
        center: latlng,
        mapTypeControl: false,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"),
    myOptions);
    var address = "<%= @venue.adress %>, stockholm"
    geocoder.geocode( { 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {

            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
                map: map, 
                position: results[0].geometry.location
            });
        } else {
            alert("Adress felaktig, vänligen redigera" + status);
        }
    });
}
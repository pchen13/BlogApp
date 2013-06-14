// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function(){
    setInterval(refreshVisits, 5000);
    $('#image').change(function(){
        readURL(this, '#upload-preview'); 
    });
});
function refreshVisits(){
    $.get('/get_counter', function(data){
        $('.visits span').text(data);
    });
}
function readURL(input, holder) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $(holder).html('<img src="'+e.target.result+'"/>');
        }

        reader.readAsDataURL(input.files[0]);
    }
}

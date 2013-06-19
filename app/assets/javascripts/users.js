//= require 'sidebar'
var id = getBlogId();
$(document).ready(function(){
    setInterval(refreshStats, 5000);
    $('#image').change(function(){
        readURL(this, '#upload-preview'); 
    });
    $('form[search-result-target]').bind('ajax:success', function(evt, data) {
        $('#list').html(data);
    });
});
function readURL(input, holder) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $(holder).html('<img src="'+e.target.result+'"/>');
        }
        reader.readAsDataURL(input.files[0]);
    }
}
// function refreshVisits(){
//     $.get('/blog/'+id+'/visits', function(data){
//         $('.visits span').text(data);
//     });
// }
// function refreshVoteUp(){
//     $.get('/blog/'+id+'/get_vote_up', function(data){
//         console.log(data);
//         $("#voting-status .vote-up span").text(data);
//     });
// }
// function refreshVoteDown(){
//     $.get('/blog/'+id+'/get_vote_down', function(data){
//         console.log(data);
//         $("#voting-status .vote-down span").text(data);
//     });
// }
// function refreshVote(){
//     refreshVoteUp();
//     refreshVoteDown();
// }
// function refreshRating(){
//     if(id > 0){
//         $.get('/blog/'+id+'/get_rating', function(data){
//             $('#rating-status span').text(data);
//         });
//     }
// }
function getBlogId(){
    var url = document.location+"";
    var matches = url.match(/\/blog\/(\d)/);
    if(matches && matches.length > 1)
        return matches[1]
    return 0;
}
function refreshStats(){
  // refreshVisits();
  // refreshRating();
  // refreshVote();
  console.log("refreshing...");
  refresh('.visits span');
  refresh("#voting-status .vote-up span");
  refresh("#voting-status .vote-down span");
  refresh('#rating-status span');
  
}
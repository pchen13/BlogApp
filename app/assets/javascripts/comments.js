$(document).ready(function(){
  setInterval(refreshVote, 5000);
  $(".comment .vote-up button").click(function(){
    var url = $(this).attr("data-url");
    console.log(url);
    $.get(url).fail(function(xhr){ 
      if(xhr.status == 401){
        permissionDenied();
      }
    });
  });
  $(".comment .vote-down button").click(function(){
    var url = $(this).attr("data-url");
    console.log(url);
    $.get(url).fail(function(xhr){ 
      if(xhr.status == 401){
        permissionDenied();
      }
    });
  });
});
function refreshVote(){
  refresh(".comment .vote-up span");
  refresh(".comment .vote-down span");
}
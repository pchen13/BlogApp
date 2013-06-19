$(document).ready(function() {
    $("#blog-stats .rating button").click(function(){
        var url = $(this).attr("data-url")+ $(".rating select").val();
       $.get(url).fail(function(xhr){ 
          if(xhr.status == 401){
            permissionDenied();
          }
        });
    });
    $("#blog-stats .voting .vote-up").click(function(){
        var url = $(this).attr("data-url");
        $.get(url).fail(function(xhr){ 
          if(xhr.status == 401){
            permissionDenied();
          }
        });
    });
    $("#blog-stats .voting .vote-down").click(function(){
        var url = $(this).attr("data-url");
        console.log(url);
        $.get(url).fail(function(xhr){ 
          if(xhr.status == 401){
            permissionDenied();
          }
          
        });
    });
});
// function clickAction(selector, url){
//   $(selector).on('click', function(){
//     $.get(url).fail(function(xhr){ 
//       if(xhr.status == 401){
//         permissionDenied();
//       }
//     });
//   });
// }
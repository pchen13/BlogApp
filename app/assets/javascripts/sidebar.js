$(document).ready(function() {
    $("#blog-actions .rating button").click(function(){
        var url = $(this).attr("data-url")+ $(".rating select").val();
        console.log(url);
        $.get(url).fail(function(xhr){ 
          if(xhr.status == 401){
            permissionDenied();
          }
        });
    });
    $("#blog-actions .voting .vote-up").click(function(){
        var url = $(this).attr("data-url");
        $.get(url).fail(function(xhr){ 
          if(xhr.status == 401){
            permissionDenied();
          }
        });
    });
    $("#blog-actions .voting .vote-down").click(function(){
        var url = $(this).attr("data-url");
        console.log(url);
        $.get(url).fail(function(xhr){ 
          if(xhr.status == 401){
            permissionDenied();
          }
          
        });
    });
});

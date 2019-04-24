$(document).ready(function () {
  
  // jQuery methods go here...
    $("#saveButton").click(function (e) {
      $("tr").each(function( index ) {
        $(this).children("td").each(function(){
          // build call to game_picks API here
        });
      });
      
      // now call the API
    });
  
});
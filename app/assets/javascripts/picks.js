var ready;
ready = function() {
  
  var data = {};
  // jQuery methods go here...
  $("#saveButton").click(function(e) {
    $.blockUI();
    $("tr").each(function(index) {
      var count = 0;
      data = {};
      $(this).children("td").each(function() {
        // build call to game_picks API here
        switch (count) {
          case 0:
            data.team1 = $(this).text();
            break;
          case 1:
            data.team2 = $(this).text();
            break;
          case 2:
            data.gamedatetime = new Date($(this).text());
            break;
          case 3:
            data.week = $(this).text();
            break;
          case 4:
            data.pickedteam = $(this).children("form").children(".pick").val();
            break;
          case 5:
            data.spread = $(this).children("form").children(".spread").val();
            break;
        }
        count++;
      });

      var api_base = document.domain;
      // var api_base = "https://project-footballpicks.herokuapp.com/";
      // now call the API, will call for each row that has TDs
      if (Object.entries(data).length != 0 || data.constructor != Object) {
        $.ajax({
          type: "POST",
          url: "https://" + api_base + "/game_picks.json",
          data: JSON.stringify(data), // now data come in this function
          contentType: "application/json; charset=utf-8",
          crossDomain: false,
          dataType: "json",
          success: function(data, status, jqXHR) {
            //alert("success"); // write success in " "
          },
          error: function(jqXHR, status) {
            // error handler
            console.log(jqXHR);
            //alert('fail' + status.code);
          }
        });
      }
    });
    $.unblockUI();
  });

};

$(document).ready(ready);
$(document).on('turbolinks:load', ready);
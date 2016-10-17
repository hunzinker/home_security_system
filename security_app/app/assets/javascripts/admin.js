var API = API || {};

API.setStatus = function(s) {
  if (s === "armed") {
    $("#security").removeClass("success").addClass("alert").text("System Armed");
  } else {
    $("#security").removeClass("alert").addClass("success").text("System Disarmed");
  }
}

API.setError = function() {
  $("#security-error")
    .html("Something bad happened. Refresh your browser and try again.")
    .show();
}

API.getStatus = function() {
  var res = "";

  if ($("#security").hasClass("success")) {
    res = "armed";
  } else {
    res = "disarmed";
  }
  return res;
}

API.removeActive = function() {
  $(".cameras > dd").removeClass("active");
};

API.getParamByName = function (name) {
  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
  var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
      results = regex.exec(location.search);
  return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

$(function(){
  $("#security").click(function() {
    var currentStatus = API.getStatus();
    $.ajax({
      type: "POST",
      url: "/admins/webcams/toggle",
      data: { status: currentStatus },
      statusCode: {
        200: function() {
          API.setStatus(currentStatus);
        },
        401: function() {
          API.setError();
        },
        422: function() {
          API.setError();
        }
      }
    })
  });

  if (location.href.match("/admins/webcams")) {
    $.get("/admins/webcams/status", function(data) {
      API.setStatus(data);
    });

    var param = API.getParamByName("q");
    if (param.length > 0) {
      $("." + param).addClass("active");
    }

  }

  $(".filter").click(function() {
    API.removeActive();
    $(this).addClass("active");
  });
});


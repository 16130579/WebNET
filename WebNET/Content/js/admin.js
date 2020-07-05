"use strict";

const openCity = (event, idName) => {
  const tabContent = document.querySelectorAll(".tabcontent");
  const tablinks = document.querySelectorAll(".tablinks");
  for (let i = 0; i < tabContent.length; i++) {
    for (let j = 0; j < tablinks.length; j++) {
      tabContent[i].style.display = "none";
      tablinks[j].classList.remove("active");
    }
  }

  document.getElementById(idName).style.display = "block";
  event.currentTarget.className += " active";
};

$(document).ready(function() {
  $("#myInput").on("keyup", function(event) {
    event.preventDefault();
    /* Act on the event */
    var tukhoa = $(this)
      .val()
      .toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle(
        $(this)
          .text()
          .toLowerCase()
          .indexOf(tukhoa) > -1
      );
    });
  });

  $("#categories").change(function() {
    var tuKhoa1 = $("#categories option:selected")
      .val()
      .toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle(
        $(this)
          .text()
          .toLowerCase()
          .indexOf(tuKhoa1) > -1
      );
    });
  });

  $("#status").change(function() {
    var tuKhoa2 = $("#status option:selected")
      .val()
      .toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle(
        $(this)
          .text()
          .toLowerCase()
          .indexOf(tuKhoa2) > -1
      );
    });
  });
});

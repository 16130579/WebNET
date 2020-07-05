"use strict";
const openCity = (event, idName) => {
  const tabContent = document.querySelectorAll(".show");
  const tablinks = document.querySelectorAll(".tab__link");
  for (let i = 0; i < tabContent.length; i++) {
    for (let j = 0; j < tablinks.length; j++) {
      tabContent[i].style.display = "none";
      tablinks[j].classList.remove("active");
    }
  }

  document.getElementById(idName).style.display = "block";
  event.currentTarget.className += " active";
};

// const productItem = document.querySelectorAll(".product-item");
// for (let i = 0; i < productItem.length; i++) {
//   productItem[i].addEventListener("click", e => {
//     window.location.href = "product-detail.html";
//   });
// }

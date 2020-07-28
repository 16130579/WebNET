"use strict";

// hàm scroll
const scrollToTop = () => {
  if (document.body.scrollTop > 35 || document.documentElement.scrollTop > 35) {
    document.getElementById("scrollToTopBtn").style.opacity = "1";
  } else {
    document.getElementById("scrollToTopBtn").style.opacity = "0";
  }
}

document.getElementById("scrollToTopBtn").addEventListener("click", function () {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
});

window.onscroll = () => {
  scrollToTop();
};

//cart
const cartItem = document.querySelector("#clickCart");
const cartContainer = document.querySelector("#cartContainer");
const cartClick = () => {
  if (cartContainer.classList.contains("open")) {
    cartContainer.classList.remove("open");
  } else {
    cartContainer.classList.toggle("open");
  }
};

if (cartItem && cartContainer) {
  cartItem.addEventListener("click", e => {
    e.preventDefault();
    cartClick();
  });
}

const productItem = document.querySelectorAll(".product-item");
for (let i = 0; i < productItem.length; i++) {
  productItem[i].addEventListener("click", () => {
      window.location.href = 'asdasdasdasd.cshtml';
     console.log("a");
  });
}

const viewCartButtonHeader = document.querySelector('#viewCartHeader');
const checkoutButtonHeader = document.querySelector('#checkoutButtonHeader');
viewCartButtonHeader.addEventListener('click', (e) => {
  window.location.href = '';
});

checkoutButtonHeader.addEventListener('click', (e) => {
  window.location.href = '';
});
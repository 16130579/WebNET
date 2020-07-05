'use strict';

// Category click
const categoriesListElement = document.querySelectorAll('#categoriesList>li');

if (categoriesListElement) {
    for (const categories of categoriesListElement) {
        categories.addEventListener('click', e => {
            e.preventDefault();
            for (let i = 0; i < categoriesListElement.length; i++) {
                if (categoriesListElement[i].classList.contains('active')) {
                    categoriesListElement[i].classList.remove('active');
                }
            }
            categories.classList.add('active');
        });
    }
}

// See more btn
const seeMoreBtnElement = document.getElementById('seeMoreBtn');
const productListElement = document.getElementById('productList');
const seeMoreElement = document.querySelector('.see-more__btn');
const hideMoreElement = document.querySelector('.hide-more__btn');
const hideMoreBtnElement = document.getElementById('hideMoreBtn');
if (seeMoreBtnElement && productListElement && seeMoreElement) {
    seeMoreBtnElement.addEventListener('click', e => {
        productListElement.classList.remove('product-list__none');
        seeMoreElement.classList.toggle('see-more__btn--none');
        hideMoreElement.classList.remove('hide-more__btn--none');
    });

    hideMoreBtnElement.addEventListener('click', e => {
        productListElement.classList.toggle('product-list__none');
        seeMoreElement.classList.remove('see-more__btn--none');
        hideMoreElement.classList.toggle('hide-more__btn--none');
    });
}
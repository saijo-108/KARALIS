const CLASSNAME = "-visible";
const $target = $(".bg");

setTimeout(() => {
  $target.addClass(CLASSNAME);
});

const swiper = new Swiper(".swiper", {
  pagination: {
    el: ".swiper-pagination",
    type: "fraction"
  },
  // ナビボタンが必要なら追加
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev"
  }
});

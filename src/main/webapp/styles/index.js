const profile = document.getElementById("profile");
const profileMenu = document.getElementById("profileMenu");
const kitchenCarousel = document.getElementById("kitchenCarousel");
const kitchenImage = document.getElementById("kitchenImage");
const gardenCarousel = document.getElementById("gardenCarousel");
const gardenImage = document.getElementById("gardenImage");
const officeCarousel = document.getElementById("officeCarousel");
const officeImage = document.getElementById("officeImage");
let carouselTimer = null;

profile.addEventListener("click", () => {
  profileMenu.classList.contains("hidden")
    ? profileMenu.classList.remove("hidden")
    : profileMenu.classList.add("hidden");
});

kitchenCarousel.addEventListener("mouseenter", () => {
  let imgNo = 1;
  carouselTimer = setInterval(() => {
    imgNo < 3 ? imgNo++ : (imgNo = 1);
    kitchenImage.src = `./images/home/kitchen-${imgNo}.png`;
  }, 1000);
});
kitchenCarousel.addEventListener("mouseleave", () => {
  kitchenImage.src = "./images/home/kitchen-1.png";
  clearInterval(carouselTimer);
});

gardenCarousel.addEventListener("mouseenter", () => {
  let imgNo = 1;
  carouselTimer = setInterval(() => {
    imgNo < 3 ? imgNo++ : (imgNo = 1);
    gardenImage.src = `./images/home/garden-${imgNo}.png`;
  }, 1000);
});
gardenCarousel.addEventListener("mouseleave", () => {
  gardenImage.src = "./images/home/garden-1.png";
  clearInterval(carouselTimer);
});

officeCarousel.addEventListener("mouseenter", () => {
  let imgNo = 1;
  carouselTimer = setInterval(() => {
    imgNo < 3 ? imgNo++ : (imgNo = 1);
    officeImage.src = `./images/home/office-${imgNo}.png`;
  }, 1000);
});
officeCarousel.addEventListener("mouseleave", () => {
  officeImage.src = "./images/home/office-1.png";
  clearInterval(carouselTimer);
});

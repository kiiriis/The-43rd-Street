const profile = document.getElementById("profile");
const profileMenu = document.getElementById("profileMenu");
const totalAmt = document.getElementById("totalAmt");
const payNow = document.getElementById("payNow");
const cancel = document.getElementById("cancel");

profile.addEventListener("click", () => {
  profileMenu.classList.contains("hidden")
    ? profileMenu.classList.remove("hidden")
    : profileMenu.classList.add("hidden");
});

if (parseInt(totalAmt.innerText) <= 101) {
  payNow.disabled = true;
  cancel.disabled = true;
}
console.log(parseInt(totalAmt.innerText) <= 100)
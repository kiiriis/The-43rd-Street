const profile = document.getElementById("profile");
const profileMenu = document.getElementById("profileMenu");

profile.addEventListener("click", () => {
  profileMenu.classList.contains("hidden")
    ? profileMenu.classList.remove("hidden")
    : profileMenu.classList.add("hidden");
});

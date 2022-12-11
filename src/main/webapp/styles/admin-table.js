const deleteBtns = document.querySelectorAll(".deleteBtn");
const deleteModal = document.querySelector("#delete-modal");
const closeModal = document.querySelector("#close-modal");

deleteBtns.forEach((btn) => {
  btn.addEventListener("click", () => {
    deleteModal.classList.contains("hidden") &&
      deleteModal.classList.remove("hidden");
  });
});

closeModal.addEventListener("click", () => {
  !deleteModal.classList.contains("hidden") &&
    deleteModal.classList.add("hidden");
});

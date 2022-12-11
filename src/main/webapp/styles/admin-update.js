const prodName = document.getElementById("prodName");
const prodPrice = document.getElementById("prodPrice");
const prodDesc = document.getElementById("prodDesc");
const errorPara = document.getElementById("errorPara");
const addBtn = document.getElementById("addBtn");
const addForm = document.getElementById("addForm");
const submit = document.getElementById("submit");

addBtn.addEventListener("click", (e) => {
  e.preventDefault();
  if (prodName.classList.contains("form-input-incorrect")) {
    prodName.classList.remove("form-input-incorrect");
    prodName.classList.add("form-input");
  }
  if (prodPrice.classList.contains("form-input-incorrect")) {
    prodPrice.classList.remove("form-input-incorrect");
    prodPrice.classList.add("form-input");
  }
  if (prodDesc.classList.contains("form-input-incorrect")) {
    prodDesc.classList.remove("form-input-incorrect");
    prodDesc.classList.add("form-input");
  }
  if (!prodName.value) {
    errorPara.innerText = "Enter Product Name";
    errorPara.classList.contains("hidden") &&
      errorPara.classList.remove("hidden");
    prodName.classList.remove("form-input");
    prodName.classList.add("form-input-incorrect");
    return;
  }
  if (!prodPrice.value) {
    errorPara.innerText = "Enter Product Price";
    errorPara.classList.contains("hidden") &&
      errorPara.classList.remove("hidden");
    prodPrice.classList.remove("form-input");
    prodPrice.classList.add("form-input-incorrect");
    return;
  }
  if (!prodDesc.value) {
    errorPara.innerText = "Enter Product Description";
    errorPara.classList.contains("hidden") &&
      errorPara.classList.remove("hidden");
    prodDesc.classList.remove("form-input");
    prodDesc.classList.add("form-input-incorrect");
    return;
  }
  !errorPara.classList.contains("hidden") && errorPara.classList.add("hidden");
  submit.click();
});

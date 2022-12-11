
const username = document.getElementById("username");
const email = document.getElementById("email");
const password = document.getElementById("password");
const confPassword = document.getElementById("confPassword");
const billAdd = document.getElementById("billAdd");
const shipAdd = document.getElementById("shipAdd");
const phone = document.getElementById("phone");
const register = document.getElementById("register");
const submit = document.getElementById("submit");
const errorPara = document.getElementById("errorPara");
const billShipSame = document.getElementById("billShipSame");

function usernameContainsSpace() {
  return username.value.indexOf(" ") >= 0;
}

billShipSame.addEventListener("change", () => {
  if (billShipSame.checked) {
    shipAdd.value = billAdd.value;
  }
});

register.addEventListener("click", (e) => {
  e.preventDefault();
  if (username.classList.contains("form-input-incorrect")) {
    username.classList.remove("form-input-incorrect");
    username.classList.add("form-input");
  }
  if (email.classList.contains("form-input-incorrect")) {
    email.classList.remove("form-input-incorrect");
    email.classList.add("form-input");
  }
  if (password.classList.contains("form-input-incorrect")) {
    password.classList.remove("form-input-incorrect");
    password.classList.add("form-input");
  }
  if (confPassword.classList.contains("form-input-incorrect")) {
    confPassword.classList.remove("form-input-incorrect");
    confPassword.classList.add("form-input");
  }
  if (billAdd.classList.contains("form-input-incorrect")) {
    billAdd.classList.remove("form-input-incorrect");
    billAdd.classList.add("form-input");
  }
  if (shipAdd.classList.contains("form-input-incorrect")) {
    shipAdd.classList.remove("form-input-incorrect");
    shipAdd.classList.add("form-input");
  }
  if (phone.classList.contains("form-input-incorrect")) {
    phone.classList.remove("form-input-incorrect");
    phone.classList.add("form-input");
  }
  if (!username.value) {
    errorPara.innerText = "Enter Your Username";
    errorPara.classList.contains("hidden") &&
      errorPara.classList.remove("hidden");
    username.classList.remove("form-input");
    username.classList.add("form-input-incorrect");
    return;
  } else if (usernameContainsSpace()) {
    errorPara.innerText = "Username Cannot Contain Spaces";
    errorPara.classList.contains("hidden") &&
      errorPara.classList.remove("hidden");
    username.classList.remove("form-input");
    username.classList.add("form-input-incorrect");
    return;
  }
  if (!email.value) {
    errorPara.innerText = "Enter Your Email";
    errorPara.classList.contains("hidden") &&
      errorPara.classList.remove("hidden");
    email.classList.remove("form-input");
    email.classList.add("form-input-incorrect");
    return;
  }
  if (!password.value) {
    errorPara.innerText = "Enter Your Password";
    errorPara.classList.contains("hidden") &&
      errorPara.classList.remove("hidden");
    password.classList.remove("form-input");
    password.classList.add("form-input-incorrect");
    return;
  } else if (password.value.length < 8 || password.value.length > 64) {
    errorPara.innerText = "Password Needs to be Between 8-64 Characters Long";
    errorPara.classList.contains("hidden") &&
      errorPara.classList.remove("hidden");
    password.classList.remove("form-input");
    password.classList.add("form-input-incorrect");
    return;
  }
  if (!confPassword.value) {
    errorPara.innerText = "Confirm Your Password";
    errorPara.classList.contains("hidden") &&
      errorPara.classList.remove("hidden");
    confPassword.classList.remove("form-input");
    confPassword.classList.add("form-input-incorrect");
    return;
  } else if (confPassword.value !== password.value) {
    errorPara.innerText = "Your Passwords Don't Match.";
    errorPara.classList.contains("hidden") &&
      errorPara.classList.remove("hidden");
    confPassword.classList.remove("form-input");
    confPassword.classList.add("form-input-incorrect");
    return;
  }
  if (!billAdd.value) {
    errorPara.innerText = "Enter Your Billing Address";
    errorPara.classList.contains("hidden") &&
      errorPara.classList.remove("hidden");
    billAdd.classList.remove("form-input");
    billAdd.classList.add("form-input-incorrect");
    return;
  }
  if (!shipAdd.value) {
    errorPara.innerText = "Enter Your Shipping Address";
    errorPara.classList.contains("hidden") &&
      errorPara.classList.remove("hidden");
    shipAdd.classList.remove("form-input");
    shipAdd.classList.add("form-input-incorrect");
    return;
  }
  if (!phone.value) {
    errorPara.innerText = "Enter Your Phone Number";
    errorPara.classList.contains("hidden") &&
      errorPara.classList.remove("hidden");
    phone.classList.remove("form-input");
    phone.classList.add("form-input-incorrect");
    return;
  } else if (!phone.value.match(/^\d{10}$/)) {
    errorPara.innerText = "Please Enter 10 Digits Only in the Phone Field";
    errorPara.classList.contains("hidden") &&
      errorPara.classList.remove("hidden");
    phone.classList.remove("form-input");
    phone.classList.add("form-input-incorrect");
    return;
  }
  !errorPara.classList.contains("hidden") && errorPara.classList.add("hidden");
  submit.click();
});

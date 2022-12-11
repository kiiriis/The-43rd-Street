
const username = document.getElementById("username");
const password = document.getElementById("password");
const login = document.getElementById("login");
const submit = document.getElementById("submit");
const errorPara = document.getElementById("errorPara");
const billShipSame = document.getElementById("billShipSame");


function usernameContainsSpace() {
  return username.value.indexOf(" ") >= 0;
}

login.addEventListener("click", (e) => {
  e.preventDefault();
  if (username.classList.contains("form-input-incorrect")) {
    username.classList.remove("form-input-incorrect");
    username.classList.add("form-input");
  }
  if (password.classList.contains("form-input-incorrect")) {
    password.classList.remove("form-input-incorrect");
    password.classList.add("form-input");
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
  !errorPara.classList.contains("hidden") && errorPara.classList.add("hidden");
  submit.click();
});

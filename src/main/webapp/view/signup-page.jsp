<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Sign Up</title>
<link rel="stylesheet" href="/styles/styles.css" />
<script src="/styles/signup.js" defer></script>
</head>
<body
	class="scrollbar-thin scrollbar-thumb-gray-900 scrollbar-track-gray-300 hover:scrollbar-thumb-gray-700 bg-gray-200 font-primary text-primary caret-gray-700 selection:bg-gray-500 selection:text-white">
	<nav
		class="bg-white w-screen flex justify-center items-center px-36 py-5 sticky top-0 z-50">
		<h4 class="font-logo text-[#585858]">The 43rd Street</h4>
	</nav>

	<main class="px-36 py-10 min-h-[calc(100vh-10rem)]">
		<div class="bg-white rounded-xl px-10 py-10 w-1/3 mx-auto">
			<h1 class="text-3xl font-bold text-center">Sign Up</h1>
			<form:form action="saveCustomer" modelAttribute="custModel"
				class="flex flex-col gap-5 mt-6" id="registerForm">
				<div class="flex flex-col">
					<label for="username" class="form-label"> Username </label>
					<form:input path="userName" name="username" id="username"
						class="form-input" />
					<form:errors path="userName"/>
				</div>
				<div class="flex flex-col">
					<label for="email" class="form-label"> Email </label>
					<form:input type="email" path="mail" name="email" id="email"
						class="form-input" />
				</div>
				<div class="flex flex-col">
					<label for="password" class="form-label"> Password </label>
					<form:password path="password" name="password" id="password"
						class="form-input" />
				</div>
				<div class="flex flex-col">
					<label for="confPassword" class="form-label"> Confirm
						Password </label> <input type="password" name="confPassword"
						id="confPassword" class="form-input" />
				</div>
				<div class="flex flex-col">
					<label for="billAdd" class="form-label"> Billing Address </label>
					<form:input type="text" name="billAdd" id="billAdd"
						class="form-input" path="billingAddress" />
				</div>
				<div class="flex flex-col">
					<label for="shipAdd" class="form-label"> Shipping Address </label>
					<form:input type="text" path="shippingAddress" name="shipAdd"
						id="shipAdd" class="form-input" />
					<div class="flex gap-3 items-center mt-2">
						<input type="checkbox" name="billShipSame" id="billShipSame"
							class="checked:bg-primary checked:hover:bg-[#616161] checked:active:bg-[#303030] focus:ring-primary focus:checked:bg-primary rounded focus:checked:hover:bg-[#616161] focus:checked:active:bg-[#303030] border-gray-400" />
						<label for="billShipSame" class="text-sm text-primary/70">Same
							as Billing Address</label>
					</div>
				</div>
				<div class="flex flex-col">
					<label for="phone" class="form-label"> Phone </label>
					<form:input path="phoneNumber" type="tel" name="phone" id="phone"
						class="form-input" />
				</div>
				<p id="errorPara"
					class="text-center text-rose-500 leading-tight hidden"></p>
				<button
					class="bg-primary text-white py-2 rounded-md font-semibold uppercase tracking-wider hover:bg-[#616161] active:bg-[#303030]"
					id="register">Register</button>
				<button type="submit" class="hidden" id="submit"></button>
				<p class="text-xs">
					Already a user? <a href="/"
						class="underline underline-offset-1 font-bold">Login</a>
				</p>
			</form:form>
		</div>
	</main>

	<footer class="mt-auto w-screen bg-white">
		<div
			class="flex justify-center gap-56 font-bold items-center px-36 py-5">
			<span>Easy Returns</span><span>Authentic Brands</span><span>Affordable
				Prices</span>
		</div>
		<hr class="w-screen" />
		<div class="flex px-36 py-5 justify-between">
			<div class="flex items-center gap-2">
				<img src="./images/icons/instagram.svg" alt="Instagram"
					class="w-7 h-7 cursor-pointer" /> <img
					src="./images/icons/facebook.svg" alt="Facebook"
					class="w-[1.45rem] h-[1.45rem] cursor-pointer" /> <img
					src="./images/icons/twitter.svg" alt="Twitter"
					class="w-7 h-7 cursor-pointer" />
			</div>
			<p class="text-[#999999]">@2022 The 43rd Street | All Right
				Reserved</p>
		</div>
	</footer>
</body>
</html>
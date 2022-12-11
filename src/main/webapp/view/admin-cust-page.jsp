<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/styles/styles.css" />
<title>${customer.userName}'s Profile</title>
<script src="/styles/login.js" defer></script>
</head>
<body
	class=" scrollbar-thin scrollbar-thumb-gray-900 scrollbar-track-gray-300 hover:scrollbar-thumb-gray-700 bg-gray-200 font-primary text-primary caret-gray-700 selection:bg-gray-500 selection:text-white h-screen scrollbar-thin scrollbar-thumb-gray-900 scrollbar-track-gray-300 hover:scrollbar-thumb-gray-700">
	<header
		class="py-8 px-36 flex justify-between bg-gray-100 sticky top-0 z-10">
		<h1 class="text-3xl text-center font-bold">${customer.userName}'s Profile</h1>
		<a href="/admin/viewOrders"><button
			class="underline underline-offset-1 decoration-primary hover:text-gray-500 hover:decoration-gray-500 focus:outline-none focus:ring-2 focus:ring-primary px-4 py-2 rounded-md">
			Back</button></a>
	</header>
	<main class="px-36 flex flex-col mt-10 gap-5">
		<div
			class="bg-white rounded-md p-10 w-1/3 mx-auto flex gap-5 flex-col">
			<div class="flex justify-between gap-8">
				<p class="font-bold">Username:</p>
				<p class="text-right">${customer.userName}</p>
			</div>
			<div class="flex justify-between gap-8">
				<p class="font-bold">Phone:</p>
				<p class="text-right">${customer.phoneNumber}</p>
			</div>
			<div class="flex justify-between gap-8">
				<p class="font-bold">Email:</p>
				<p class="text-right">${customer.mail}</p>
			</div>
			<div class="flex justify-between gap-8">
				<p class="font-bold">Billing Address:</p>
				<p class="text-right">${customer.billingAddress}</p>
			</div>
			<div class="flex justify-between gap-8">
				<p class="font-bold">Shipping Address:</p>
				<p class="text-right">${customer.shippingAddress}</p>
			</div>
		</div>
	</main>
</body>
</html>

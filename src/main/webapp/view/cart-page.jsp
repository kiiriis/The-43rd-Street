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
<script src="/styles/cart.js" defer></script>
<title>Cart</title>
</head>
<body
	class=" scrollbar-thin scrollbar-thumb-gray-900 scrollbar-track-gray-300 hover:scrollbar-thumb-gray-700 bg-gray-200 font-primary text-primary caret-gray-700 selection:bg-gray-500 selection:text-white">
	<nav
		class="bg-white w-screen flex justify-between items-center px-36 py-5 sticky top-0 z-50">
		<h4 class="font-logo text-[#585858]">The 43rd Street</h4>
		<div class="relative">
			<input type="text" name="search" id="search"
				class="bg-[#F2F2F2] border-0 rounded-md pl-9 w-64 h-10 focus:outline-none focus:ring-2 focus:ring-gray-500" />
			<img src="./images/icons/search.svg"
				class="absolute top-1/2 left-2 w-6 h-6 -translate-y-1/2" />
		</div>
		<div class="flex items-center gap-5">
			<div class="flex text-sm gap-5">
				<a href="homePage">
					<h4 class="cursor-pointer">Home</h4>
				</a> <a href="kitchenPage">
					<h4 class=" cursor-pointer">Kitchen</h4>
				</a> <a href="gardenPage">
					<h4 class="cursor-pointer">Garden</h4>
				</a> <a href="officePage">
					<h4 class="cursor-pointer">Office</h4>
				</a>
			</div>
			<div class="self-stretch w-[1.5px] bg-primary"></div>
			<div class="flex gap-3 items-center">
				<div class="relative">
					<img src="./images/icons/user.svg" alt="Profile"
						class="w-7 h-7 cursor-pointer" id="profile" />
					<div
						class="w-40 h-40 absolute bg-white border border-gray-300 rounded-md left-1/2 top-full translate-y-1 -translate-x-1/2 flex flex-col justify-evenly items-center hidden"
						id="profileMenu">
						<span><a href="/viewOrders">Orders</a></span>
						<hr class="w-full border-gray-300" />
						<span> <a href="logout">Logout</a></span>
					</div>
				</div>
				<div>
					<img src="./images/icons/cart.svg" alt="Cart"
						class="w-7 h-7 cursor-pointer" />
				</div>
			</div>
		</div>
	</nav>

	<main
		class="px-36 py-10 w-full h-full flex gap-5 relative min-h-[calc(100vh-10rem)]">
		<div class="flex-1 space-y-5">
			<c:forEach var="tempCart" items="${cartItems}">
				<c:url var="deleteLink" value="/cart/delete">
					<c:param name="productId" value="${tempCart.key.id}" />
					<c:param name="productCategory" value="${tempCart.value.category}" />
				</c:url>
				<div
					class=" bg-white flex justify-between items-center gap-5 rounded-md overflow-hidden pr-5">
					<img src="data:image/jpeg;base64,${tempCart.key.image}"
						class="w-1/5 h-32 object-cover object-center" />
					<div class="flex gap-5 justify-between items-center w-4/5">
						<h2 class="text-xl font-bold flex-1">${tempCart.key.name}</h2>
						<div class="flex items-center gap-1">
							<p>Rs.${tempCart.key.price}</p>
							<p class="text-sm">x${tempCart.value.quantity}</p>
						</div>
						<a href="${deleteLink}"
							onclick="if (!(confirm('Are you sure you want to delete this product from the cart?'))) return false"><button
								class="bg-rose-400 px-4 py-2 text-white rounded-md hover:bg-rose-500 active:bg-rose-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-rose-400 deleteBtn">
								Remove</button></a>
					</div>
				</div>
			</c:forEach>
		</div>
		<div
			class="bg-white rounded-md p-5 flex flex-col gap-5 justify-between sticky top-28 z-20 self-start">
			<div>
				<h2 class="font-bold text-xl">Total Bill</h2>
				<div class="h-[1px] w-full bg-primary/50 mt-1"></div>
			</div>
			<div>
				<div class="flex justify-between gap-8">
					<span>Total:</span><span>Rs. ${totalBill}</span>
				</div>
				<div class="flex justify-between gap-8">
					<span>CGST:</span><span>+ 2.5%</span>
				</div>
				<div class="flex justify-between gap-8">
					<span>SGST:</span><span>+ 2.5%</span>
				</div>
				<div class="flex justify-between gap-8">
					<span>Delivery Charge:</span><span>+ Rs. 100</span>
				</div>
				<div class="flex justify-between gap-8">
					<span>Net Total:</span><span>Rs. <span id="totalAmt">${(totalBill*0.05)+100+totalBill}</span></span>
				</div>
			</div>
			<div class="flex gap-3 justify-between">
			
				<c:url var="processOrder" value="/cart/processOrder">
					<c:param name="totalBill" value="${(totalBill*0.05)+100+totalBill}" />
				</c:url>
					<a href="${processOrder}"><button
							class="bg-gray-600 hover:bg-gray-700 active:bg-gray-800 text-white px-4 py-2 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-600 disabled:bg-gray-400 disabled:cursor-not-allowed"
							id="payNow">Pay Now</button></a>

				<a href="/cancelOrder"
					onclick="if (!(confirm('Are you sure you want to cancel the order? All the content of the cart will be deleted.'))) return false"><button
						class="border-2 border-gray-600 hover:border-gray-500 active:border-gray-400 hover:text-gray-500 active:text-gray-400 text-primary px-4 py-2 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-600 hover:border-current disabled:border-gray-400 disabled:text-gray-400 disabled:cursor-not-allowed"
						id="cancel">Cancel Order</button></a>
			</div>
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

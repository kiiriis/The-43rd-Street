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
<script src="/styles/orders.js" defer></script>
<title>Orders</title>
</head>
<body
	class="scrollbar-thin scrollbar-thumb-gray-900 scrollbar-track-gray-300 hover:scrollbar-thumb-gray-700 bg-gray-200 font-primary text-primary caret-gray-700 selection:bg-gray-500 selection:text-white">
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
				<a href="homePage"><h4 class="cursor-pointer">Home</h4></a>
				<a href="kitchenPage">
					<h4 class="cursor-pointer">Kitchen</h4>
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
				<div class="">
					<a href="/viewCart"><img src="./images/icons/cart.svg"
						alt="Cart" class="w-7 h-7 cursor-pointer" /></a>
				</div>
			</div>
		</div>
	</nav>

	<main class="px-36 py-10 w-full h-full min-h-[calc(100vh-10rem)]">
		<h1 class="font-bold text-4xl text-center">Order History</h1>
		<div class="mt-8 flex flex-wrap gap-5 mx-auto">
			<c:forEach var="order" items="${orders}">
				<div
					class="bg-white rounded-md overflow-hidden p-5 flex flex-col justify-between gap-8 h-60 transition hover:scale-105 duration-300 ease-out">
					<div class="text-xs flex justify-between items-center gap-5">
						<p>Order Id: ${order.orderId }</p>
						<p>${order.orderDate}</p>
					</div>

					<div
						class="self-center overflow-scroll scrollbar-thin scrollbar-thumb-gray-900 scrollbar-track-gray-300 hover:scrollbar-thumb-gray-700 px-5">

						<c:forEach var="tmp" items="${custOrders}">
							<c:set var="oId" value="${tmp.key.orderId}" scope="session" />
							<c:if test="${oId == order.orderId}">
								<div class="flex items-center gap-5 justify-between">
									<h3 class="font-bold text-lg">
										<c:out value="${tmp.value.name}" />
									</h3>
									<p class="">
										Rs.
										<c:out value="${tmp.value.price}" />
										<span class="text-xs">x <c:out
												value="${tmp.key.quantity}" /></span>
									</p>
								</div>
							</c:if>
						</c:forEach>

					</div>

					<div class="text-right font-bold text-xs self-end">Total
						Price: Rs. ${order.totalBill}</div>
				</div>
			</c:forEach>
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

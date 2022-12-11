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
<title>All orders</title>
</head>
<body
	class=" scrollbar-thin scrollbar-thumb-gray-900 scrollbar-track-gray-300 hover:scrollbar-thumb-gray-700 bg-gray-200 font-primary text-primary caret-gray-700 selection:bg-gray-500 selection:text-white h-screen scrollbar-thin scrollbar-thumb-gray-900 scrollbar-track-gray-300 hover:scrollbar-thumb-gray-700">
	<header
		class="py-8 px-36 flex justify-between bg-gray-100 sticky top-0 z-10">
		<h1 class="text-3xl text-center font-bold">User Orders</h1>
		<a href="/admin"><button
				class="underline underline-offset-1 decoration-primary hover:text-gray-500 hover:decoration-gray-500 focus:outline-none focus:ring-2 focus:ring-primary px-4 py-2 rounded-md">
				Back to Panel</button></a>
	</header>
	<main class="px-36 flex flex-col my-5 gap-5">
		<c:forEach var="temp" items="${orders}">
			<c:url value="/admin/viewCustomer" var="customerLink">
				<c:param name="customerId" value="${temp.customer}" />
			</c:url>
			<div
				class="bg-white flex justify-between items-center rounded-md overflow-hidden p-5 transition hover:scale-105 duration-300 ease-out">
				<p>
					<span class="font-bold">Order Id:</span> ${temp.orderId}
				</p>
				<a href="${customerLink}"><p
						class="underline underline-offset-1 decoration-primary/30 hover:decoration-primary/100 cursor-pointer decoration-1">
						<span class="font-bold">Customer Id:</span> ${temp.customer}
					</p></a>
				<p>
					<span class="font-bold">Order Date:</span> ${temp.orderDate}
				</p>
				<p>
					<span class="font-bold">Total Bill:</span> Rs. ${temp.totalBill}
				</p>
			</div>
		</c:forEach>
	</main>
	<footer class="w-full h-[1px]"></footer>
</body>
</html>

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
<script src="/styles/admin-table.js" defer></script>
<title>View Kitchen Products</title>
</head>
<body
	class="scrollbar-thin scrollbar-thumb-gray-900 scrollbar-track-gray-300 hover:scrollbar-thumb-gray-700 bg-gray-200 font-primary text-primary caret-gray-700 selection:bg-gray-500 selection:text-white h-screen scrollbar-thin scrollbar-thumb-gray-900 scrollbar-track-gray-300 hover:scrollbar-thumb-gray-700">
	<header
		class="py-8 px-36 flex justify-between bg-gray-100 sticky top-0 z-10">
		<a href="/admin/addKitchenItem"><button
				class="bg-gray-600 hover:bg-gray-700 active:bg-gray-800 text-white px-4 py-2 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-600">
				Add More Products</button></a>
		<h1 class="text-3xl text-center font-bold">Kitchen Products</h1>
		<a href="/admin"><button
				class="underline underline-offset-1 decoration-primary hover:text-gray-500 hover:decoration-gray-500 focus:outline-none focus:ring-2 focus:ring-primary px-4 py-2 rounded-md">
				Back to Panel</button></a>
	</header>
	<main class="px-36 flex flex-col my-5 gap-5">
		<c:forEach var="temp" items="${products}">
			<c:url var="updateLink" value="/Kitchenproducts/update">
				<c:param name="productId" value="${temp.id}" />
			</c:url>

			<!-- construct an "delete" link with customer id -->
			<c:url var="deleteLink" value="/Kitchenproducts/delete">
				<c:param name="productId" value="${temp.id}" />
			</c:url>
			<div
				class="bg-white flex justify-between items-center gap-5 rounded-md overflow-hidden pr-5">
				<img src="data:image/jpeg;base64,${temp.image}" alt="Fork"
					class="w-1/5 h-32 object-cover object-center" />
				<div class="flex gap-5 justify-between items-center w-4/5">
					<h2 class="text-xl font-bold">${temp.name}</h2>
					<p class="text-sm truncate flex-1">${temp.description}</p>
					<p>Rs. ${temp.price}</p>
					<a href="${updateLink}"><button
							class="bg-cyan-400 px-4 py-2 text-white rounded-md hover:bg-cyan-500 active:bg-cyan-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-cyan-400">
							Update</button></a> <a href="${deleteLink}"
						onclick="if (!(confirm('Are you sure you want to delete this product?'))) return false"><button
							class="bg-rose-400 px-4 py-2 text-white rounded-md hover:bg-rose-500 active:bg-rose-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-rose-400 deleteBtn">
							Delete</button></a>
				</div>
			</div>
		</c:forEach>
	</main>
	<footer class="w-full h-[1px]"></footer>
</body>
</html>
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
<link rel="stylesheet" href="styles/styles.css" />
<script src="styles/admin.js" defer></script>
<title>Admin Panel</title>
</head>

<body
	class=" scrollbar-thin scrollbar-thumb-gray-900 scrollbar-track-gray-300 hover:scrollbar-thumb-gray-700 bg-gray-200 font-primary text-primary caret-gray-700 selection:bg-gray-500 selection:text-white h-screen">
	<header class="bg-gray-100 py-8 px-36 flex justify-between">
		<div>
			<h4 class="font-logo text-[#585858]">The
					43rd Street</h4>
			<h1 class="text-3xl font-bold">Welcome Admin</h1>
		</div>
		<a href="/logout">
			<button
				class="underline underline-offset-1 decoration-primary hover:text-gray-500 hover:decoration-gray-500 focus:outline-none focus:ring-2 focus:ring-primary px-4 py-2 rounded-md">
				Logout</button>
		</a>
	</header>
	<div
		class="flex justify-around h-[calc(100%-6rem)] divide-x-4 divide-gray-100 items-center select-none">
		<div
			class="w-full h-full flex justify-center items-center cursor-pointer hover:bg-gray-300 transition duration-300 ease-out relative"
			id="modify">
			<h2 class="text-4xl font-light">Table View</h2>
			<div
				class="absolute rounded-md divide-y-2 divide-gray-300 justify-between h-1/2 w-1/2 bg-gray-100 flex flex-col items-center hidden overflow-hidden"
				id="modify-options" onclick="event.stopPropagation()">
				<a href="/admin/tableView/kitchen"
					class="w-full h-full flex justify-center items-center hover:bg-gray-200 transition duration-300 ease-out px-5">
					<h3 class="text-xl">Kitchen</h3>
				</a> <a href="/admin/tableView/garden"
					class="w-full h-full flex justify-center items-center hover:bg-gray-200 transition duration-300 ease-out px-5">
					<h3 class="text-xl">Garden</h3>
				</a> <a href="/admin/tableView/office"
					class="w-full h-full flex justify-center items-center hover:bg-gray-200 transition duration-300 ease-out px-5">
					<h3 class="text-xl">Office</h3>
				</a>
			</div>
		</div>

		<div
			class="w-full h-full flex justify-center items-center cursor-pointer hover:bg-gray-300 transition duration-300 ease-out"
			id="orders">
			<a href="/admin/viewOrders">
				<h2 class="text-4xl font-light">View Orders</h2>
			</a>
		</div>

	</div>
</body>

</html>
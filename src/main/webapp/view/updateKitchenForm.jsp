
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
<script src="/styles/admin-update.js" defer></script>
<title>Update Kitchen Item</title>
</head>
<body
	class="scrollbar-thin scrollbar-thumb-gray-900 scrollbar-track-gray-300 hover:scrollbar-thumb-gray-700 bg-gray-200 font-primary text-primary caret-gray-700 selection:bg-gray-500 selection:text-white h-screen flex items-center justify-center p-2">
	<div
		class="bg-white rounded-xl px-10 py-10 w-3/12 overflow-hidden my-4">
		<h1 class="text-3xl font-bold text-center">Update Item</h1>
		<form:form enctype="multipart/form-data" action="/saveKitchenProduct" modelAttribute="prodModel"
			class="flex flex-col gap-4 mt-6" id="addForm" method="post">
			<form:hidden path="id" />
			<div class="flex flex-col">
				<label for="prodName" class="form-label"> Product Name </label>
				<form:input path="name" type="text" name="prodName" id="prodName"
					class="form-input" />
			</div>
			<div class="flex flex-col">
				<label for="prodPrice" class="form-label"> Product Price </label>
				<form:input path="price" type="number" min="0"
					oninput="this.value = !!this.value && Math.abs(this.value) >= 0 ? Math.abs(this.value) : null"
					name="prodPrice" id="prodPrice" class="form-input" />
			</div>
			<div class="flex flex-col">
				<label for="prodDesc" class="form-label"> Product
					Description </label>
				<form:textarea path="description" name="prodDesc" id="prodDesc"
					cols="30" rows="3"
					class="form-input resize-none overflow-scroll scrollbar-thin scrollbar-thumb-gray-500 scrollbar-track-gray-200"></form:textarea>
			</div>
			<div class="flex flex-col">
				<label for="prodFile" class="form-label"> Product Image </label> <input
					type="file" name="prodFile" id="prodFile"
					class="text-sm w-full mt-2" />
			</div>

			<p id="errorPara"
				class="text-center text-sm text-rose-500 leading-tight hidden"></p>
			<button
				class="bg-primary text-white py-2 rounded-md font-semibold uppercase tracking-wider hover:bg-[#616161] active:bg-[#303030]"
				id="addBtn">Update</button>
			<button type="submit" class="hidden" id="submit"></button>
		</form:form>
	</div>
</body>
</html>

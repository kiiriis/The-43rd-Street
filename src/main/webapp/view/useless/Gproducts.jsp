<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Garden Product List</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>Image</th>
				<th>Name</th>
				<th>Descriptions</th>
				<th>Price</th>
			</tr>
		</thead>
		<c:forEach var="temp" items="${products}">
			<c:url var="updateLink" value="/Gardenproducts/update">
				<c:param name="productId" value="${temp.id}" />
			</c:url>

			<!-- construct an "delete" link with customer id -->
			<c:url var="deleteLink" value="/Gardenproducts/delete">
				<c:param name="productId" value="${temp.id}" />
			</c:url>
			<tr>
				<td><img width="25%" src="data:image/jpeg;base64,${temp.image}">
				<td>
				<td>${temp.name}</td>
				<td>${temp.description}</td>
				<td>${temp.price}</td>
				<td><a href="${deleteLink}"
					onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">
						Delete </a></td>
				<td><a href="${updateLink}"> Update </a></td>
			</tr>
		</c:forEach>
	</table>
	<a href="/addGardenProduct"><button>Add product</button></a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Garden products</title>
</head>
<body>
	<form:form action="/saveGardenProduct" enctype="multipart/form-data" modelAttribute="prodModel">
		<label for="name">Product Name</label>
		<form:input id="name" path="name" />
		<br>
		<label for="price">Product Price</label>
		<form:input id="price" path="price" />
		<br>
		<label for="description">Product Description</label>
		<form:input id="description" path="description" />
		<br>
		<input type="file" name="file" id="customFile">
		<input type="submit" value="Add product">
	</form:form>
</body>
</html>
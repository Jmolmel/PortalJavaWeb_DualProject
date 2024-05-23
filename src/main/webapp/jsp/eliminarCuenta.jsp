<%@page import="com.accenture.portal.services.ServicesModels"%>
<%@page import="com.accenture.portal.models.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1" name="viewport"
		content="width=device-width, initial-scale=1.25, maximum-scale=1">
	<!-- CSS -->
	<link href="${pageContext.request.contextPath}/styles/styleRegister.css" rel="stylesheet">
	<!-- FONTS -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100..900;1,100..900&display=swap"
		rel="stylesheet">
	<!-- FAVICON -->
	<link rel="icon" type="image/x-icon" href="../images/accFavicon.jpg">
	<title>Eliminar cuenta</title>
	<%
User activeUser= (User) request.getSession().getAttribute("user");
String color = ServicesModels.defineColor(activeUser.getCenter());
%>
<style>.login a:hover {
		color: <%=color %>;
	}
	
	input, select {
		border: 1.8px <%=color %> solid;
	}
	
	.input_container input:focus, .input_container select:focus {
	    border-color: <%=color %>;
	    box-shadow: 0 0 5px <%=color%>;
	    outline: none;
	}
	
	.register-button::after {
		background-color: <%=color %>;
	}
	
	.register-button::before {
	  background-color: red;
	}
	
	footer {
		color: <%=color %>;
	}
	
	#mainContainer h2 {
		margin-top: 50px ;
		margin-bottom: 25px ;
	}
	.h2{
	color: <%=color %>;
	}
</style>
</head>
 
<body>
	<div id="mainContainer">	
		<h2>Eliminar cuenta</h2>

		<form action="${pageContext.request.contextPath}/deleteUser" method="post" class="login" >
		
			<div class="input_container2">
				<h3>¿Está seguro de que desea eliminar su cuenta?</h3>
			</div>
			<button id="changeButton" type="submit" class="register-button container-button">ELIMINAR CUENTA</button>	
		</form>
	</div>

	<footer>
		<p>Aplicación creada por <strong>Grupo La Rubia & co</strong></p>
	</footer>

	<script src="${pageContext.request.contextPath}/scripts/registerValidations2.js"></script>
</body>
</html>
<%@page import="com.accenture.portal.services.ServicesModels"%>
<%@page import="com.accenture.portal.models.School"%>
<%@page import="com.accenture.portal.models.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%
User activeUser = (User) session.getAttribute("user");
School sch = ServicesModels.getInfoSchool(activeUser.getCenter());
String imagen = ServicesModels.defineImageCenter(activeUser.getCenter());
String mapLink = ServicesModels.defineMap(sch.getIdSchool());
String color = ServicesModels.defineColor(activeUser.getCenter());
%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="../styles/styleCentro.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/x-icon" href="./images/accFavicon.jpg">
<meta charset="UTF-8	">
<title>Portal - Inicio</title>
	<style type="text/css">
#descriptionUnderline {
	border-bottom: solid <%=color%> 2px;
}
h4{
	background-color: <%=color%>;
}	
</style>
</head>
<body>

	<div class="contenedorPrincipal">
		<div class="headerContenedor">
			<h2 id="schoolTitle"><%=sch.getNombreSchool()%></h2>
			<img src="<%=imagen%>">
		</div>
			<h4>Informacion de contacto</h4>
			<table>
				<tr>
					<th>N�mero de tel�fono:</th>
					<th class="tableContent"><%=sch.getTlfSchool()%></th>
				</tr>
				<tr>
					<th>Email :</th>
					<th class="tableContent"><%=sch.getEmail()%></th>
				</tr>
				<tr>
					<th>Horarios de Secretar�a :</th>
					<th class="tableContent"><%=sch.getScheduleSchool()%></th>
				</tr>
				<tr>
					<th>Municipio :</th>
					<th class="tableContent"><%=sch.getLocSchool()%></th>
				</tr>
			</table>
			<h4>�C�mo llegar?</h4>
			<iframe src=<%=mapLink%> class="mapaEscuela" width="1000" height="500"
				style="border: 0;" allowfullscreen="" loading="lazy"
				referrerpolicy="no-referrer-when-downgrade"></iframe>
		</div>
</body>
</html>
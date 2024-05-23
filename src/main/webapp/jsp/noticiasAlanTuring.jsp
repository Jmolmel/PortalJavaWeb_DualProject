<%@page import="com.accenture.portal.services.ServicesModels"%>
<%@page import="com.accenture.portal.models.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>

<%
	User activeUser= (User) request.getSession().getAttribute("user");
	String color = ServicesModels.defineColor(activeUser.getCenter());
%>

<!DOCTYPE html>
<html>
<head>
<link href="../styles/styleNoticias.css" rel="stylesheet">

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
#descriptionUnderline {
	border-bottom: solid <%=color%> 2px;
}
img {
	border:  <%=color%> 2px solid ;
}
.cont{
	-webkit-box-shadow: 21px 23px 0 -5px <%=color%>;
	-moz-box-shadow: 21px 23px 0 -5px <%=color%>;
	box-shadow: 21px 23px 0 -5px rgba <%=color%>;
}
hr{
	color: <%=color%>;
	background-color: <%=color%>;
}
</style>
</head>
<body>
	<div class="cont" >
		<h1>Charla de Ciberseguridad</h1>
		<h3>Son alumnos del master de ciberseguridad explicando a sus compa�eros de FP</h3>
		
		<div class="imagen">
			<img alt="Clasificados" src="../images/noticiaAlanTuring.jpg">
		</div>
		<div class="linea">
			<hr >
		</div>
		<div class="desarrollo">	
			<p>Como fruto del grupo de trabajo del CEP de M�laga titulado �PROTGT: Por un mundo m�s ciberseguro�  que ha sido conformado por profesorado del curso de CE en Ciberseguridad del CPIFP Alan Turing, la Residencia Escolar Andaluc�a y el IES La Orden se ha celebrado en nuestro Centro el Taller de Concienciaci�n en Ciberseguridad titulado �(In)seguridad en nuestros datos� que ha sido preparado e impartido en dos turnos por nuestro alumnado del CE en Ciberseguridad. </p>	
			<p>Asistieron m�s de 100 alumnos/as repartidos entre los cursos de 1� DAM, 1� DAW y 1� ASIR de nuestro centro as� como alumnado de la etapa de formaci�n profesional de la Residencia Escolar Andaluc�a y del IES La Orden.</p>
			<p>El alumnado asistente pudo comprobar de manera pr�ctica e interactiva la relativa facilidad con la que los atacantes pueden hacerse con nuestros datos, as� como herramientas para evitarlo bas�ndose principalmente en el uso de h�bitos ciberseguros.</p>
			<p>Nuestros visitantes de Huelva que eran en su mayor�a del Ciclo Superior de Integraci�n Social pudieron contar tambi�n con una peque�a charla a cargo de Inmaculada Reina, Marta Ariza y Francisco Javier Alc�ntara del CPFPE Remedios Rojo con las posibilidades e Itinerarios formativos que ofrece Empleo para ayudar a personas en situaciones desfavorecidas.</p>
		</div>
		
	</div>
	
	<article>
	<div class="espacio">:D</div>
	</article>
	<script type="text/javascript" src="../scripts/script.js"></script>
</body>
</html>
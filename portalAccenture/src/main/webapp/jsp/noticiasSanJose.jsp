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
<!-- <link href="../styles/styleNoticiasSanjose.css" rel="stylesheet"> -->

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
	<div class="cont">
		<h1>Semana Ignaciana y Fiestas Patronales 2024</h1>
		<h3>Semana de fiesta llena de juegos, concursos y eventos
			especiales</h3>

		<div class="imagen">
			<img alt="Juan Salvador" id="imagenSanJose" src="../images/sanJoseNoticia.jpg">
		</div>
		<div class="linea">
			<hr>
		</div>
		<div class="desarrollo">
			<p>Un a�o hicimos coincidir en fecha la Semana Ignaciana y las
				que son ya nuestras 49� Fiestas Patronales, cercanos a la fiesta de
				San Jos�. As� se est� haciendo desde el COVID. En esta ocasi�n, a
				nivel de EDUCSI se ha vuelto a pedir la celebraci�n de la Semana
				Ignaciana en toda Espa�a desde el 11 de marzo.</p>
			<p>Por ello, como eje central e importante estos d�as para
				mostrar nuestra identidad, desde Pastoral se dispondr� de una Carpa
				Ignaciana donde poder conocer la vida de San Ignacio de una manera
				l�dica. Se complementar�n con actividades festivas desde el martes
				12 con el preg�n de bachillerato y las prolongamos hasta el viernes
				d�a 15.</p>
			<p>El martes 12 a las 13:30h se realiza el preg�n de
				Bachillerato. Y el mi�rcoles a las 11h se realizar� una introducci�n
				a las Fiestas Patronales y Semana Ignaciana por parte del profesor
				jesuita del centro Crisanto Abeso y el coordinador de Pastoral,
				Antonio J. Reyes antes de vivir el ca�onazo de inicio de los d�as de
				fiesta.</p>
		</div>
		
	</div>
		<article>
			<div class="espacio">:D</div>
		</article>
	<script type="text/javascript" src="../scripts/script2.js"></script>
</body>
</html>
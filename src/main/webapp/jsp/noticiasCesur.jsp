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
		<h1>Cesur detecta una alta demanda de formaci�n en inform�tica</h1>
		<h3>Los estudiantes tienen la posibilidad de especializarse en disciplinas altamente demandadas, como ciberseguridad y "cloud computing"</h3>
		
		<div class="imagen">
			<img alt="Clasificados" src="../images/imagenNoticiaCesur.png">
			<div class="caption">Centro de Cesur. / CESUR </div> 
		</div>
		<div class="linea">
			<hr >
		</div>
		<div class="desarrollo">	
			<p> Cesur ha detectado una alta demanda de formaci�n en l�neas relacionadas con la inform�tica</p>
			<p> Hace unos d�as se celebraba el d�a internacional de la inform�tica, concretamente el 9 de diciembre, en honor al nacimiento de Grace Murray Hopper, pionera en el mundo de las Ciencias de la Computaci�n. La inform�tica ha influenciado en el avance de la transmisi�n de datos e informaci�n, manteniendo a personas de cualquier parte del mundo conectadas entre s�.</p>
			<p>Los estudios en torno a la inform�tica son de los m�s demandados no solo a nivel acad�mico, sino tambi�n en el �mbito laboral debido a las nuevas tecnolog�as que est�n en auge y en constante evoluci�n. De hecho, la Inform�tica es la tercera familia profesional con m�s estudiantes matriculados, despu�s de Sanidad, y Administraci�n y Gesti�n, seg�n las estad�sticas del alumnado de FP del curso 2021-2022, publicadas recientemente por el MEFP. </p>
			<p>El Desarrollador de Aplicaciones Web (DAW) se destaca como un experto en la creaci�n y optimizaci�n de aplicaciones inform�ticas espec�ficamente dise�adas para entornos web. Este profesional, ya sea como empleado en empresas p�blicas o privadas o como trabajador independiente, se especializa en programaci�n web, abordando lenguajes como PHP, JavaScript, entre otros. </p>

 			<p>	Desarrollo de Aplicaciones Multiplataforma (DAM) abarca una gama m�s amplia de plataformas, incluyendo aplicaciones para dispositivos m�viles y ordenadores. Aunque comparten una base com�n, DAM se enfoca m�s intensamente en el desarrollo de aplicaciones m�viles a partir del segundo a�o de formaci�n, utilizando herramientas espec�ficas y continuando con el uso de JAVA. </p>
			
		</div>
		
	</div>
	
	<article>
	<div class="espacio">:D</div>
	</article>
	<script type="text/javascript" src="../scripts/script2.js"></script>
</body>
</html>

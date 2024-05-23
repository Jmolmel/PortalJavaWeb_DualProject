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
		<h1>Estudiante del IES Pablo Picasso, segundos clasificados en un campeonato de talento empresarial</h1>
		<h3>Son alumnos del ciclo de grado Superior en Desarrollo de Aplicaciones Multiplataforma</h3>
		
		<div class="imagen">
			<img alt="Clasificados" src="../images/imagenNoticiaPabloPicasso1.png">
			<div class="caption">De izquierda a derecha, los alumnos Jonathan Ruiz Oliva, Pablo Jim�nez Aguayo y Javier de la Torre Barranco, con su profesor de Empresa e Iniciativa Emprendedora David Nicol�s Ros. SUR </div> 
		</div>
		<div class="linea">
			<hr >
		</div>
		<div class="desarrollo">	
			<p>Tres estudiantes del instituto Pablo Picasso de la capital han quedado segundos clasificados en un campeonato sobre talento empresarial celebrado en Madrid. Se trata de los j�venes Javier de la Torre, Jonathan Ruiz y Pablo Jim�nez, que han participado en la II edici�n de Business Talent, un campeonato educativo organizado por Herbalife Nutrition y Praxis MMT. Son alumnos del ciclo Superior de Desarrollo de Aplicaciones Multiplataforma y durante el curso han estado desarrollando en clase con su profesor de Empresa e Iniciativa Emprendedora David Nicol�s Ros este proyecto que ha merecido un segundo premio  </p>
			<p>En primer lugar, han resultado ganadores Iria Pi�eiro, Ismael Mart�nez, Jorge Fern�ndez y Sara G�mez, alumnos del IES A Gu�a de Vigo; mientras que en tercer puesto han quedado tres alumnos de la Universidad de Vigo.</p>
			<p>El profesor David Nicol�s Ros explic� que este curso incluy� el simulador empresarial de Business Talent para hacer la materia de Empresa �lo m�s pr�ctica posible�. Y encontr� en este grupo de alumnos, que se denominaron a s� mismos RSS, una muy buena disposici�n a trabajar en el proyecto. Despu�s de pasar por octavos, cuartos y semifinales se clasificaron para la final nacional. Han quedado segundo de Espa�a, pero campeones de su grupo de simulaci�n. El profesor destac� que, incluso cuando estaban en las pr�cticas de empresa, �segu�an tom�ndose el trabajo muy en serio�.</p>
		</div>
		
	</div>
	
	<article>
	<div class="espacio">:D</div>
	</article>
	<script type="text/javascript" src="../scripts/script.js"></script>
</body>
</html>
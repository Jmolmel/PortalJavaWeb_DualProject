<%@page import="com.accenture.portal.services.ServicesSubjects"%>
<%@page import="com.accenture.portal.services.ServicesModels"%>
<%@page import="com.accenture.portal.models.User"%>
<%@page import="com.accenture.portal.services.ServicesModels"%>
<%@page import="com.accenture.portal.models.Course"%>
<%@page import="com.accenture.portal.models.Subject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.accenture.portal.models.School"%>
<%@page import="com.accenture.portal.models.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Modulo</title>
	<!-- FONTS -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
	<!-- CSS -->
	<link href="../styles/styleModulo.css" rel="stylesheet">
<%
User activeUser = (User) request.getSession().getAttribute("user"); 
ServicesSubjects ss = new ServicesSubjects();
String color = ServicesModels.defineColor(activeUser.getCenter());
%>
	<style type="text/css">
#descriptionUnderline {
	border-bottom: solid <%=color%> 2px;
}

th{
	background-color:<%=color%>;
}

p {
	border-left: solid <%=color%> 3px;
	border-right: solid <%=color%> 3px;
}

	
</style>
</head>



<body>
<% 	if (activeUser.getUserType().equals("02")) { %> 
	<h3> Los profesores/as no tienen modulo asignado</h3> <% } else {%>
<% 
Course course = ServicesModels.getCourseInfo(activeUser.getCourse());
 %>
	<div class="contenedorPrincipal">
		<h2><%= course.getNameCourse() %></h2>
		<div id="descriptionUnderline"> <h3> Descripción</h3> </div>
		<p><%= course.getDescription() %></p>  
		<table id="courseTable">
			<tr>
				<th>Asignatura</th>
				<th>Horas semanales</th>
				<th>Horas totales</th>
			</tr>
			<% 
			int courseId = activeUser.getCourse();
			ArrayList<Subject> subjects = ss.getSubjects(courseId);
		    for (Subject subject : subjects) {   %>
			<tr>
				<td class="tableContent"><%= subject.getSubjectName() %></td>
			    <td class="tableContent" id="hoursWeekly"><%= subject.getWeeklyHours() %></td>
			    <td class="tableContent" id="hoursTotal"><%= subject.getTotal_hours() %></td>
			<% } }%>
		</table>
	</div>
</body>
</html>
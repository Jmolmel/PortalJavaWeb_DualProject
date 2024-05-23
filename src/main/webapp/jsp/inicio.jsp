<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.accenture.portal.models.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="../styles/styleInicio.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title>Inicio</title>
    <% 
        User activeUser = (User) request.getSession().getAttribute("user"); 
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMMM yyyy, HH:mm:ss");
        String formattedDateTime = now.format(formatter);
    %>
</head>
<body>
    <div class="container">
        <div class="content">
            <h1>Bienvenido/a al portal <%= activeUser.getName() + " " + activeUser.getLastName() %></h1>
            <p>Fecha y hora de su inicio de sesión: <%= formattedDateTime %></p>
        </div>
    </div>
</body>
</html>

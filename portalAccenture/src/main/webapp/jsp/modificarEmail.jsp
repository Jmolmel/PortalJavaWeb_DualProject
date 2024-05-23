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
<title>Modificar email</title>
<%
User activeUser = (User) request.getSession().getAttribute("user");
String color = ServicesModels.defineColor(activeUser.getCenter());
%>
<style>
    .login a:hover {
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
    <!-- ACCENTURE IMAGE -->
    
    <h2>Modificar EMAIL</h2>
    <!-- FORM -->
    <form action="${pageContext.request.contextPath}/updateEmail" method="post" class="login" onsubmit="return validateEmail()">
    
        <!-- ANTIGUO EMAIL -->
        <div class="input_container">
            <input id="oldMail" type="email" name="oldMail" required> <label>Email anterior</label>
            <div id="pass1_alert" class="advertencia"></div>
        </div>
        
        <!-- NUEVO EMAIL -->
        <div class="input_container">
            <input id="newEmail" type="email" name="user_Email" required> <label>Nueva direccion de Email</label>
            <div id="new_email_alert" class="advertencia"></div>
        </div>
        

        <div class="advertencia">
            <%
            if (request.getAttribute("errorUsuarioRegistrado") != null) {
            %>
            <img src="${pageContext.request.contextPath}/images/advertencia.png" id="logoAdvertencia"><span>
                <%=request.getAttribute("errorUsuarioRegistrado")%></span>
            <%
            }
            %>
        </div>
        

        <!-- BOTÓN MODIFICAR -->
        <button id="changeButton" type="submit" class="register-button container-button">Confirmar modificacion</button>

        
    </form>
</div>

<!-- FOOTER -->
<footer>
    <p>Aplicación creada por <strong>Grupo La Rubia & co</strong></p>
</footer>

<!-- JavaScript para validar el correo electrónico -->
<script>
    function validateEmail() {
        var newEmail = document.getElementById('newEmail').value;
        // Expresión regular para validar el correo electrónico permitiendo la primera letra en mayúscula y el resto en minúsculas
        var emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (!emailRegex.test(newEmail)) {
            document.getElementById('new_email_alert').innerText = 'Por favor, introduce un correo electrónico válido';
            return false;
        }
        return true;
    }
</script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.accenture.portal.services.ServicesValidation"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1" name="viewport"
        content="width=device-width, initial-scale=1.25, maximum-scale=1">
    <!-- CSS -->
    <link href="./styles/styleRegister.css" rel="stylesheet">
    <!-- FONTS -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100..900;1,100..900&display=swap"
        rel="stylesheet">
    <!-- FAVICON -->
    <link rel="icon" type="image/x-icon" href="./images/accFavicon.jpg">
    <title>Register</title>
</head>

<body>
    <div id="mainContainer">
        <!-- ACCENTURE IMAGE -->
        <img src="./images/logoAccenture.svg" id="logoAccenture">
        
        <!-- FORM -->
        <form action="./register" method="post" class="login" onsubmit="return validarFormulario()">
            <!-- NOMBRE -->
            <div class="input_container">
                <input type="text" name="user_name" required> <label>Nombre</label>
                <% 
                ServicesValidation validation = new ServicesValidation();
                if (request.getMethod().equals("POST")) {
                    String nombre = request.getParameter("user_name");
                    if (!validation.validarNombre(nombre)) { %>
                        <span style="color: red;">El nombre es incorrecto</span>
                <%  } %>
            </div>
            
            <!-- APELLIDOS -->
            <div class="input_container">
                <input type="text" name="user_lastname" required> <label>Apellidos</label>
                <% 
                if (request.getMethod().equals("POST")) {
                    String apellido = request.getParameter("user_lastname");
                    if (!validation.validarApellido(apellido)) { %>
                        <span style="color: red;">Los apellidos son incorrectos</span>
                <%  } %>
            </div>
            
            <!-- EMAIL -->
            <div class="input_container">
                <input type="text" name="user_email" required> <label>Email</label>
                <% 
                if (request.getMethod().equals("POST")) {
                    String email = request.getParameter("user_email");
                    if (!validation.validarEmail(email)) { %>
                        <span style="color: red;">El email es incorrecto</span>
                <%  } %>
            </div>
            
            <!-- FECHA NACIMIENTO -->
            <div class="input_container">
                <input type="date" class="date" name="user_birthday" required>
                <% 
                if (request.getMethod().equals("POST")) {
                    String fechaNacimiento = request.getParameter("user_birthday");
                    // Agrega aquí más validaciones si es necesario
                } %>
            </div>
            
            <!-- NIF -->
            <div class="input_container">
                <input type="text" name="user_nif" required> <label>NIF</label>
                <% 
                if (request.getMethod().equals("POST")) {
                    String dni = request.getParameter("user_nif");
                    if (!validation.validarDNI(dni)) { %>
                        <span style="color: red;">El NIF es incorrecto</span>
                <% } %>
            </div>
            
            <!-- CENTRO -->
            <div class="input_container">
                <select name="user_center">
                    <option value="0" disabled selected>-- Seleccione un centro --</option>
                    <option value="1">CPIFP Alan Turing</option>
                    <option value="2">SAN JOSE</option>
                </select>
            </div>
            
            <!-- CURSO -->
            <div class="input_container">
                <select name="user_course">
                    <option value="0" disabled selected>-- Seleccione un curso --</option>
                    <option value="1">DAM</option>
                    <option value="2">DAW</option>
                </select>
            </div>
            
            <!-- CONTRASEÑA -->
            <div class="input_container">
                <input type="password" name="user_password" required> <label>Contraseña</label>
            </div>
            
            <!-- REPITE CONTRASEÑA -->
            <div class="input_container">
                <input type="password" name="user_password2" required> <label>Repetir contraseña</label>
            </div>
            
            <!-- BOTÓN REGISTRO -->
            <button type="submit" class="register-button container-button">Registrar</button>

            <!-- LOGIN LINK -->
            <div class="account-animation">
                <a href="./login.jsp" class="animated-link"> Tengo una cuenta creada</a>
            </div>
        </form>
    </div>

    <!-- FOOTER -->
    <footer>
        <p>Aplicación creada por <strong>Grupo La Rubia & co</strong></p>
    </footer>
</body>
</html>

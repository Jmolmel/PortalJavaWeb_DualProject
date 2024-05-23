<%@ page import="com.accenture.portal.services.ServicesModels"%>
<%@ page import="com.accenture.portal.models.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <!-- CSS -->
    <link href="${pageContext.request.contextPath}/styles/styleRegister.css" rel="stylesheet">
    <!-- FONTS -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <!-- FAVICON -->
    <link rel="icon" type="image/x-icon" href="../images/accFavicon.jpg">
    <title>Modificar contraseña</title>
    <% 
        User activeUser= (User) request.getSession().getAttribute("user");
        String color = ServicesModels.defineColor(activeUser.getCenter());
        HttpSession session1 = request.getSession();
        String messageUpdate = (String) session1.getAttribute("messageUpdate");
        if (messageUpdate != null) {
            session1.removeAttribute("messageUpdate");
        }
    %>
    <style>
        /* Estilos CSS */
        .login a:hover {
            color: <%= color %>;
        }
        
        input, select {
            border: 1.8px <%= color %> solid;
        }
        
        .input_container input:focus, .input_container select:focus {
            border-color: <%= color %>;
            box-shadow: 0 0 5px <%= color %>;
            outline: none;
        }
        
        .register-button::after {
            background-color: <%= color %>;
        }
        
        .register-button::before {
            background-color: red;
        }
        
        footer {
            color: <%= color %>;
        }
        
        #mainContainer h2 {
            margin-top: 50px ;
            margin-bottom: 25px ;
            color: <%= color %>;
        }
        .advertencia{
        	color: red;
        }
        
    </style>
</head>
<body>
    <div id="mainContainer">

        <h2>Modificar contraseña</h2>

        <form action="${pageContext.request.contextPath}/updatePass" method="post" class="login">

            <div class="input_container">
                <input id="old_password" type="password" name="oldPassword" required>
                <label>Contraseña antigua</label>

            </div>
            <div class="input_container">
                <input id="user_password" type="password" name="user_password" required>
                <label>Contraseña nueva</label>

            </div>
            <div class="input_container">
                <input id="user_password2" type="password" name="user_password2" required>
                <label>Repetir contraseña</label>
                <div id="pass2_alert" class="advertencia"></div>
            </div>
            <div class="advertencia">
                <% if (request.getAttribute("errorUsuarioRegistrado") != null) { %>
                    <img src="${pageContext.request.contextPath}/images/advertencia.png" id="logoAdvertencia"><span><%=request.getAttribute("errorUsuarioRegistrado")%></span>
                <% } %>
            </div>
           <div id="pass1_alert" class="advertencia"></div>
            
            <button id="changeButton" type="submit" class="register-button container-button">Confirmar modificacion</button>
        </form>
    </div>

    <% if (messageUpdate != null) { %>
        <script type="text/javascript">
            alert('<%= messageUpdate %>');
        </script>
    <% } %>
    <footer>
        <p>Aplicación creada por <strong>Grupo La Rubia & co</strong></p>
    </footer>
   <script type="text/javascript">
        class ValidationClass {
            validatePassword(password) {
                if (password.length < 8) {
                    return false;
                }
                const uppercaseRegex = /[A-Z]/;
                const lowercaseRegex = /[a-z]/;
                if (!uppercaseRegex.test(password) || !lowercaseRegex.test(password)) {
                    return false;
                }
                const numberRegex = /[0-9]/;
                if (!numberRegex.test(password)) {
                    return false;
                }
                return true;
            }
            validateCorrectPassword(password, password2) {
                return password2 === password;
            }
        }
        function validateInput() {
            const pass1 = document.getElementById('user_password').value;
            const pass2 = document.getElementById('user_password2').value;
            const validator = new ValidationClass();
            if (validator.validatePassword(pass1) && validator.validateCorrectPassword(pass1, pass2)) {
                return true;
            } else {
                if (!validator.validatePassword(pass1)) {
                    const pass1Alert = document.getElementById("pass1_alert");
                    pass1Alert.textContent = "La contraseña debe tener al menos 8 caracteres, una mayúscula, una minúscula y un número.";
                }
                if (!validator.validateCorrectPassword(pass1, pass2)) {
                    const pass2Alert = document.getElementById("pass2_alert");
                    pass2Alert.textContent = "Las contraseñas no coinciden.";
                }
                return false;
            }
        }
        document.addEventListener("DOMContentLoaded", function() {
            const changeButton = document.getElementById('changeButton');
            changeButton.addEventListener('click', function(event) {
                if (!validateInput()) {
                    event.preventDefault();
                }
            });
        });
    </script>
</body>
</html>
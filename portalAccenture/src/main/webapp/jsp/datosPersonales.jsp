<%@ page import="com.accenture.portal.models.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.accenture.portal.services.*, com.accenture.portal.models.User"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="../styles/styleDatosPersonales.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Datos Personales</title>

<%
User activeUser = (User) request.getSession().getAttribute("user");
String color = ServicesModels.defineColor(activeUser.getCenter());
String email = Services.getEmail(activeUser.getId());
HttpSession session1 = request.getSession();
String messageUpdate = (String) session.getAttribute("messageUpdate");
if (messageUpdate != null) {
    session1.removeAttribute("messageUpdate");
}
%>
<style type="text/css">
    #descriptionUnderline {
        border-bottom: solid <%=color%> 2px;
    }
    .tarjetaPersonal {
        border: 2px solid <%=color%>;                                                                                                                                       
        box-shadow: 0px 0px 6px 3px <%=color%>;
    }
    .h1dp {
        color: <%=color%>;
    }
    .ladoIzquierdoTarjeta {
        display: flex;
        justify-content: space-around;
        width: 30vw;
        color: <%=color%>;
    }
    .button-container {
        display: flex;
        justify-content: space-between;
        width: 100%;
        padding: 20px 0;
    }
    .button-container button {
        width: 30%;
        padding: 10px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        background-color: <%=color%>;
        color: #fff;
        transition: background-color 0.3s ease;
    }
    .button-container button:hover {
        background-color: darken(<%=color%>, 10%);
    }
</style>
</head>
<body>
    <h1 class="h1dp">Datos Personales</h1>

    <div class="tarjetaPersonal">
        <div class="ladoIzquierdoTarjeta">
            <div class="columna1">
                <div>
                    <h3>Nombre</h3>
                    <p><%=activeUser.getName() + " " + activeUser.getLastName()%></p>
                </div>
                <div>
                    <h3>Email</h3>
                    <p><%=email%></p>
                </div>
            </div>
            <div class="columna2">
                <div>
                    <h3>Dni</h3>
                    <p><%=activeUser.getDnie()%></p>
                </div>
                <div>
                    <h3>Nacimiento</h3>
                    <p><%=activeUser.getDate()%></p>
                </div>
            </div>
        </div>

        <div class="ladoDerechoTarjeta">
            <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="#ffffff">
                <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                <g id="SVGRepo_iconCarrier">
                    <path d="M5 21C5 17.134 8.13401 14 12 14C15.866 14 19 17.134 19 21M16 7C16 9.20914 14.2091 11 12 11C9.79086 11 8 9.20914 8 7C8 4.79086 9.79086 3 12 3C14.2091 3 16 4.79086 16 7Z" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                </g>
            </svg>
        </div>
    </div>

    <div class="button-container">
        <button onclick="window.location.href='modificarPass.jsp'">Modificar contraseña</button>
        <button onclick="window.location.href='modificarEmail.jsp'">Modificar Email</button>
        <button onclick="window.location.href='eliminarCuenta.jsp'">Eliminar cuenta</button>
    </div>

    <% if (messageUpdate != null) { %>
        <script type="text/javascript">
            alert('<%=messageUpdate%>');
        </script>
    <% } %>

    <script type="text/javascript" src="../scripts/script.js"></script>
</body>
</html>

function cambiarContenido(url, id) {

    let element;
    for (let i = 0; i < 6; i++){
        element = document.getElementById(i.toString());
        if (element.classList.contains("selected")){
            element.classList.remove("selected");
        }
    }

    document.getElementById(id).classList.add("selected");


    let iframe = document.getElementById("contenido");
    iframe.src = url;
}

function irLogin() {
    window.location.href = "./jsp/login.jsp";
}

        function validarFormulario() {
            var nombre = document.forms["registroForm"]["user_name"].value;
            var apellido = document.forms["registroForm"]["user_lastname"].value;
            var email = document.forms["registroForm"]["user_email"].value;
            var fechaNacimiento = document.forms["registroForm"]["user_birthday"].value;
            var dni = document.forms["registroForm"]["user_nif"].value;
            var contrasena = document.forms["registroForm"]["user_password"].value;
            var repetirContrasena = document.forms["registroForm"]["user_password2"].value;

            if (!validarNombre(nombre)) {
                alert("El nombre es incorrecto");
                return false;
            }

            if (!validarApellido(apellido)) {
                alert("El apellido es incorrecto");
                return false;
            }

            if (!validarEmail(email)) {
                alert("El email es incorrecto");
                return false;
            }

            if (!validarFechaNacimiento(fechaNacimiento)) {
                alert("La fecha de nacimiento es incorrecta");
                return false;
            }

            if (!validarDNI(dni)) {
                alert("El DNI es incorrecto");
                return false;
            }

            if (!contrasenaSegura(contrasena)) {
                alert("La contraseña no cumple con los requisitos de seguridad");
                return false;
            }

            if (!passwordsEquals(contrasena, repetirContrasena)) {
                alert("Las contraseñas no coinciden");
                return false;
            }

            return true;
        }
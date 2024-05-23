document.addEventListener("DOMContentLoaded", function() {
    const form = document.querySelector("form.login");

    form.addEventListener("submit", function(event) {
        event.preventDefault(); // Evitar envío del formulario por defecto

        // Limpiar mensajes de error anteriores
        const errorContainers = document.querySelectorAll(".error-container");
        errorContainers.forEach(function(container) {
            container.textContent = '';
        });

        // Obtener valores de los campos
        const name = form.querySelector("input[name='user_name']").value.trim();
        const lastname = form.querySelector("input[name='user_lastname']").value.trim();
        const email = form.querySelector("input[name='user_email']").value.trim();
        const nif = form.querySelector("input[name='user_nif']").value.trim();
        const password = form.querySelector("input[name='user_password']").value.trim();
        const password2 = form.querySelector("input[name='user_password2']").value.trim();

        // Validar nombre y apellidos (no deben contener números)
        const nameRegex = /^[A-Za-záéíóúÁÉÍÓÚñÑ\s]+$/;
        if (!nameRegex.test(name)) {
            showError("Nombre no válido", form.querySelector("input[name='user_name']").parentNode.querySelector(".error-container"));
        }
        if (!nameRegex.test(lastname)) {
            showError("Apellidos no válidos", form.querySelector("input[name='user_lastname']").parentNode.querySelector(".error-container"));
        }

        // Validar email
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            showError("Email no válido", form.querySelector("input[name='user_email']").parentNode.querySelector(".error-container"));
        }

        // Validar NIF (DNI)
        const nifRegex = /^[0-9]{8}[TRWAGMYFPDXBNJZSQVHLCKE]$/i;
        if (!nifRegex.test(nif)) {
            showError("NIF no válido", form.querySelector("input[name='user_nif']").parentNode.querySelector(".error-container"));
            return; // Detener la ejecución si el NIF no es válido
        }
        
        // Extraer el número y la letra del NIF (DNI)
        const numeroDNI = nif.substring(0, 8);
        const letraDNI = nif.charAt(8).toUpperCase();
        
        // Calcular la letra correspondiente al número de DNI
        const letras = 'TRWAGMYFPDXBNJZSQVHLCKE';
        const letraCalculada = letras.charAt(numeroDNI % 23);
        
        // Comparar la letra calculada con la letra del NIF (DNI)
        if (letraDNI !== letraCalculada) {
            showError("NIF no válido", form.querySelector("input[name='user_nif']").parentNode.querySelector(".error-container"));
            return; // Detener la ejecución si la letra del NIF (DNI) no coincide
        }

        // Validar que las contraseñas coincidan
        if (password !== password2) {
            showError("Las contraseñas no coinciden", form.querySelector("input[name='user_password2']").parentNode.querySelector(".error-container"));
            return; // Detener la ejecución si las contraseñas no coinciden
        }

        // Función para mostrar mensajes de error
        function showError(message, container) {
            const errorMessage = document.createElement("div");
            errorMessage.classList.add("error-message");
            errorMessage.textContent = message;
            container.appendChild(errorMessage);
        }

        // Si no hay mensajes de error, enviar el formulario
        if (document.querySelectorAll(".error-message").length === 0) {
            form.submit();
        }
    });
});

// Validaciones
class ValidationClass {
validateMail(userMail) {
    const lowerCaseMail = userMail.toLowerCase();
    const emailPattern = /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/;
    return emailPattern.test(lowerCaseMail);
}

	validateNif(userNif) {
		const dniPattern = /^\d{8}[A-HJ-NP-TV-Z]$/;
		return dniPattern.test(userNif);
	}

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

	isValidDate(dateString) {

		const inputDate = new Date(dateString);

		if (isNaN(inputDate.getTime())) {
			return false;
		}

		const currentDate = new Date();

		if (inputDate > currentDate) {
			return false;
		}

		const age = currentDate.getFullYear() - inputDate.getFullYear();

		if (age > 120) {
			return false;
		}

		return true;
	}
}

// Funciones
function validateInput() {

	const email = document.getElementById('user_email').value;
	const nif = document.getElementById('user_nif').value;
	const birthday = document.getElementById('user_birthday').value;
	const pass1 = document.getElementById('user_password').value;
	const pass2 = document.getElementById('user_password2').value;

	if (validator.validateMail(email) && validator.validateNif(nif) && validator.isValidDate(birthday)
		&& validator.validatePassword(pass1) && validator.validateCorrectPassword(pass1, pass2)) {

		return true;

	} else {

		if (!validator.validateMail(email)) {
			const fragment = document.createDocumentFragment();

			const spanElement = document.createElement("span");
			spanElement.textContent = "Correo electronico invalido.";
			
			fragment.appendChild(spanElement);

			const emailAlert = document.getElementById("email_alert");

			while (emailAlert.firstChild) {
				emailAlert.removeChild(emailAlert.firstChild);
			}

			emailAlert.appendChild(fragment);
		}

		if (!validator.validateNif(nif)) {

			const fragment = document.createDocumentFragment();

			const spanElement = document.createElement("span");
			spanElement.textContent = "NIF invalido";

			fragment.appendChild(spanElement);

			const nifAlert = document.getElementById("nif_alert");

			while (nifAlert.firstChild) {
				nifAlert.removeChild(nifAlert.firstChild);
			}

			nifAlert.appendChild(fragment);
		}

		if (!validator.isValidDate(birthday)) {
			const fragment = document.createDocumentFragment();

			const spanElement = document.createElement("span");
			spanElement.textContent = "Fecha invalida";

			fragment.appendChild(spanElement);

			const birthAlert = document.getElementById("birth_alert");

			while (birthAlert.firstChild) {
				birthAlert.removeChild(birthAlert.firstChild);
			}

			birthAlert.appendChild(fragment);
		}

		if (!validator.validatePassword(pass1)) {
			const fragment = document.createDocumentFragment();

			const spanElement = document.createElement("span");
			spanElement.textContent = "Contraseña invalida";

			fragment.appendChild(spanElement);

			const pass1Alert = document.getElementById("pass1_alert");

			while (pass1Alert.firstChild) {
				pass1Alert.removeChild(pass1Alert.firstChild);
			}

			pass1Alert.appendChild(fragment);
		}

		else if (!validator.validateCorrectPassword(pass1, pass2)) {
			const fragment = document.createDocumentFragment();

			const spanElement = document.createElement("span");
			spanElement.textContent = "Las contrasenñas no son coinciden.";

			fragment.appendChild(spanElement);

			const pass2Alert = document.getElementById("pass2_alert");

			while (pass2Alert.firstChild) {
				pass2Alert.removeChild(pass2Alert.firstChild);
			}

			pass2Alert.appendChild(fragment);
		}

		return false;
	}
}

// Principal
const validator = new ValidationClass();

document.addEventListener("DOMContentLoaded", function() {

	const registerButton = document.getElementById('registerButton');

	registerButton.addEventListener('click', function(event) {

		if (!validateInput()) {
			// Si la validación falla, prevenir el envío del formulario
			event.preventDefault();
		}

		else {
			
		}
	})

})
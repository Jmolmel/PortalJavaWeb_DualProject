package com.accenture.portal.services;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *     ¡NOT USED!
 * 
 * This class provides validation methods for user input.
 */
public class ServicesValidation {

    /**
     * Validates a name.
     *
     * @param nombre The name to validate.
     * @return true if the name is valid, false otherwise.
     */
    public boolean validarNombre(String nombre) {
        boolean validado = true;
        Pattern regex = Pattern.compile("^[a-zA-ZñÑ]{2,}\\s[a-zA-ZñÑ]{2,}\\s?[a-zA-ZñÑ]{2,}?$");
        if (!regex.matcher(nombre).matches()) {
            validado = false;
        }
        return validado;
    }

    /**
     * Validates a last name.
     *
     * @param apellido The last name to validate.
     * @return true if the last name is valid, false otherwise.
     */
    public boolean validarApellido(String apellido) {
        boolean validado = true;
        Pattern regex = Pattern.compile("^[a-zA-ZñÑ]{2,}\\s[a-zA-ZñÑ]{2,}\\s?[a-zA-ZñÑ]{2,}?$");
        if (!regex.matcher(apellido).matches()) {
            validado = false;
        }
        return validado;
    }

    /**
     * Validates a DNI (Spanish ID).
     *
     * @param dni The DNI to validate.
     * @return true if the DNI is valid, false otherwise.
     */
    public boolean validarDNI(String dni) {
        if (dni == null || dni.length() != 9) {
            return false;
        }

        String numeros = dni.substring(0, 8);
        char letra = Character.toUpperCase(dni.charAt(8));
        int resto = Integer.parseInt(numeros) % 23;

        char[] letras = {'T', 'R', 'W', 'A', 'G', 'M', 'Y', 'F', 'P', 'D', 'X', 'B', 'N', 'J', 'Z', 'S', 'Q', 'V', 'H',
                'L', 'C', 'K', 'E'};
        char letraCalculada = letras[resto];

        return letra == letraCalculada;
    }

    /**
     * Validates an email address.
     *
     * @param email The email address to validate.
     * @return true if the email address is valid, false otherwise.
     */
    public boolean validarEmail(String email) {
        String regex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";

        return email.matches(regex);
    }

    /**
     * Checks if a password is secure.
     *
     * @param contrasena The password to check.
     * @return true if the password is secure, false otherwise.
     */
    public boolean contrasenaSegura(String contrasena) {
        if (contrasena.length() > 8) {
            boolean mayuscula = false;
            boolean numero = false;
            boolean letraOsimbolo = false;
            boolean especial = false;

            Pattern special = Pattern.compile("[?!¡@¿.,´)]");
            Matcher hasSpecial = special.matcher(contrasena);

            int i;
            char l;

            for (i = 0; i < contrasena.length(); i++) {
                l = contrasena.charAt(i);

                if (Character.isDigit(l)) {
                    numero = true;
                }
                if (Character.isLetter(l)) {
                    letraOsimbolo = true;
                }
                if (Character.isUpperCase(l)) {
                    mayuscula = true;
                }
                if (hasSpecial.find()) {
                    especial = true;
                }
            }

            if (numero && mayuscula && letraOsimbolo && especial) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    /**
     * Checks if two passwords are equal.
     *
     * @param pass1 The first password.
     * @param pass2 The second password.
     * @return true if the passwords are equal, false otherwise.
     */
    public boolean passwordsEquals(String pass1, String pass2) {
        boolean r = false;
        if (pass1 == pass2) {
            r = true;
        }
        return r;
    }

    /**
     * Converts a string to a Date object.
     *
     * @param dateString The string representation of the date.
     * @return The Date object.
     */
    public Date convertStringToDate(String dateString) {
        Date date = null;
        try {
            if (dateString != null && !dateString.isEmpty()) {
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date utilDate = dateFormat.parse(dateString);
                date = new Date(utilDate.getTime());
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }
}
package com.accenture.portal.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.accenture.portal.conector.Conector;
import com.accenture.portal.services.Services;
import com.accenture.portal.services.ServicesValidation;

/**
 * Servlet implementation class RegisterServlet
 * This servlet handles user registration.
 */
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles HTTP POST requests for user registration.
     *
     * @param request  The HttpServletRequest object containing the request parameters.
     * @param response The HttpServletResponse object for sending the response to the client.
     * @throws ServletException If an error occurs while processing the servlet request.
     * @throws IOException      If an I/O error occurs while handling the servlet request.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String alumn = "01";
        Connection conn = null;
        Services svc = new Services();
        ServicesValidation validation = new ServicesValidation();

        // Get parameters from request
        String name = request.getParameter("user_name");
        String lastname = request.getParameter("user_lastname");
        String email = request.getParameter("user_email");
        String date = request.getParameter("user_birthday");
        String dnie = request.getParameter("user_nif");
        String pass1 = request.getParameter("user_password");
        String pass2 = request.getParameter("user_password2");
        String centerRegister = request.getParameter("user_center");
        String courseRegister = request.getParameter("user_course");

        int center = Integer.parseInt(centerRegister);
        int course = Integer.parseInt(courseRegister);

        // Convert date string to Date object
        Date fecha = validation.convertStringToDate(date);

        try {
            conn = new Conector().getMySqlConnection();
            if (conn != null) {
                // Check if email already exists in the database
                PreparedStatement ps1 = conn.prepareStatement("SELECT * from credentials WHERE email = ?");
                ps1.setString(1, email);
                ResultSet rs = ps1.executeQuery();
                if (rs.next()) {
                    request.setAttribute("mensaje", "Ya existe un email registrado");
                    response.sendRedirect("login.jsp");
                } else {
                    // Registrar user if email does not exist
                    if (svc.registerUser(name, lastname, email, fecha, dnie, alumn, pass1, pass2, center, course)) {
                        request.setAttribute("successMessage", "Registro exitoso. Por favor, inicia sesión.");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    } else {
                        request.setAttribute("errorMessage", "Error en el registro. Por favor, inténtalo de nuevo.");
                        request.getRequestDispatcher("register.jsp").forward(request, response);
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
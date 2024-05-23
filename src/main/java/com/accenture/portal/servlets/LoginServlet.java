package com.accenture.portal.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.accenture.portal.services.Services;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import com.accenture.portal.conector.Conector;
import com.accenture.portal.models.User;

/**
 * Servlet implementation class LoginServlet
 * This servlet handles user login authentication.
 */
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles HTTP POST requests for user login.
     *
     * @param request  The HttpServletRequest object containing the request parameters.
     * @param response The HttpServletResponse object for sending the response to the client.
     * @throws ServletException If an error occurs while processing the servlet request.
     * @throws IOException      If an I/O error occurs while handling the servlet request.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userEmail = request.getParameter("email");
        String userPassword = request.getParameter("password");
        Connection conn = null;
        HttpSession session = request.getSession();

        try {
            conn = new Conector().getMySqlConnection();
            if (conn != null) {
                System.out.println("Conexion esta OK");
                boolean isAuthenticated = Services.authenticateUser(conn, userEmail, userPassword);
                if (isAuthenticated) {
                    int userId = Services.getUserId(conn, userEmail);
                    User authenticatedUser = Services.getUserDetailsById(conn, userId);
                    session.setAttribute("user", authenticatedUser);
                    response.sendRedirect("./index.jsp");
                    System.out.println("FUNCIONA");
                } else {
                    // Set error message if authentication fails
                    request.setAttribute("errorMessage", "Correo electrónico o contraseña no válida");
                    request.getRequestDispatcher("./login.jsp").forward(request, response);
                    System.out.println("ELSE");
                }
            } else {
                System.out.println("APLICACION NULA");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("SALTA CATCH");
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

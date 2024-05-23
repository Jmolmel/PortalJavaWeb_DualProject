package com.accenture.portal.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import com.accenture.portal.models.User;
import com.accenture.portal.services.Services;

/**
 * Servlet implementation class UpdatePasswordServlet
 * This servlet handles updating user password.
 */
public class UpdatePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles HTTP POST requests for updating user password.
     *
     * @param request  The HttpServletRequest object containing the request parameters.
     * @param response The HttpServletResponse object for sending the response to the client.
     * @throws ServletException If an error occurs while processing the servlet request.
     * @throws IOException      If an I/O error occurs while handling the servlet request.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User activeUser = (User) session.getAttribute("user");

        // Redirect to news page if user is not logged in
        if (activeUser == null) {
            response.sendRedirect("./noticias.jsp");
            return;
        }

        int id = activeUser.getId();
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("user_password");
        String confirmPassword = request.getParameter("user_password2");

        // Check if new passwords match
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Las nuevas contraseñas no coinciden.");
            request.getRequestDispatcher("jsp/modificarPass.jsp").forward(request, response);
            return;
        }

        Services sv = new Services();

        try {
            String storedPassword = sv.getStoredPassword(id);
            if (storedPassword != null) {
                if (oldPassword.equals(storedPassword)) {
                    boolean updateSuccess = sv.updatePassword(id, newPassword);
                    if (updateSuccess) {
                        session.setAttribute("messageUpdate", "Contraseña actualizada con éxito.");
                    } else {
                        session.setAttribute("messageUpdate", "Error actualizando la contraseña.");
                    }
                } else {
                    session.setAttribute("messageUpdate", "Contraseña anterior incorrecta.");
                }
            } else {
                session.setAttribute("messageUpdate", "Usuario no encontrado.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("messageUpdate", "Error en la base de datos. Por favor, inténtalo de nuevo.");
        }

        response.sendRedirect("jsp/datosPersonales.jsp");
    }
}
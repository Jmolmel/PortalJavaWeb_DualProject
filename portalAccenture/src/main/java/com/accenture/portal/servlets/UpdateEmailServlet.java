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
 * Servlet implementation class UpdateEmailServlet
 * This servlet handles updating user email.
 */
public class UpdateEmailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles HTTP POST requests for updating user email.
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
        String oldEmail = request.getParameter("oldMail");
        String newMail = request.getParameter("user_Email");

        Services sv = new Services();

        try {
            String storedEmail = sv.getStoredEmail(id);

            if (storedEmail != null) {
                if (oldEmail.equals(storedEmail)) {
                    boolean updateSuccess = sv.updateEmail(id, newMail);
                    if (updateSuccess) {
                        session.setAttribute("messageUpdate", "Email actualizado con éxito.");
                    } else {
                        session.setAttribute("messageUpdate", "Error actualizando el email.");
                    }
                } else {
                    session.setAttribute("messageUpdate", "El email antiguo no coincide.");
                }
            } else {
                session.setAttribute("messageUpdate", "Usuario no encontrado.");
            }
        } catch (Exception e) {
            session.setAttribute("messageUpdate", "Error en la base de datos. Por favor, inténtalo de nuevo.");
        }

        response.sendRedirect("jsp/datosPersonales.jsp");
    }
}

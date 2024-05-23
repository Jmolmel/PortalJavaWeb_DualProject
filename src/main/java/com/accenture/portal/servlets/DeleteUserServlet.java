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
 * Servlet implementation class DeleteUserServlet
 * This servlet handles the deletion of a user account.
 */
public class DeleteUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles HTTP POST requests.
     *
     * @param request  The HttpServletRequest object containing the request parameters.
     * @param response The HttpServletResponse object for sending the response to the client.
     * @throws ServletException If an error occurs while processing the servlet request.
     * @throws IOException      If an I/O error occurs while handling the servlet request.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User activeUser = (User) session.getAttribute("user");

        // Redirect to login page if user is not logged in
        if (activeUser == null) {
            response.sendRedirect("./jsp/datosPersonales");
            return;
        }

        int id = activeUser.getId();

        try {
            // Attempt to delete the user account
            boolean delete = Services.deleteUserById(id);
            if (delete) {
                session.setAttribute("messageDelete", "Cuenta eliminada con éxito.");
                // Display success message and redirect to login page
                response.getWriter().println("<html><body>");
                response.getWriter().println("<script type='text/javascript'>");
                response.getWriter().println("alert('Cuenta eliminada con éxito.');");
                response.getWriter().println("window.top.location.href = 'login.jsp';");
                response.getWriter().println("</script>");
                response.getWriter().println("</body></html>");
            } else {
                session.setAttribute("messageDelete", "No se ha podido eliminar su cuenta.");
                // Display error message and redirect to personal data page
                response.getWriter().println("<html><body>");
                response.getWriter().println("<script type='text/javascript'>");
                response.getWriter().println("alert('No se ha podido eliminar su cuenta.');");
                response.getWriter().println("window.top.location.href = './jsp/datosPersonales';");
                response.getWriter().println("</script>");
                response.getWriter().println("</body></html>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Display error message and redirect to personal data page
            response.getWriter().println("<html><body>");
            response.getWriter().println("<script type='text/javascript'>");
            response.getWriter().println("alert('Ocurrió un error al eliminar la cuenta.');");
            response.getWriter().println("window.top.location.href = './jsp/datosPersonales';");
            response.getWriter().println("</script>");
            response.getWriter().println("</body></html>");
        }
    }
}

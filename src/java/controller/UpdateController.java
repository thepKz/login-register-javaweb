package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import userDB.UserDAO;
import userDB.UserDTO;

@WebServlet(name = "UpdateController", urlPatterns = { "/UpdateController" })
public class UpdateController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userID = request.getParameter("userID");
        String fullName = request.getParameter("fullName");
        String roleID = request.getParameter("roleID");
        String password = request.getParameter("password");

        UserDTO user = new UserDTO(userID, fullName, roleID, password);
        UserDAO dao = new UserDAO();

        try {
            boolean isUpdated = dao.update(user);
            if (isUpdated) {
                request.getRequestDispatcher("listController").forward(request, response);
            } else {
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
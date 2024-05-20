package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import userDB.UserDAO;

@WebServlet(name = "DeleteController", urlPatterns = { "/DeleteController" })
public class DeleteController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Delete user and turnback to listController
        try {
            String userID = request.getParameter("userID");
            UserDAO dao = new UserDAO();
            dao.delete(userID);
            request.getRequestDispatcher("listController").forward(request, response);
        } catch (Exception e) {
            log("Error at DeleteController: " + e.toString());
        } finally {
            request.getRequestDispatcher("listController").forward(request, response);
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
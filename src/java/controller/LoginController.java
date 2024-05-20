/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

@WebServlet(name = "LoginServlet", urlPatterns = { "/loginservlet" })
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");

            UserDAO dao = new UserDAO();
            UserDTO loginUser = dao.checkLogin(user, pass);
            String ms = "";
            if (loginUser != null) {
                ms = "Welcome " + user + "!";
                request.setAttribute("success", ms);
                request.getRequestDispatcher("listController").forward(request, response);
            } else {
                ms = "Invalid user or password!!!";
                request.setAttribute("fail", ms);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (IOException | SQLException | ServletException e) {
            e.printStackTrace();
        }
    }

}

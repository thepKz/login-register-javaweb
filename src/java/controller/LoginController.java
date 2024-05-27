package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserDAO;
import model.UserDTO;

@WebServlet(name = "LoginController", urlPatterns = { "/LoginController" })
public class LoginController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String USER_HOME_PAGE = "user.jsp";
    private static final String STAFF_DASHBOARD = "staff.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(LOGIN_PAGE).forward(request, response);
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

            if (loginUser != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", loginUser);
                session.setAttribute("role", loginUser.getRoleID());

                System.out.print(loginUser.getRoleID() + " Check log Role user! and check staff_ROLE: ");
                System.out.println(UserDTO.STAFF_ROLE);
                if (loginUser.getRoleID().equals(UserDTO.USER_ROLE)) { // Role 0: user
                    response.sendRedirect(USER_HOME_PAGE);
                } else if (loginUser.getRoleID().equals(UserDTO.STAFF_ROLE)) { // Role 2: staff
                    response.sendRedirect(STAFF_DASHBOARD);
                    System.out.println("staff");
                } else {
                    // Xử lý cho các role khác (nếu có) hoặc báo lỗi
                    request.setAttribute("errorMessage", "Invalid role!");
                    request.getRequestDispatcher(LOGIN_PAGE).forward(request, response);
                }
            } else {
                request.setAttribute("errorMessage", "Invalid username or password!");
                request.getRequestDispatcher(LOGIN_PAGE).forward(request, response);
            }
        } catch (SQLException e) {
            log("Login Error: " + e.getMessage());
            request.setAttribute("errorMessage", "Database error. Please try again later.");
            request.getRequestDispatcher(LOGIN_PAGE).forward(request, response);
        }
    }
}

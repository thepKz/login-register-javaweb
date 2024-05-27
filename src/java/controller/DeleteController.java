package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MobileDAO;

@WebServlet("/DeleteController")
public class DeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Kiểm tra session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("role") == null || !session.getAttribute("role").equals("2")) {
            response.sendRedirect("login.jsp");
            return;
        }

        String mobileId = request.getParameter("mobileId");
        MobileDAO dao = new MobileDAO();
        boolean isDeleted = dao.deleteMobile(mobileId);

        if (isDeleted) {
            // Xóa thành công
            response.sendRedirect("staff.jsp");
        } else {
            // Xóa thất bại, có thể do lỗi hoặc sản phẩm không tồn tại
            request.setAttribute("errorMessage", "Xóa sản phẩm thất bại.");
            request.getRequestDispatcher("staff.jsp").forward(request, response);
        }
    }
}
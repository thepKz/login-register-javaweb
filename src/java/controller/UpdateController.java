package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Mobile;
import model.MobileDAO;

@WebServlet("/UpdateController")
public class UpdateController extends HttpServlet {

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
        Mobile mobile = dao.getMobileById(mobileId); // Lấy thông tin sản phẩm cần sửa

        if (mobile != null) {
            request.setAttribute("mobile", mobile); // Đặt thuộc tính "mobile" vào request
            request.getRequestDispatcher("editMobile.jsp").forward(request, response);
        } else {
            // Sản phẩm không tồn tại
            request.setAttribute("errorMessage", "Sản phẩm không tồn tại.");
            request.getRequestDispatcher("staff.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Kiểm tra session (tương tự như doGet)

        // Lấy thông tin cập nhật từ form
        System.out.println("Check update with ID: " + request.getParameter("mobileId"));
        String mobileId = request.getParameter("mobileId");
        String mobileName = request.getParameter("mobileName");
        String description = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        int yearOfProduction = Integer.parseInt(request.getParameter("yearOfProduction"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        boolean notSale = request.getParameter("notSale") != null ? false : true; // Kiểm tra checkbox

        Mobile updatedMobile = new Mobile(mobileId, description, price, mobileName, yearOfProduction, quantity,
                notSale);
        MobileDAO dao = new MobileDAO();
        boolean isUpdated = dao.updateMobile(updatedMobile);

        if (isUpdated) {
            // Cập nhật thành công
            response.sendRedirect("staff.jsp");
        } else {
            // Cập nhật thất bại
            request.setAttribute("errorMessage", "Cập nhật sản phẩm thất bại.");
            request.getRequestDispatcher("editMobile.jsp").forward(request, response);
        }
    }
}
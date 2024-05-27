package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Mobile;
import model.MobileDAO;

@WebServlet("/CreateController")
public class CreateController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String mobileId = request.getParameter("mobileId");
        String mobileName = request.getParameter("mobileName");
        String description = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        int yearOfProduction = Integer.parseInt(request.getParameter("yearOfProduction"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        boolean notSale = request.getParameter("notSale") != null ? false : true; // Kiểm tra checkbox
        System.out.println("notSale trả về: " + notSale);
        Mobile newMobile = new Mobile(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale);

        MobileDAO dao = new MobileDAO();
        boolean isInserted = dao.insertMobile(newMobile);

        if (isInserted) {
            // Chuyển hướng về trang staff.jsp để xem kết quả
            System.out.println("Check thành công tạo");
            response.sendRedirect("staff.jsp");
        } else {
            // Xử lý lỗi nếu thêm không thành công (ví dụ: hiển thị thông báo lỗi)
            String errorMessage = "Thêm thiết bị thất bại do có thể là trùng mã thiết bị hoặc bị lỗi khác!";
            request.setAttribute("errorMessageCreate", errorMessage); // Đặt thuộc tính errorMessageCreate
            request.getRequestDispatcher("createMobile.jsp").forward(request, response); // Chuyển về trang
                                                                                         // createMobile.jsp
        }
    }
}
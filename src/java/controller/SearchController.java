package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Mobile;
import model.MobileDAO;

@WebServlet("/SearchController")
public class SearchController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String search = request.getParameter("search");
        System.out.println("search CHECK");
        MobileDAO dao = new MobileDAO();
        List<Mobile> searchResults = dao.searchDeviceByIdOrName(search);
        for (Mobile check : searchResults) {
            System.out.println(
                    check.getMobileId() + "hello");
        }
        request.setAttribute("searchResults", searchResults);
        request.getRequestDispatcher("staff.jsp").forward(request, response);
    }
}
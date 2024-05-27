package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Mobile;
import model.MobileDAO;
import model.UserDTO;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
    private static final String USER_PAGE = "user.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("role") == null || !session.getAttribute("role").equals("0")) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        switch (action) {
            case "searchByPrice":
                searchByPrice(request, response);
                break;
            case "viewCart":
                viewCart(request, response);
                break;
            case "removeFromCart":
                removeFromCart(request, response);
                break;
            default:
                request.getRequestDispatcher(USER_PAGE).forward(request, response);
                break;
        }
    }

    private void searchByPrice(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        float minPrice = Float.parseFloat(request.getParameter("minPrice"));
        float maxPrice = Float.parseFloat(request.getParameter("maxPrice"));

        MobileDAO dao = new MobileDAO();
        List<Mobile> searchResults = dao.searchDeviceByPriceRange(minPrice, maxPrice);

        request.setAttribute("searchResults", searchResults);
        request.getRequestDispatcher(USER_PAGE).forward(request, response);
    }

    private void viewCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");
        if (user != null) {
            String userId = user.getUserID();

            MobileDAO dao = new MobileDAO();
            List<Mobile> cartItems = dao.viewMobileCart(userId, session);

            request.setAttribute("cart", cartItems);
            request.getRequestDispatcher("viewCart.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Bạn chưa đăng nhập.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

  private void removeFromCart(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    HttpSession session = request.getSession();
    String mobileId = request.getParameter("mobileId");

    // Xóa sản phẩm khỏi session
    session.removeAttribute("mobile_" + mobileId);

    // Lấy lại giỏ hàng
    Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
    if (cart != null && cart.containsKey(mobileId)) {
        cart.remove(mobileId);
        session.setAttribute("cart", cart);
    }

    // Chuyển hướng về trang xem giỏ hàng
    response.sendRedirect("UserController?action=viewCart");
}
}
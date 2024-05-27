<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.UserDTO"%>
<%@page import="model.Mobile"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Trang Người Dùng</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to bottom right, #ffd700, #ffa500); /* Gradient vàng cam */
            color: #333;
        }
        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            margin-top: 50px;
        }
        h1 {
            text-align: center;
            color: #fff;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
            padding: 20px;
            background-color: #ffa500; /* Màu cam */
            border-radius: 10px 10px 0 0;
        }
        h2 {
            color: #ffa500;
            border-bottom: 2px solid #ffa500;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .btn-add-to-cart {
            background-color: #ffa500;
            border-color: #ffa500;
        }
        .btn-add-to-cart:hover {
            background-color: #ff8c00;
            border-color: #ff8000;
        }
        .table th {
            background-color: #ffa500;
            color: white;
        }
        .table-hover tbody tr:hover {
            background-color: #ffe4b5; /* Màu vàng nhạt khi hover */
        }
    </style>
</head>
<body>

    <%
        UserDTO user = (UserDTO) session.getAttribute("user");
        if (user != null) {
    %>

    <div class="container mt-5">
        <h1 class="text-center"><i class="fas fa-shopping-cart"></i> Cửa hàng điện thoại</h1>
        <p class="lead text-muted">Xin chào, <span style="font-weight: bold;"><%= user.getFullName() %></span>! Chào mừng đến với cửa hàng của chúng tôi.</p>

        <h2 class="mt-4"><i class="fas fa-search"></i> Tìm kiếm theo khoảng giá:</h2>
        <form action="UserController" method="GET" class="form-inline mb-3">
            <input type="hidden" name="action" value="searchByPrice">
            <div class="form-group mr-2">
                <label for="minPrice">Giá từ:</label>
                <input type="number" id="minPrice" name="minPrice" class="form-control" required>
            </div>
            <div class="form-group mr-2">
                <label for="maxPrice">đến:</label>
                <input type="number" id="maxPrice" name="maxPrice" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i> Tìm kiếm</button>
        </form>

        <%
            List<Mobile> searchResults = (List<Mobile>) request.getAttribute("searchResults");
            if (searchResults != null) {
        %>
        <h2 class="mt-4"><i class="fas fa-list"></i> Kết quả tìm kiếm:</h2>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <% for (Mobile mobile : searchResults) { %>
                    <tr>
                        <td><%= mobile.getMobileId() %></td>
                        <td><%= mobile.getMobileName() %></td>
                        <td><%= String.format("%.0f VNĐ", mobile.getPrice()) %></td>
                        <td>
                            <form action="user.jsp" method="POST">
                                <input type="hidden" name="mobileId" value="<%= mobile.getMobileId() %>">
                                <button type="submit" class="btn btn-add-to-cart btn-sm" onclick="addToCart('<%= mobile.getMobileId() %>'); return false;">
                                    <i class="fas fa-cart-plus"></i> Thêm vào giỏ hàng
                                </button>
                            </form>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <%
            } 
        %>
        <a href="UserController?action=viewCart" class="btn btn-info mt-3">
            <i class="fas fa-shopping-cart"></i> Xem giỏ hàng (<span id="cartCount">0</span>)
        </a>
    </div>
    
    <%
        } else {
    %>
    <div class="container mt-5">
        <h1 class="text-center">Cửa hàng điện thoại</h1>
        <p class="lead text-muted text-center">Bạn chưa đăng nhập. Vui lòng <a href="login.jsp">đăng nhập</a> để mua hàng.</p>
    </div>
    <%
        }
    %>

    <script>
    // Function to update cart count on click
    function addToCart(mobileId) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                var currentCount = parseInt(document.getElementById("cartCount").innerText);
                document.getElementById("cartCount").innerText = currentCount + 1;
            }
        };
        xhttp.open("POST", "user.jsp", true); 
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("mobileId=" + mobileId);
    }
    </script>
    <%-- Xử lý thêm vào giỏ hàng (bỏ chuyển hướng) --%>
    <%
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String mobileId = request.getParameter("mobileId");

            List<String> cart = (List<String>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
                session.setAttribute("cart", cart);
            }
            cart.add(mobileId);
        }
    %>
</body>
</html>

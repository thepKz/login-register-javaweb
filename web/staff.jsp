<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.UserDTO"%>
<%@page import="model.MobileDAO"%>
<%@page import="model.Mobile"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Trang quản lý sản phẩm</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
    </style>
</head>
<body>

    <%
        if (session != null && session.getAttribute("user") != null) {
            UserDTO user = (UserDTO) session.getAttribute("user");
    %>

    <div class="container mt-5">
        <h1 class="text-center"><i class="fas fa-mobile-alt"></i> Quản lý sản phẩm</h1>
        <p class="lead text-muted">Xin chào, <span style="color: #007bff; font-weight: bold; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3); font-family: 'Dancing Script', cursive; font-size: 1.2em;"><%= user.getFullName() %></span>! Đây là trang quản lý thiết bị di động dành cho nhân viên.</p>


        <h2 class="mt-4"><i class="fas fa-search"></i> Tìm kiếm thiết bị:</h2>
        <form action="MainController" method="post" class="form-inline mb-3">
            <input type="hidden" name="action" value="Search">
            <input type="text" name="search" class="form-control mr-sm-2" placeholder="Nhập ID hoặc tên thiết bị">
            <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i> Tìm kiếm</button>
        </form>

        <%
            List<Mobile> searchResults = (List<Mobile>) request.getAttribute("searchResults");
            if (searchResults != null) {
        %>
        <h2 class="mt-4"><i class="fas fa-list"></i> Kết quả tìm kiếm:</h2>
        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Mô tả</th>
                    <th>Giá</th>
                    <th>Năm sản xuất</th>
                    <th>Số lượng</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <% for (Mobile mobile : searchResults) { %>
                <tr>
                    <td><%= mobile.getMobileId() %></td>
                    <td><%= mobile.getMobileName() %></td>
                    <td><%= mobile.getDescription() %></td>
                    <td><%= String.format("%.0f", mobile.getPrice()) %></td>
                    <td><%= mobile.getYearOfProduction() %></td>
                    <td><%= mobile.getQuantity() %></td>
                    <td><%= mobile.isNotSale() ? "Không bán" : "Đang bán" %></td>
                    <td>
                        <a href="MainController?action=Update&mobileId=<%= mobile.getMobileId() %>" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Sửa</a> 
                        |
                        <a href="MainController?action=Delete&mobileId=<%= mobile.getMobileId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa?');"><i class="fas fa-trash-alt"></i> Xóa</a> 
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <%
            }
        %>
        <a href="createMobile.jsp;jsessionid=<%= session.getId() %>" class="btn btn-custom mt-3"><i class="fas fa-plus"></i> Thêm thiết bị</a>
    </div>

    <%
        } else {
    %>
    <p>Bạn chưa đăng nhập. Vui lòng <a href="login.jsp">đăng nhập</a>.</p>
    <%
        }
    %>
</body>
</html>

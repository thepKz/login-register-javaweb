<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Mobile"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin-top: 50px;
        }

        h1 {
            color: #007bff;
            text-align: center;
            margin-bottom: 30px;
        }

        .table th {
            background-color: #007bff;
            color: white;
        }

        .btn-remove {
            background-color: #dc3545; /* Màu đỏ */
            border-color: #dc3545;
        }

        .btn-remove:hover {
            background-color: #c82333; /* Màu đỏ đậm hơn khi hover */
            border-color: #bd2130;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1 class="text-center"><i class="fas fa-shopping-cart"></i> Giỏ hàng của bạn</h1>

        <%
            List<Mobile> cartItems = (List<Mobile>) request.getAttribute("cart");
            if (cartItems != null && !cartItems.isEmpty()) {
        %>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá</th>
                    <th>Số lượng</th> 
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    int quantity = 1; // Số lượng mặc định khi thêm vào giỏ hàng
                    for (Mobile mobile : cartItems) {
                %>
                    <tr>
                        <td><%= mobile.getMobileId() %></td>
                        <td><%= mobile.getMobileName() %></td>
                        <td><%= String.format("%.0f VNĐ", mobile.getPrice()) %></td>
                        <td><%= quantity %></td>
                        <td>
                            <button onclick="removeFromCart('<%= mobile.getMobileId() %>', this)" class="btn btn-remove btn-sm">
                                <i class="fas fa-trash-alt"></i> Xóa
                            </button>
                        </td>
                    </tr>
                <% 
                    } 
                %>
            </tbody>
        </table>
        <%
            } else {
        %>
        <p class="text-center">Giỏ hàng trống</p>
        <%
            }
        %>
    </div>

    <script>
        function removeFromCart(mobileId, button) {
            // Xóa sản phẩm khỏi giao diện người dùng
            var row = button.parentNode.parentNode;
            row.parentNode.removeChild(row);

            // Gửi yêu cầu AJAX để xóa sản phẩm khỏi giỏ hàng trong session
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    // Cập nhật số lượng sản phẩm trong giỏ hàng trên trang (nếu cần)
                }
            };
            xhttp.open("POST", "UserController?action=removeFromCart&mobileId=" + mobileId, true);
            xhttp.send();
        }
    </script>
</body>
</html>

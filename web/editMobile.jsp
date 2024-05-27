<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Mobile"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sửa thiết bị di động</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa; /* Màu nền nhạt */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container {
            background-color: #fff; /* Màu nền trắng */
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* Hiệu ứng đổ bóng nhẹ */
            margin-top: 50px; /* Khoảng cách từ trên xuống */
        }

        h1 {
            color: #007bff; /* Màu xanh dương nổi bật */
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group label {
            font-weight: bold;
        }

        .form-control {
            border-radius: 8px; /* Bo tròn input fields */
            padding: 12px;
        }

        .btn-custom {
            background-color: #ffc107; /* Màu vàng nổi bật */
            border-color: #ffc107;
        }

        .btn-custom:hover {
            background-color: #e0a800; /* Màu vàng đậm hơn khi hover */
            border-color: #d39e00;
        }

        /* Hiệu ứng focus cho input fields */
        .form-control:focus {
            border-color: #007bff; /* Viền xanh dương khi focus */
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25); 
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><i class="fas fa-edit"></i> Sửa thiết bị di động</h1>

        <% Mobile mobile = (Mobile) request.getAttribute("mobile"); %>
        <form action="UpdateController" method="POST">
            <input type="hidden" name="mobileId" value="<%= mobile.getMobileId() %>">

            <div class="form-group">
                <label for="mobileName">Tên thiết bị:</label>
                <input type="text" id="mobileName" name="mobileName" class="form-control" value="<%= mobile.getMobileName() %>" required>
            </div>

            <div class="form-group">
                <label for="description">Mô tả:</label>
                <textarea id="description" name="description" class="form-control" rows="4" cols="50"><%= mobile.getDescription() %></textarea>
            </div>

            <div class="form-group">
                <label for="price">Giá:</label>
                <input type="number" id="price" name="price" class="form-control" value="<%= mobile.getPrice() %>" required>
            </div>

            <div class="form-group">
                <label for="yearOfProduction">Năm sản xuất:</label>
                <input type="number" id="yearOfProduction" name="yearOfProduction" class="form-control" value="<%= mobile.getYearOfProduction() %>" required>
            </div>

            <div class="form-group">
                <label for="quantity">Số lượng:</label>
                <input type="number" id="quantity" name="quantity" class="form-control" value="<%= mobile.getQuantity() %>" required>
            </div>

            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="notSale" name="notSale" value="1" <%= mobile.isNotSale() ? "checked" : "" %>>
                <label class="form-check-label" for="notSale">Không bán</label>
            </div>
            <input type="hidden" name="notSale" value="0"> 

            <button type="submit" class="btn btn-custom"><i class="fas fa-save"></i> Cập nhật thiết bị</button>
        </form>
    </div>
</body>
</html>

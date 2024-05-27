<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thêm thiết bị di động</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        h1 {
            color: #007bff;
            margin-bottom: 20px;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-custom {
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-custom:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
    </style>
</head>
<body>

    <div class="container mt-5">
        <h1 class="text-center"><i class="fas fa-plus"></i> Thêm thiết bị di động</h1>

        <% String errorMessage = (String) request.getAttribute("errorMessageCreate");
           if (errorMessage != null) { %>
            <div class="alert alert-danger" role="alert">
                <%= errorMessage %>
            </div>
        <% } %>

        <form action="MainController" method="POST">
            <input type="hidden" name="action" value="Create">

            <div class="form-group">
                <label for="mobileId">Mã thiết bị:</label>
                <input type="text" id="mobileId" name="mobileId" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="mobileName">Tên thiết bị:</label>
                <input type="text" id="mobileName" name="mobileName" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="description">Mô tả:</label>
                <textarea id="description" name="description" class="form-control" rows="4" cols="50"></textarea>
            </div>

            <div class="form-group">
                <label for="price">Giá:</label>
                <input type="number" id="price" name="price" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="yearOfProduction">Năm sản xuất:</label>
                <input type="number" id="yearOfProduction" name="yearOfProduction" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="quantity">Số lượng:</label>
                <input type="number" id="quantity" name="quantity" class="form-control" required>
            </div>
            
            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="notSale" name="notSale" value="1">
                <label class="form-check-label" for="notSale">Không bán</label>
            </div>
            <input type="hidden" name="notSale" value="0"> 

            <button type="submit" class="btn btn-custom"><i class="fas fa-plus"></i> Thêm thiết bị</button>
        </form>
    </div>

</body>
</html>

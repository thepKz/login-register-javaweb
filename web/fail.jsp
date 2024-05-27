<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>Min Thep</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="../css/style.css">
    <style>
        @media screen and (max-width: 1090px) {
            .menu {
                margin-bottom: 25px;
            }

            .author {
                margin: 0 !important;
                text-align: center !important;
            }

            p {
                text-align: justify;
            }

            .list-group-item a {
                word-break: break-word;
                overflow-wrap: break-word;
            }

            li {
                font-size: 10px !important;
            }

            #header,
            .menu {
                height: 0px !important;
                display: flex !important;
            }
        }
        .animated-text {
            animation: color-change 8s infinite alternate ease-in-out;
          }
          
          @keyframes color-change {
            0% { color: #007bff; transform: scale(1); opacity: 1; }
            25% { color: #6f42c1; transform: scale(1.1); opacity: 0.8; }
            50% { color: #fd7e14; transform: scale(1.2); opacity: 0.6; }
            75% { color: #dc3545; transform: scale(1.1); opacity: 0.8; }
            100% { color: #28a745; transform: scale(1); opacity: 1; }
          }
    </style>
</head>

<body>

    <div style="height: 50px;"></div>


    <div class="container">

        <div class="text-center align-items-center">
            <!-- Nội dung thông báo 404 Not Found -->
            <img src="Forbidden.png" alt="art" class="img-fluid" style="width: 50%;">
            <h1 class="animated-text">Oops! Không tồn tại hoặc bị lỗi! Vui lòng quay lại trang trước đó</h1>
        </div>
    </div>










    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>

</html>
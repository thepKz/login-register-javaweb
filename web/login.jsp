<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="style.css">
    <title>Login Ne!</title>
            <style>
        .error-message {
            color: red; 
            text-align: center;
            margin: 10px 0;
        }
        </style>
</head>

    <body>
        <section>
            <form action="MainController" method="POST">
                <h1>Login</h1>
                

                <div class="inputbox">
                    <ion-icon name="text-outline"></ion-icon>
                    <input type="text" name="user" required>
                    <label for="user">UserName</label>
                </div>
                <div class="inputbox">
                    <ion-icon name="lock-closed-outline"></ion-icon>
                    <input type="password" name="pass" required>
                    <label for="pass">Password</label>
                </div>
                <div class="forget">
                    <label for=""><input type="checkbox">Remember Me</label>
                    <a href="register.jsp">Forget Password</a>
                </div>
                <div class="error-message">
                    <% if (request.getAttribute("fail") != null) { %>
                        Error: <%= request.getAttribute("fail") %><br/>
                    <% } %>
                </div>
                <button name="action" value="Login">Login</button>
                <div class="register">
                    <p>Don't have a account <a href="register.jsp">Register</a></p>
                </div>
            </form>
        </section>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>

</html>
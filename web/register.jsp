<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css"/>
        <title>Register</title>
        <style>
        .error-message {
    color: red; 
    text-align: center;
    padding: 10px; 
    margin: 10px 0;
}
        </style>
        <script>
            function validateForm() {
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("confirmPassword").value;
                var message = document.getElementById("message");
                if (username.includes(" ")) {
                    message.style.color = "red";
                    message.innerHTML = "No space in UserName!";
                    return false;
                }
                if (password != confirmPassword && confirmPassword !="") {
                    message.style.color = "red";
                    message.innerHTML = "Passwords do not match.";
                    return false;
                } else if (confirmPassword !=""){
                    message.style.color = "white";
                    message.innerHTML = "Passwords match.";
                }
                return true;
            }
        </script>
    </head>
    <body>
        
        <section>
            <form action="MainController" method="post" onsubmit="return validateForm()">
                <h1>Register</h1>
                <div class="error-message">
                    <%@page import="model.UserError"%>
                    <% if (request.getAttribute("USER_ERROR") != null) {
                        UserError userError = (UserError) request.getAttribute("USER_ERROR");
                    %>
                    Error: <%= userError.getUserID() %><br/>
                    <% } %>
                    </div>
                <div class="inputbox">
                    <ion-icon name="text-outline"></ion-icon>
                    <input type="text" id="username" name="userID" required onchange="validateForm()">
                    <label for="username">UserName</label>
                </div>
                <div class="inputbox">
                    <ion-icon name="text-outline"></ion-icon>
                    <input type="text" id="fullName" name="fullName" required>
                    <label for="fullName">Full Name</label>
                </div>
                <div class="inputbox" style="display:flex!important;flex-direction: row!important;">
                    <div class="radio-option" style="position: relative!important;">
                   
                        <input type="radio" id="user" name="role" value="0" checked required style="position: relative!important;height:20px!important; width: 20px!important;">
                        <label for="user" style="position: relative!important;">User</label>
                    </div>
                    <div class="radio-option" style="position: relative!important;">
          
                        <input type="radio" id="staff" name="role" value="2" required style="position: relative!important;margin-left : 10px!important;height:20px!important; width: 20px!important;">
                        <label for="staff" style="position: relative!important;">Staff</label>
                    </div>
                    </div>
                <div class="inputbox">
                    <ion-icon name="lock-closed-outline"></ion-icon>
                    <input type="password" id="password" name="password" required onchange="validateForm()">
                    <label for="password">Password</label>
                </div>
                <div class="inputbox">
                    <ion-icon name="lock-closed-outline"></ion-icon>
                    <input type="password" id="confirmPassword" required onchange="validateForm()">
                    <label for="confirmPassword">Confirm Password</label>
                </div>
                <div id="message">
                </div>
                <button name="action" value="Register">Register</button>
                <div class="register">
                    <p>You have a account? <a href="login.jsp">Login here!</a></p>
                </div>
            </form>
        </section>
                <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script> 
    </body>
</html>
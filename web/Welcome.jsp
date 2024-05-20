<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="userDB.UserDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
        <!-- Add Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .table {
                margin-top: 20px;
                border-radius: 5px;
                box-shadow: 0 5px 10px rgba(0,0,0,.1);
            }
            .table th {
                color: #ffffff;
                background-color: #343a40;
            }
            .table td {
                vertical-align: middle;
            }
            .table .form-control {
                border: 0;
                border-radius: 0;
                box-shadow: none;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1 class="text-center mt-4">Welcome to user database!</h1>
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>User ID</th>
                        <th>Full Name</th>
                        <th>Delete</th>
                        <th>Update</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<UserDTO> list = (List) request.getAttribute("listUser");
                        if (list != null) {
                            for (UserDTO i : list) {
                    %>
                        <tr>
                            <td><%= i.getUserID() %></td>
                            <td><%= i.getFullName() %></td>
                            <td>
                                <form action="MainController" method="POST">
                                    <input type="hidden" name="userID" value="<%= i.getUserID() %>">
                                    <input type="hidden" name="action" value="Delete">
                                    <input type="submit" class="btn btn-danger" value="Delete">
                                </form>
                            </td>
                            <td>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateModal<%= i.getUserID() %>">
                            Update
                        </button>

                        <div class="modal fade" id="updateModal<%= i.getUserID() %>" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header bg-primary text-white">
                                        <h5 class="modal-title" id="updateModalLabel">Update User</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form action="MainController" method="POST">
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="userID">User ID</label>
                                                <input type="text" class="form-control" name="userID" value="<%= i.getUserID() %>">
                                            </div>
                                            <div class="form-group">
                                                <label for="fullName">Full Name</label>
                                                <input type="text" class="form-control" name="fullName" value="<%= i.getFullName() %>">
                                            </div>
                                            <div class="form-group">
                                                <label for="roleID">Role ID</label>
                                                <input type="text" class="form-control" name="roleID" value="<%= i.getRoleID() %>">
                                            </div>
                                            <div class="form-group">
                                                <label for="password">Password</label>
                                                <input type="password" class="form-control" name="password" value="<%= i.getPassword() %>">
                                            </div>
                                           
                                            <input type="hidden" name="action" value="Update">
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <input type="submit" class="btn btn-primary" value="Update">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </td>
                        </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
      <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>New User</title>
    <%@ include file="components/common_css_js.jsp" %>
</head>
<body>
    <%@ include file="components/navbar.jsp" %>
    
    <div class="container-fluid">
        <div class="row mt-5">
            <div class="col-md-4 offset-md-4">
                
                <div class="card">
                    <%@ include file="components/message.jsp" %>
                    <div class="card-body px-5" style="color: #442C2E;">
                        <div class="text-center">
                            <img src="img/sign-up-logo.png" width="100" height="100" alt="">
                        </div>
                        <h3 class="text-center my-3">Sign Up Here !!!</h3>
                        
                        <form action="RegisterServlet" method="post">
                            <div class="form-group">
                                <label for="name">User Name</label>
                                <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter Username">
                            </div>
                            
                            <div class="form-group">
                                <label for="email">Email ID</label>
                                <input name="user_email" type="text" class="form-control" id="name" placeholder="Enter Email">
                            </div>
                            
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter Password">
                            </div>
                            
                            <div class="form-group">
                                <label for="phone">Mobile Number</label>
                                <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter Mobile Number">
                            </div>
                            
                            <div class="form-group">
                                <label for="phone">User Address</label>
                                <textarea name="user_address" style="height:200px" class="form-control" placeholder="Enter Your Address"></textarea>
                            </div>
                            
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Register</button>
                                <button class="btn btn-outline-warning">Reset</button>
                            </div>
                        </form>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    <%@include file="components/common_modals.jsp"%>                
</body>
</html>
 
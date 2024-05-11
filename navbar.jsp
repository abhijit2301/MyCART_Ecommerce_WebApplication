<%@page import="com.learn.mycart.entities.User"%>
<% 

    User user1 = (User)session.getAttribute("current-user");

%>


<link rel="stylesheet" href="css/style.css"/>
<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container">
        <a class="navbar-brand" href="#">
    <img src="img/logo_1.png" width="30" height="30" alt="">
  </a>
        <a class="navbar-brand mb-0 h1" href="index.jsp"><b>ALL_IN_CART</b></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      
    </ul>
    
      <ul class="navbar-nav ml-auto">
         
        <div class="dt mr-4">
            <b><span id="datetime"></span></b>
        </div>  
          
        <li class="nav-item active">
            <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart"><i class="fa fa-shopping-cart" style="color:#ffff80; font-size: 25px"></i><span class="ml-1 cart-items" style="">(0)</span></a>
        </li>
          
        <% 
            if(user1==null){
            
            %>
            <li class="nav-item active">
                <a class="nav-link" href="login.jsp"><b>LOGIN</b></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="register.jsp"><b>REGISTER</b></a>
            </li>
            
            <%
            }else{
            
            %>
            <li class="nav-item active">
                <a class="nav-link" href="<%= user1.getUserType().equals("admin") ? "admin.jsp" : "normal.jsp"%>"><b><%= user1.getUserName()%></b></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="LogoutServlet"><b>LOGOUT</b></a>
            </li>
            
            <%
            }
          
        %>
          
          
        
      </ul>
      </div>
    </div>
</nav>
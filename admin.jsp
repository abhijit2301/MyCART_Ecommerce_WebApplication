<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.User"%>
<%  
    User user = (User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if(user.getUserType().equals("normal")){
            session.setAttribute("message", "You are not an admin! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>
<% 
    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cdao.getCategories();
    
    //getting count
    
    Map<String,Long> m =Helper.getCounts(FactoryProvider.getFactory());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Panel</title>
    <%@ include file="components/common_css_js.jsp" %>
</head>
<body>
    <%@ include file="components/navbar.jsp" %>
    
    <div class="container admin">
        
        <div class="container-fluid mt-3">
            <%@include file="components/message.jsp"%>
        </div>
        
        <div class="row mt-3">
            
            <!-- first col -->
            <div class="col-md-4">
                <!-- First Box -->
                <div class="card">
                    <div class="card-body text-center font-color">
                        <div class="container">
                            <img style="max-width: 100px;" class="img-fluid" src="img/user-group.png" alt="user-icon"/>
                        </div>
                        <h1><%=m.get("userCount")%></h1>
                        <h1 class="text-uppercase text-muted"><b>Users</b></h1>
                    </div>
                </div>
            </div>
            
            <!-- second col -->
            <div class="col-md-4">
                <!--second box-->
                <div class="card">
                    <div class="card-body text-center font-color">
                        <div class="container">
                            <img style="max-width: 100px;" class="img-fluid" src="img/list.png" alt="user-icon"/>
                        </div>
                        <h1><%=list.size()%></h1>
                        <h1 class="text-uppercase text-muted"><b>Categories</b></h1>
                    </div>
                </div>
            </div>
            
            <!-- third col -->
            <div class="col-md-4">
                <!--third box-->
                <div class="card">
                    <div class="card-body text-center font-color">
                        <div class="container">
                            <img style="max-width: 100px;" class="img-fluid" src="img/product.png" alt="user-icon"/>
                        </div>
                        <h1><%=m.get("productCount")%></h1>
                        <h1 class="text-uppercase text-muted"><b>Products</b></h1>
                    </div>
                </div>
            </div>
            
        </div>
        
        <!-- second row -->
        <div class="row mt-3">
            <!--second row first column-->
            <div class="col-md-6">
                <div class="card" data-toggle="modal" data-target="#add-category-modal">
                    <div class="card-body text-center font-color">
                        <div class="container">
                            <img style="max-width: 100px;" class="img-fluid" src="img/keys.png" alt="user-icon"/>
                        </div>
                        <p class="mt-2">Click Here To Add New Category</p>
                        <h1 class="text-uppercase text-muted"><b>Add Category</b></h1>
                    </div>
                </div>
            </div>
            
            <!--second row second column-->
            <div class="col-md-6">
                <div class="card" data-toggle="modal" data-target="#add-product-modal">
                    <div class="card-body text-center font-color">
                        <div class="container">
                            <img style="max-width: 100px;" class="img-fluid" src="img/add-button.png" alt="user-icon"/>
                        </div>
                        <p class="mt-2">Click Here To Add New Product</p>
                        <h1 class="text-uppercase text-muted"><b>Add product</b></h1>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- start category modal -->
    <!-- Modal -->
    <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header custom-bg text-white">
                    <h5 class="modal-title" id="exampleModalLabel"><b>Fill Category Details</b></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="ProductOperationServlet" method="post">
                        <input type="hidden" name="operation" value="addcategory">
                        <div class="form-group">
                            <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required>
                        </div>
                        <div class="form-group">
                            <textarea style="height:250px;" class="form-control mt-2" placeholder="Enter Category Description" name="catDescription" required></textarea>
                        </div>
                        <div class="container text-center">
                            <button class="btn btn-outline-success">Add Category</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- end category modal -->

    <!-- start product modal -->
    <!-- Modal -->
    <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header custom-bg text-white">
                    <h5 class="modal-title" id="exampleModalLabel"><b>Product Details</b></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!--form-->
                    <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                        
                        <input type="hidden" name="operation" value="addproduct"/>
                        
                        <!-- Product title -->
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required/> 
                        </div>
                        <!-- Product Description -->
                        <div class="form-group">
                            <textarea style="height:150px;" class="form-control" name="pDesc" placeholder="Enter product description"></textarea>
                        </div>
                        <!-- Product Price -->
                        <div class="form-group">
                            <input type="number" class="form-control" placeholder="Enter product price" name="pPrice" required/> 
                        </div>
                        <!-- Product Discount -->
                        <div class="form-group">
                            <input type="number" class="form-control" placeholder="Enter product Discount" name="pDiscount" required/> 
                        </div>
                        <!-- Product Quantity-->
                        <div class="form-group">
                            <input type="number" class="form-control" placeholder="Enter Product Quantity" name="pQuantity" required/> 
                        </div>
                        
                        
                        
                        
                        <!--product category-->
                        <!--product category-->
                        
                        <div class="form-group">
                           <select name="catId" class="form-control" id="">
                                <% for(Category c : list) { %>
                                    <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
                                <% } %>
                            </select>
                        </div>

                        <!--product photo-->
                        <div class="form-group">
                            <label for="pPic">Select Picture of Product</label><br>
                            <input type="file" name="pPic" required/>
                        </div>
                        <!--Submit Button-->
                        <div class="container text-center">
                            <button class="btn btn-outline-success">Add Product</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                    <!--end form-->
                </div>
            </div>
        </div>
    </div>
    <!-- end product modal -->
    <%@include file="components/common_modals.jsp"%>
</body>
</html>

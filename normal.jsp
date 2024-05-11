
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal User Page</title>
        <%@ include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@ include file="components/navbar.jsp" %>
        <div class="container-fluid">
        <div class="row mt-3 mx-2">
            <%
                String cat = request.getParameter("category");
                // Check for null and provide a default value
                cat = (cat == null) ? "all" : cat.trim();

                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list = null;

                if (cat.equals("all")) {
                    list = dao.getAllProducts();
                } else {
                    try {
                        int cid = Integer.parseInt(cat);
                        list = dao.getAllProductsById(cid);
                    } catch (NumberFormatException e) {
                        // Handle the case where the category parameter is not a valid integer
                        e.printStackTrace();
                        // You might want to redirect to an error page or handle it differently
                    }
                }

                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist = cdao.getCategories();
            %>
            
            <!--show categories-->
            <div class="col-md-2">
                
                <div class="list-group mt-4">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action <%= cat.equals("all") ? "active" : "" %>">
                        All Products
                    </a>
                 
                <% 
                for(Category c:clist){
                
                %>
                
                <a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action <%= cat.equals(String.valueOf(c.getCategoryId())) ? "active" : "" %>"><%= c.getCategoryTitle()%></a>
                
                <%    }
               
                %>
                
                </div>
                
            </div>
            
            <!--show products-->
            <div class="col-md-10">
                
                <!--row-->
                
                <div class="row mt-4">
                    <div class="col-md-12">
                        
                        <!--col:12-->
                        <div class="col-md-12">
                            
                            <div class="card-columns">
                                
                                <!--traversing products-->
                                <% 
                                
                                for(Product p:list){
                                %>
                                
                                
                                <!--Product card-->
                                <div class="card">
                                    <div class="container text-center">
                                        <img src="img/products/<%=p.getpPhoto()%>" style="max-height:270px; max-width: 100%; width:auto;" class="card-img-top mt-2" alt="">
                                    </div>
                                    
                                    <div class="card-body">
                                        
                                        <h5 class="card-title"><%=p.getpName()%></h5>
                                        
                                        <p class="card-text">
                                            <%= Helper.get10Words(p.getpDesc())%>
                                            
                                        </p>
                                        
                                    </div>
                                            
                                            <div class="card-footer text-center">
                                               
                                                <button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getpId() %>, '<%= p.getpName().replace("'", "\\'") %>', <%= p.getPriceAfterApplyingDiscount() %>)">Add To Cart</button>
                                                <button class="btn btn-outline-success"><b>&#x20B9 <%= p.getPriceAfterApplyingDiscount() %> :</b> <span class="text-secondary discount-label"><b>&#x20B9</b><%= p.getpPrice()%>/-,<%=p.getpDiscount()%>% off</span></button>
                                                
                                            </div>
                                    
                                </div>
                                
                                <% } 
                                if(list.size()==0){
                                    out.println("<h3><b>No item in these category</b></h3>");
                                }
                                
                                %>
                                
                                
                            </div>
                            
                        </div>
                        
                        
                    </div>
                    
                </div>
                
            </div>
            
        </div>
        </div>
       
        
     
        <%@ include file="components/common_modals.jsp"%>
    </body>
</html>

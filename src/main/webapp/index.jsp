

<%@page import="com.cakezone.cakezone.helper.Helper"%>
<%@page import="com.cakezone.cakezone.entities.Category"%>
<%@page import="com.cakezone.cakezone.dao.CategoryDao"%>
<%@page import="com.cakezone.cakezone.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.cakezone.cakezone.dao.ProductDao"%>
<%@page import="com.cakezone.cakezone.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@include file="components/common_css_js.jsp" %>
 <link rel="stylesheet" href="style.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cakezone: Home</title>
         <%@include file="components/common_css_js.jsp" %>
         <%@include file="components/common_css_js.jsp"  %>
        
    </head>
    <body>
        
        <%@include file="components/navbar.jsp" %>
       
         <div class="container-fluid custome-bg">
            <div class="row mt-3 mx-2">

                
                <%
                   String cat = request.getParameter("category");
                  // out.println(cat);
                   
                   ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                   List<Product>list = null;
                   
                   if(cat==null ||  cat.trim().equals("all")){
                   
                   list = dao.getAllProducts();
                   
                    }
                   else if (cat.trim().equals("all"))
                   {
                        list = dao.getAllProducts();
                    }
                    else{
                           int cid =  Integer.parseInt(cat.trim());
                           list = dao.getAllProductsById(cid);
                            
                        }
                   
                  
                   CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                   List<Category> clist =cdao.getCategories();
                
                %>
                
                <!--show categories-->
                <div class="col-md-2">
                    <div class="list-group mt-4">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active text-primary">
                       All Products</a>
                     
                    <%
                        for(Category c:clist)
                        {
                        
                         %>
                        
                         <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action "><%= c.getCategoryTitle() %> </a>
                         
                         <%
                        }
                    
                    %>
                    
                  </div>  
                </div>
                
                <!--show Product-->
                 <div class="col-md-10">
                       
                     <!-- row -->
                     <div class="row mt-4">
                        
                         <!-- col:12 -->
                         <div class="col-md-12">
                         <div class="card-columns">
                         
                           <!--   traversing product  -->  
                             
                           <%
                           for(Product p:list){
                           
                           %>  
                             
                          <!--product card-->
                                <div class="card product-card">
                              <div class="container text-center">
                                        <img src="img/product/<%= p.getpPhoto()%>" style="max-height: 200px;max-width: 100%;width: auto; " class="card-img-top m-2" alt="...">

                                    </div>
                               
                               <div class="card-body">
                                   
                                   <h5 class="card-title"><%= p.getpName() %></h5>
                                   <p class="card-text">
                                       <%= Helper.get10Words(p.getpDesc()) %>
                                       
                                   </p>
                               </div>
        
                                       <div class="card-footer text-center">
                                           <button class="btn custome-bg text-white" onclick="add_to_cart(<%= p.getpId()%>, '<%= p.getpName()%>',<%= p.getPriceAfterApplyingDiscount()%>)">Add to Cart</button>
                                        <button class="btn  btn-outline-success "> &#8377; <%= p.getPriceAfterApplyingDiscount()%>/-<span class="text-secondary discount-label">&#8377;<%= p.getpPrice()%>, <%= p.getpDiscount()%>%</span></button>

                                    </div>
                           
                                </div>
                            <% }
                                if(list.size()== 0)
                                {
                                        out.println("<h3>No item in this category</h3>");
                                }
                            %> 
                     </div>
                         
                     </div>
                            
                </div>

                </div>
        
        </div>
        
        </div>
     <%@include file="components/common_modals.jsp" %>
    </body>
    <!-- Footer Section -->
    
    <section class="footer">
    
        <div class="box-container custome-bg">
        <div class="box">
            <h3>quick links</h3>
        <a href="#"> <i class="fas fa-arrow-right"></i> Home</a>
        <a href="#"> <i class="fas fa-arrow-right"></i>Shop</a>
        <a href="#"> <i class="fas fa-arrow-right"></i>About</a>
        <a href="#"> <i class="fas fa-arrow-right"></i> Review</a>
        <a href="#"> <i class="fas fa-arrow-right"></i>Blog</a>
        <a href="#"> <i class="fas fa-arrow-right"></i>Contact</a>
        </div> 

        <div class="box">
            <h3>extra links</h3>
            <a href="#"> <i class="fas fa-arrow-right"></i>  my order </a>
            <a href="#"> <i class="fas fa-arrow-right"></i>  my favorite </a>
            <a href="#"> <i class="fas fa-arrow-right"></i>  my wishlist </a>
            <a href="#"> <i class="fas fa-arrow-right"></i>  my account </a>
            <a href="#"> <i class="fas fa-arrow-right"></i>  terms or use </a>
        </div>

        <div class="box">
            <h3>follow us</h3>
            <a href="#"> <i class="fab fa-facebook-f"></i> facebook </a>
            <a href="#"> <i class="fab fa-twitter"></i> twitter </a>
            <a href="#"> <i class="fab fa-instagram"></i> instagram </a>
            <a href="#"> <i class="fab fa-linkedin"></i> linkedin </a>
            <a href="#"> <i class="fab fa-pinterest"></i> pinterest </a>
        </div>

        <div class="box">
            <h3>newsletter</h3>
            <p>subscribe for latest update</p>
            <form action="">
            <input type="email" placeholder="enter your email address">
            <input type="submit" value="subscribe" class="btn">
            </form>
            <img decoding="async" src="img/payment.png" class="payments" alt="">
        </div>
    </div>
        
</section>

<section class="credit">created by Cakezone || all rights reserved</section>

   
   
</html>



<%@page import="com.cakezone.cakezone.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.cakezone.cakezone.helper.FactoryProvider"%>
<%@page import="com.cakezone.cakezone.dao.CategoryDao"%>
<%@page import="com.cakezone.cakezone.entities.User"%>
<% 
    
    
  //  validations of admin or normal page
      User user =(User)session.getAttribute("current-user");
      if(user==null)
      {
            session.setAttribute("message", "You are not logged in! Login First");
            response.sendRedirect("login.jsp");
            return;
      }else
      {
           if(user.getUserType().equals("normal"))
           {
                session.setAttribute("message","You are not admin! You can't access this page");
                response.sendRedirect("login.jsp");
                return;
            }
      
       }


%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
         <%@include file="components/common_css_js.jsp" %>
   
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <div class="container admin"> 
            
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %> 
                
            </div>  
            
            
            
            <!-- First Row -->
        <div class="row mt-3">
            <!--first column comment -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 110px" class="img-fluid rounded-circle" src="img/profile.png" alt="profile_icon"/>
                        </div>
                        <h1>2356</h1>
                        <h1 class="text-uppercase text-muted"> Users </h1> 
                    </div>
                </div>
                
                
            </div>
            <!--Second column comment -->
            <div class="col-md-4">
            <div class="card">
                    <div class="card-body text-center">
                       <div class="container">
                            <img style="max-width: 110px" class="img-fluid rounded-circle" src="img/list.png" alt="list_icon"/>
                        </div>
                        <h1>2356</h1>
                        <h1 class="text-uppercase text-muted"> Category </h1> 
                    </div>
                </div>
            </div>
            <!-- third column  -->
            <div class="col-md-4">
            <div class="card">
                    <div class="card-body text-center">
                       <div class="container">
                            <img style="max-width: 110px" class="img-fluid rounded-circle" src="img/product.png" alt="product_icon"/>
                        </div>
                        <h1>2356</h1>
                        <h1 class="text-uppercase text-muted"> Products </h1> 
                    </div>
                </div>
            </div>
            
            </div>
            
              <!-- Second Row -->
              <div class="row mt-3">
                  <!-- Second Row First column -->
                  <div class="col-md-6">
                      <div class="card" data-toggle="modal" data-target="#add-category-modal">
                    <div class="card-body text-center">
                       <div class="container">
                            <img style="max-width: 110px" class="img-fluid rounded-circle" src="img/keys.png" alt="list_icon"/>
                        </div>
                        <p class="mt-2">Click here to add new Category</p>
                        <h1 class="text-uppercase text-muted"> Add Category</h1> 
                    </div>
                </div>
                      
                  </div>
                   <!-- Second Row Second column -->
                  <div class="col-md-6">
                      <div class="card" data-toggle="modal" data-target="#add-product-modal">
                    <div class="card-body text-center">
                       <div class="container">
                            <img style="max-width: 110px" class="img-fluid rounded-circle" src="img/plus.png" alt="list_icon"/>
                        </div>
                        <p class="mt-2">Click here to add new product</p>
                        <h1 class="text-uppercase text-muted">Add  Product </h1> 
                    </div>
                </div>
                  </div>
                  
              </div>
        </div>
        <!-- add category modal -->
        <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custome-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="ProductOperationServlet" method="post">
              <input type="hidden" name="operation" value="addcategory">
              
              <div class="form-group">
                  <input type="text" class="form-control" name="catTitle" placeholder="Enter Category title" required />    
              </div>
              
               <div class="form-group">
                   <textarea style="height: 350px" class="form-control"  placeholder="Enter Category Description" name="catDescription" required ></textarea>
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

<!-- End category modal -->

<!-- Add Product Modal -->
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custome-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <!-- Form -->
          <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
             
              <input type="hidden" name="operation" value="addproduct" />
              
              <!-- Product Title -->
              <div class="form-group">
                  <input type="text" class="form-control" placeholder="Enter Product Name" name="pName" required />
               </div>
              <!-- Product Description -->
              <div class="form-group">
                 <textarea style="height: 100px" class="form-control"  placeholder="Enter Product Description" name="pDesc" required ></textarea>   
              </div>
              <!-- Product Price -->
               <div class="form-group">
                  <input type="number" class="form-control" placeholder="Enter Product Price" name="pPrice" required />
               </div>
               <!-- Product Discount -->
              <div class="form-group">
                  <input type="number" class="form-control" placeholder="Enter Product Discount" name="pDiscount" required />
               </div>
               <!-- Product Quantity -->
              <div class="form-group">
                  <input type="number" class="form-control" placeholder="Enter Product Quantity" name="pQuantity" required />
               </div>
               
               <!-- Product Category -->
               <% 
            CategoryDao cdao =  new CategoryDao(FactoryProvider.getFactory());
           List<Category> list= cdao.getCategories();
               %>
               
               
               <div class="form-group">
                   <select name="catId" class="form-control " id="">
                       
                       <%
                         for(Category c:list){
                         %>
                           
                         <option value="<%= c.getCategoryId()%>"> <%= c.getCategoryTitle()%> </option>
                        
                       <% } %>
                   </select>
               </div>
               <!-- Product file -->
               
               <div class="form-group">
                   <label for="pPic">Select Picture of product</label>
                   <br>
                   <input type="file" name="pPic" required />
               </div>
               <!-- Submit Button -->
               <div class="container text-center">
                   
                   <button class="btn btn-outline-success"> Add Product</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
               </div>
               
               
          </form>
          
          <!-- End Form -->

     
    </div>
  </div>
    

<!-- End Product modal -->
<%@include file="components/common_modals.jsp" %>


    </body>
</html> 

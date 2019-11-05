<!-- My Tag Libs -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="rfd" uri="http://www.springframework.org/tags/form" %>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
 	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Denvato Stores</title>

 <!--Linking my Css Files-->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/homepage-style.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome.min.css" >
</head>

<body>
	<!-- Enabling User to Log out -->
	<c:url value="/j_spring_security_logout" var="logoutUrl" />
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
		
	<script>
		function formSubmit() 
		{
			document.getElementById("logoutForm").submit();
		}
	</script>

	<!-- navigation section -->
	<section class="navbar navbar-fixed-top custom-navbar" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon icon-bar"></span>
					<span class="icon icon-bar"></span>
					<span class="icon icon-bar"></span>
				</button>
				<a href="#" class="navbar-brand">Denvato</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.servletContext.contextPath}/homepage">HOME</a></li>
					<li><a href="#about">ABOUT</a></li>
					<li><a href="#pricing" >PRODUCT CATEGORIES</a></li>
					<li><a href="#contact">CONTACT</a></li>
					<li>
					<!-- To Display Admin Link for Admin only -->
						<c:if test="${pageContext.request.userPrincipal.name == 'Daniel'}">
							<a href="${pageContext.servletContext.contextPath}/admin" style="color:red; text-transform: uppercase; font-size: 17px; "  class="navbar-active">Admin Page</a>
						</c:if>
					</li>
					<li><a href="#" style="font-size: 17px; color: #00c6d7; text-transform: uppercase;"><!-- To Display Username in Navbar -->
						<c:if test="${pageContext.request.userPrincipal.name != null}">
							${pageContext.request.userPrincipal.name}
						</c:if>
					</a></li>
					<li><a href="#" data-toggle="modal" data-target="#myModal">CART <i class="fa fa-cart-plus" style="font-size: 17px;"></i>(<span id="simpleCart_quantity" class="simpleCart_quantity"></span> Items)</a></li>
					<li><a href="javascript:formSubmit()" class="simpleCart_empty">LOG OUT</a></li>		
				</ul>
			</div>
		</div>
	</section>
	
	<!-- Modal -->
  	<div class="modal fade" id="myModal" role="dialog">
    	<div class="modal-dialog">
    
      	<!-- Modal content-->
      	<div class="modal-content">
        	<div class="modal-header">
          	<button type="button" class="close" data-dismiss="modal">&times;</button>
          		<h4 class="modal-title">Cart Items</h4>
        </div>
        <div class="modal-body">
          

            <div class="simpleCart_shelfItem text-center">
              <div class="simpleCart_items">
                
              </div>
            </div>


  
          <p>Total : <span class="simpleCart_total"></span>(<span id="simpleCart_quantity" class="simpleCart_quantity"></span> Items)</p>
          <p><a href="javascript:;" class="simpleCart_empty">empty cart</a></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
	
	<section class="mainSection">
    	<div class="container">
        	<div class="col-md-3">
          		<ul class="nav nav-pills nav-stacked">
    				<li ><a href="${pageContext.servletContext.contextPath}/productOperations">Add Product</a></li>
    				<li class="active"><a href="${pageContext.servletContext.contextPath}/modifyProductDetails">Modify Product Details</a></li>
    				<li><a href="${pageContext.servletContext.contextPath}/deleteProduct">Delete Existing Product</a></li>
    				<li><a href="#">Comment on a Product</a></li>
  		 		</ul>
        	</div>
        	<div class="col-md-9">
        		<c:if test="${not empty error}">
									<div class="error">${error}</div>
				</c:if>
				<c:if test="${not empty msg}">
									<div class="msg">${msg}</div>
				</c:if>
        		<rfd:form role="form" action="${pageContext.request.contextPath}/modify" method="POST" modelAttribute="product">
        			<div class="form-group">
      					<label for="productid">Product Id:</label>
      						<rfd:input type="text" class="form-control" id="productid" placeholder="Enter Product ID" name="productid" path="productid" required="true" />
      						<rfd:errors path="productid" cssClass="error2" />
    				</div>
    				<div class="form-group">
      					<label for="productname">Product Name:</label>
      						<rfd:input type="text" class="form-control" id="productname" placeholder="Enter Product Name" name="productname" path="productname" required="true" />
      						<rfd:errors path="productname" cssClass="error2" />
    				</div>
    				<div class="form-group">
      					<label for="category">Category:</label>
      						<rfd:input type="text" class="form-control" id="category" placeholder="Enter Category" name="category" path="category" required="true" />
      						<rfd:errors path="category" cssClass="error2" />
    				</div>
    				<div class="form-group">
      					<label for="price">Price:</label>
      						<rfd:input type="text" class="form-control" id="price" placeholder="Enter Product Price" name="price" path="price" required="true" />
      						<rfd:errors path="price" cssClass="error2" />
    				</div>
    				<div class="form-group">
      					<label for="quantity">Quantity:</label>
      						<rfd:input type="text" class="form-control" id="quantity" placeholder="Enter Product Quantity" name="quantity" path="quantity" required="true"  />
      						<rfd:errors path="quantity" cssClass="error2" />
    				</div>
    				<div class="form-group">
      					<label for="picture">Picture:</label>
      						<rfd:input type="text" class="form-control" id="picture" placeholder="Enter Product Picture Name" name="picture" path="picture" required="true" />
      						<rfd:errors path="picture" cssClass="error2" />
    				</div>
    				<div class="form-group">
  						<label for="sel1">Trending Status:</label>
  								<select class="form-control" id="sel1" name="trending">
    									<option>0</option>
    									<option>1</option>
  								</select>
					</div>
    				<div class="form-group">
      					<label for="rating">Rating:</label>
      						<rfd:input type="text" class="form-control" id="rating" placeholder="Enter Product Rating Value" name="rating" path="rating" required="true" />
      						<rfd:errors path="rating" cssClass="error2" />
    				</div>
    				<div class="form-group">
      					<label for="productdate">Product Date of Entry:</label>
      						<rfd:input type="text" class="form-control" id="productdate" placeholder="Enter Product Name" name="productdate" path="productdate" required ="true"/>
      						<rfd:errors path="productdate" cssClass="error2" />
    				</div>
    				<button type="submit" value="submit" name="submit" class="btn btn-default">Submit</button>
  				</rfd:form>
        	</div>
    	</div>
	</section>
	
	<footer class="text-center">
        <div class="container">
            <div class="row">
            	 <div class="social_icon">
					<a href="#" class="fa fa-facebook"></a>
					<a href="#" class="fa fa-twitter"></a>
					<a href="#" class="fa fa-linkedin"></a>
					<a href="#" class="fa fa-tumblr"></a>
				</div>
				        
                <p>Copyright &copy; 2019 DazzlingStar</p>
                </div>
            </div>
       
        <!-- start back to top -->
		<a href="#top" class="go-top"><i class="fa fa-chevron-up fa-1x"></i></a>
		<!-- end back to top -->

      </footer>

	  <!-- Javascript -->
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
     <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
     <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
     <script src="${pageContext.request.contextPath}/static/js/homepage-script.js"></script>
     <script src="${pageContext.request.contextPath}/static/js/imagesloaded.min.js"></script>
  	 <script src="${pageContext.request.contextPath}/static/js/nivo-lightbox.min.js"></script>
	 <script src="${pageContext.request.contextPath}/static/js/jquery.backstretch.min.js"></script>
	 <script src="${pageContext.request.contextPath}/static/js/wow.min.js"></script>	
	  <script src="${pageContext.request.contextPath}/static/js/simpleCart.js"></script>
      <script><!--Script to make the Columns for the Cart-->
      simpleCart({
    	    checkout: {
    	      type: "PayPal",
    	      email: "you@yours.com"
    	    },
    	    cartStyle: "table", 
    	    cartColumns: [
    	   
    	    /* Name */
    	        { attr: "name", label: "Product Name"},
    	    /* Quantity */
    	        { view: "decrement" , label: false },
    	        { attr: "quantity" , label: "Quantity" } ,
    	        { view: "increment" , label: false },
    	    /* Price */
    	        { attr: "price" , label: "Price", view: 'currency' } ,
    	    /* Remove */
    	        { view: "remove" , text: "Remove" , label: false }
    	        ]
    	  });
  </script>
</body>
</html>
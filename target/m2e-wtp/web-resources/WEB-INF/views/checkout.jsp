<!-- My Tag Libs -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="rfd" uri="http://www.springframework.org/tags/form" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin-style.css" >
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
					<li class="dropdown">
						<a href="#pricing" class="dropdown-toggle" data-toggle="dropdown">PRODUCT CATEGORIES <span class="caret"></span></a>
						<ul class="dropdown-menu">
          					<li ><a href="${pageContext.servletContext.contextPath}/allShoes" class="dp" style="color: black;">Shoes</a></li>
          					<li ><a href="${pageContext.servletContext.contextPath}/allClothes" class="dp" style="color: black;">Clothes</a></li>
          					<li ><a href="${pageContext.servletContext.contextPath}/allCaps_Hats" class="dp" style="color: black;">Caps/Hats</a></li>
          					<li ><a href="${pageContext.servletContext.contextPath}/allWatches" class="dp" style="color: black;">Watches</a></li>
        				</ul>
					</li>
					<li><a href="#contact">CONTACT</a></li>
					<li>
					<!-- To Display Admin Link for Admin only -->
						<c:if test="${pageContext.request.userPrincipal.name == 'Daniel'}">
							<a href="${pageContext.servletContext.contextPath}/admin" style="color:red; text-transform: uppercase; font-size: 17px; ">Admin Page</a>
						</c:if>
					</li>
					<li><a href="#" style="font-size: 17px; color: #00c6d7; text-transform: uppercase;"><!-- To Display Username in Navbar -->
						<c:if test="${pageContext.request.userPrincipal.name != null}">
							${pageContext.request.userPrincipal.name}
						</c:if>
					</a></li>
					<li><a href="#" data-toggle="modal" data-target="#myModal" class="navbar-active">CART <i class="fa fa-cart-plus" style="font-size: 17px;"></i>(<span id="simpleCart_quantity" class="simpleCart_quantity"></span> Items)</a></li>
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
          <a type="button" class="btn btn-info">Check Out</a>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
	
	<!--CheckOut BreadCrumb-->
 <section class="breadcrumb">
    <div class="inner_breadcrumb">
      <div class="container">
        <ul class="breadcrumb_list">
          <li>
            <a href="index.html">Home</a>
            <i>|</i>
          </li>
          <li>Checkout</li>
        </ul>
      </div>
    </div>
    
  </section>
	
	<!-- ProductInfo Section -->
	<section class="checkout_section container">
		<h3 class="text-center">Checkout</h3>
		<h4 id="cart-info">Your Shopping Cart Contains : (<span id="simpleCart_quantity" class="simpleCart_quantity"></span> Item(s))</h4>
	</section>
	
	
	
	<!-- Check Out Items -->
	<section class="checkout_section container">
		<div class="simpleCart_shelfItem text-center">
              <div class="simpleCart_items">
                
              </div>
            </div>	
            <p>Total : <span class="simpleCart_total"></span></p>
          <p><a href="javascript:;" class="simpleCart_empty">empty cart</a></p>
	</section>
	
	<!--CheckOut Contact Details Section-->
	<section class="checkout_section2 container">
    <h4>Add Delivery Details</h4>
      <rfd:form role="form" action="${pageContext.request.contextPath}/insertDeliveryDetails" method="POST" class="login-form"  modelAttribute="delivery">
          <div class="form-group">
            <label class="sr-only" for="form-fullname">Fullname</label>
            <rfd:input type="text" name="fullname" placeholder="Fullname..." path="fullname" class="form-fullname form-control" id="form-fullname" require="" />
          </div>
          <div class="form-group">
            <label class="sr-only" for="form-mobilenumber">Mobile Number</label>
            <rfd:input type="text" name="mobilenumber" placeholder="Mobile Number..." path="mobilenumber" class="form-mobilenumber form-control" id="form-mobilenumber" required="" />
          </div>
          <div class="form-group">
            <label class="sr-only" for="form-email">Email Address</label>
            <rfd:input type="email" name="email" placeholder="Email..." path="email"  class="form-email form-control"  id="form-email" required="" />
          </div>
          <div class="form-group">
            <label class="sr-only" for="form-mobilenumber">Town/City</label>
            <rfd:input type="text" name="town_city" placeholder="Town/City..." path="town_city" class="form-town_city form-control" id="form-town_city" required="" />
          </div>
          <div class="form-group">
              <select class="form-control" id="address_type" name="delivery_destination_type">
                <option>Select Address Type</option>
                <option>Office</option>
                <option>Home</option>
                <option>Others</option>
              </select>
          </div>
        <button class="submit check_out btn btn-info" type="submit" value="submit" name="submit">Deliver to this Address</button> 
        <a class="submit check_out btn btn-dark" style="padding: 10px 10px 10px 10px" href="${pageContext.request.contextPath}/pay">Make a Payment <span class="fa fa-hand-o-right" aria-hidden="true"></span></a>  
      </rfd:form>  
  </section>
	
	<!--News Letter Section -->
  <section class="newsletter">
    <div class="container-fluid">
      <div class="col-xs-8 newsletter-leftmk">
        <h2>Get your Goods delivered from local stores around you</h2>
        <p>Free Delivery on your first order!</p>
        <form action="#" method="post">
          <input type="email" placeholder="E-mail" name="email" required>
          <input type="submit" value="Subscribe">
        </form>
        <div class="newsform">
          <span class="fa fa-envelope-o" aria-hidden="true"></span>
        </div>
      </div>
      <div class="col-xs-4">
        <img src="${pageContext.request.contextPath}/static/images/tab3.png" alt=" ">
      </div>
    </div>
  </section>
  
  <!--Extra Info section -->
  <section class="extra_checkout_info">
    <div class="col-xs-4 offers_info">
      <div class="col-xs-4 icon-fot">
            <span class="fa fa-map-marker offers-icon" aria-hidden="true"></span>
      </div>
      <div class="col-xs-8 extra-checkout-text">
            <h3>Track Your Order</h3>
      </div>
    </div>
    <div class="col-xs-4 offers_info">
        <div class="col-xs-4 icon-fot">
            <span class="fa fa-refresh offers-icon" aria-hidden="true"></span>
        </div>
        <div class="col-xs-8 extra-checkout-text">
            <h3>Free & Easy Returns</h3>
        </div>
    </div>
    <div class="col-xs-4 offers_info">
        <div class="col-xs-4 icon-fot">
            <span class="fa fa-times offers-icon" aria-hidden="true"></span>
        </div>
        <div class="col-xs-8 extra-checkout-text">
            <h3>Online cancellation </h3>
        </div>
    </div>
  </section>
  
  <!--Payment Methods-->
  <section class="payment_method_section child-momu">
    <h5>Payment Methods</h5>
          <ul>
            <li>
              <img src="${pageContext.request.contextPath}/static/images/pay2.png" alt="">
            </li>
            <li>
              <img src="${pageContext.request.contextPath}/static/images/pay1.png" alt="">
            </li>
            <li>
              <img src="${pageContext.request.contextPath}/static/images/pay3.png" alt="">
            </li>
            <li>
              <img src="${pageContext.request.contextPath}/static/images/pay7.png" alt="">
            </li>
            <li>
              <img src="${pageContext.request.contextPath}/static/images/pay8.png" alt="">
            </li>
            <li>
              <img src="${pageContext.request.contextPath}/static/images/pay9.png" alt="">
            </li>
          </ul>
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
    	        { attr: "price" , label: "Price" , view: 'currency'} ,
    	    /* Remove */
    	        { view: "remove" , text: "Remove" , label: false }
    	        ]
    	  });
  </script>
</body>
</html>
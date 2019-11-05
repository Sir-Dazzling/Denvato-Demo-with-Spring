
<%@page session="true"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="rfd" uri="http://www.springframework.org/tags/form" %>
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
    
    <body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
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
							<a href="${pageContext.servletContext.contextPath}/admin" class="navbar-active" style="color:red; text-transform: uppercase; font-size: 17px; ">Admin Page</a>
						</c:if>
					</li>
					<li><a href="#" style="font-size: 17px; color: #00c6d7; text-transform: uppercase;"><!-- To Display Username in Navbar -->
						<c:if test="${pageContext.request.userPrincipal.name != null}">
							${pageContext.request.userPrincipal.name}
						</c:if>
					</a></li>
					<li><a href="#"  data-toggle="modal" data-target="#myModal">CART <i class="fa fa-cart-plus" style="font-size: 17px;"></i>(<span id="simpleCart_quantity" class="simpleCart_quantity"></span> Items)</a></li>
					<li><a href="javascript:formSubmit()" class="simpleCart_empty">LOG OUT</a></li>	
				</ul>
			</div>
		</div>
	</section>
	
	<section class="mainSection">
    	<div class="container">
        	<div class="row">
          		<div class="col-md-12">
                	<div class="jumbotron text-center">
                    	<p>Hello Daniel, Welcome to the Admin Page</p>
                    	<a class="btn btn-info" href="${pageContext.request.contextPath}/productOperations ">Product Operations</a>
                    	<a class="btn btn-success" href="${pageContext.request.contextPath}/userOperations">User Accounts Operations</a>
                	</div>
            	</div>  
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
    	        { attr: "price" , label: "Price" } ,
    	    /* Remove */
    	        { view: "remove" , text: "Remove" , label: false }
    	        ]
    	  });
  </script>
	</body>

</html>
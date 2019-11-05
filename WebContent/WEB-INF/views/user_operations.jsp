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
    				<li class="active"><a href="${pageContext.servletContext.contextPath}/userOperations">Add User</a></li>
    				<li><a href="${pageContext.servletContext.contextPath}/deleteUserAccount">Delete Existing User Account</a></li>
  		 		</ul>
        	</div>
        	<div class="col-md-9">
        		<c:if test="${not empty error}">
									<div class="error">${error}</div>
				</c:if>
				<c:if test="${not empty msg}">
									<div class="msg">${msg}</div>
				</c:if>
        		<rfd:form role="form"  action="${pageContext.request.contextPath}/adminRegisterUser" method="POST" class="login-form" modelAttribute="user">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="firstname">First Name</label>
			                        	<rfd:input type="text" name="firstname" path="firstname" placeholder="First Name..." class="form-firstname form-control" id="form-firstname" />
			                        	<rfd:errors path="firstname" cssClass="error" />
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="lastname">Last Name</label>
			                        	<rfd:input type="text" name="lastname" path="lastname" placeholder="Last Name..." class="form-lastname form-control" id="form-lastname" />
			                        	<rfd:errors path="lastname" cssClass="error" />
			                        </div>
			                        
			                        <div class="form-group">
  										<label for="sel1">Gender:</label>
  										<select class="form-control" id="sel1" name="gender">
    										<option>Male</option>
    										<option>Female</option>
  										</select>
									</div>
			                        
			                        <div class="form-group">
			                        	<label class="sr-only" for="email">Email</label>
			                        	<rfd:input type="email"  name="email" path="email" placeholder="Email..." class="form-email form-control" id="email" />
			                        	<rfd:errors path="email" cssClass="error2" />
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="phonenumber">Phone Number</label>
			                        	<rfd:input type="text"  name="phonenumber" path="phonenumber" placeholder="Phone Number..." class="form-phonenumber form-control" id="phonenumber" onkeypress="return isNumberKey(event)" />
			                        	<rfd:errors path="phonenumber" cssClass="error" />
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="username">Username</label>
			                        	<rfd:input type="text"  name="username" path="username" placeholder="Username..." class="form-username form-control" id="username" />
			                        	<rfd:errors path="username" cssClass="error" />
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="password">Password</label>
			                        	<rfd:input type="password"  name="password" path="password" placeholder="Password..." class="form-password form-control" id="password" />
			                        	<rfd:errors path="password" cssClass="error" />
			                        	<span id="password_feedback" class="glyphicon glyphicon-form-control-feedback"></span>
										<span id="password_text" ></span>
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="cpassword">Confirm Password</label>
			                        	<input type="password"  name="cpassword"  placeholder="Confirm Password..." class="form-cpassword form-control" id="cpassword" />
			                        	<span id="password_text2"></span>
			                        </div>
			                        <button type="submit" value="submit" name="submit" class="btn" >Submit</button>
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
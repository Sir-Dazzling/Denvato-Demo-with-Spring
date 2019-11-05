<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<li><a href="${pageContext.servletContext.contextPath}/homepage" class="navbar-active">HOME</a></li>
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
	
	<!-- home section -->
	<section id="home">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12">
					<!--/banner-->
					<div class="banner-info">
            				<p id="trend">Trending of the week</p>
            				<h3 class="mb-4">Casual Shoes and Watches Available</h3>
            			<div class="ban-buttons">
                			<a href="shop-single.html" class="btn">Shop Now</a>
                			<a href="${pageContext.servletContext.contextPath}/allProducts" class="btn active">All Products</a>
            			</div>
        		  </div>
				</div>
		   </div>
	  </div>		
  </section>
  
  <!-- Features Section -->
	<section class="about">
		<div class="container-fluid">
			<div class="row feature-grids">
				<div class="col-lg-3 gd-bottom">
					 <div class="bottom-gd row">
                        <div class="icon-gd col-md-3 text-center"><span class="fa fa-truck" style="color: #00c6d7;" aria-hidden="true"></span></div>
                        <div class="icon-gd-info col-md-9">
                            <h3 class="mb-2">FREE SHIPPING</h3>
                            <p>On all order over $5,000</p>
                        </div>
                    </div>
				</div>
				<div class="col-lg-3 gd-bottom">
                    <div class="bottom-gd row bottom-gd2-active">
                        <div class="icon-gd col-md-3 text-center"><span class="fa fa-bullhorn " style="color: red" aria-hidden="true"></span></div>
                        <div class="icon-gd-info col-md-9">
                            <h3 class="mb-2">FREE RETURN</h3>
                            <p>On 1st exchange in 30 days</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 gd-bottom">
                    <div class="bottom-gd row">
                        <div class="icon-gd col-md-3 text-center"> <span class="fa fa-gift" style="color: #00c6d7;" aria-hidden="true"></span></div>

                        <div class="icon-gd-info col-md-9">
                            <h3 class="mb-2">MEMBER DISCOUNT</h3>
                            <p>Register & save up to $29%</p>
                        </div>

                    </div>
                </div>
                <div class="col-lg-3 gd-bottom">
                    <div class="bottom-gd row">
                        <div class="icon-gd col-md-3 text-center"> <span aria-hidden="true" style="color: #00c6d7;">$</span></div>
                        <div class="icon-gd-info col-md-9">
                            <h3 class="mb-2">PREMIUM SUPPORT</h3>
                            <p>Support 24 hours per day</p>
                        </div>
                    </div>
                </div>
			</div>
		</div>
	</section>
	
	<!-- Trending Products -->
	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
						<h3 class="text-center">Trending Products</h3>
					 <c:forEach var="product" items="${product}">
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="simpleCart_shelfItem card h-100">
              						<a href="#"><img class="card-img-top img-responsive" src="${pageContext.request.contextPath}/static/images/<c:out value="${product.picture}"></c:out>.jpg" alt=""></a>
              					<div class="card-body">
                					<h4 class="card-title item_name">
                  						<a href="#"><c:out value="${product.productname}"></c:out></a>
                					</h4>
                					<h5 class="item_price">$<c:out value="${product.price}"></c:out></h5>	
                					<button type="submit" class="item_add" data-toggle="modal" data-target="#myModal">Add to Cart</button>
            
             					</div>
              					<div class="card-footer">
              						<!-- Condition code to display which star rating for each product -->
								<c:choose>
									<c:when test="${product.rating == 1 }">
										<small class="text-muted">&#9733; &#9734; &#9734; &#9734; &#9734;</small>
									</c:when>
									<c:when test="${product.rating == 2 }">
										<small class="text-muted">&#9733; &#9733; &#9734; &#9734; &#9734;</small>
									</c:when>
									<c:when test="${product.rating == 3 }">
										<small class="text-muted">&#9733; &#9733; &#9733; &#9734; &#9734;</small>
									</c:when>
									<c:when test="${product.rating == 4 }">
										<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
									</c:when>
									<c:when test="${product.rating == 5 }">
										<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9733;</small>
									</c:when>
									<c:otherwise>
										<small class="text-muted">&#9734; &#9734; &#9734; &#9734; &#9734;</small>
									</c:otherwise>
								</c:choose>
                					
              					</div>
            			  </div>
						</div>
						
					</c:forEach>
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
    	        { attr: "price" , label: "Price", view: 'currency' } ,
    	    /* Remove */
    	        { view: "remove" , text: "Remove" , label: false }
    	        ]
    	  });
  </script>
</body>
</html>
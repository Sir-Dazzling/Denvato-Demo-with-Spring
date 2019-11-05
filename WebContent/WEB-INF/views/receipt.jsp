<!-- My Tag Libs -->
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
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/admin-style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/easy-responsive-tabs.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/creditly.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/popuo-box.css" rel="stylesheet">
    <!--Links to my Fonts -->
    <link href="${pageContext.request.contextPath}/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/font-awesome.css" rel="stylesheet">
  </head>
<body>

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
				<li><a href="#" class="navbar-active">CART <i class="fa fa-cart-plus" style="font-size: 17px;"></i></a></li>
				<li><a href="#">LOG OUT</a></li>
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

 <!--CheckOut BreadCrumb-->
 <section class="breadcrumb">
    <div class="inner_breadcrumb">
      <div class="container">
        <ul class="breadcrumb_list">
          <li>
            <a href="${pageContext.servletContext.contextPath}/homepage">Home</a>
            <i>|</i>
          </li>
          <li>Receipt</li>
        </ul>
      </div>
    </div>
  </section>

<!-- Main Section -->
  <section class="checkout_section container">
    <h3 class="text-center payment_header">Receipt</h3> 
  </section>
	
	<!-- Check Out Items -->
	<section class="checkout_section container">
		<div class="simpleCart_shelfItem text-center">
              <div class="simpleCart_items">
                
              </div>
            </div>	
            <p>Total : <span class="simpleCart_total"></span></p>
	</section>
	


  <!--News Letter Section -->
  <section class="newsletter">
    <div class="container-fluid">
      <div class="col-xs-8 newsletter-leftmk">
        <h2>Get your Goods delivered from local stores around you</h2>
        <p>Free Delivery on your first order!</p>
        <form action="#" method="post">
          <input type="email" placeholder="E-mail" name="email" required="">
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


	<!-- Footer -->
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
        </div>
       
        <!-- start back to top -->
		<a href="#top" class="go-top"><i class="fa fa-chevron-up fa-1x"></i></a>
		<!-- end back to top -->

      </footer>
	  <!-- Java script -->
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
     <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
     <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
     <script src="${pageContext.request.contextPath}/static/js/homepage-script.js"></script>
     <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/imagesloaded.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/nivo-lightbox.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/jquery.backstretch.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/wow.min.js"></script>
  <script src="${pageContext.request.contextPath}/static/js/easyResponsiveTabs.js"></script>
  <script>
    $(document).ready(function () {
      //Horizontal Tab
      $('#parentHorizontalTab').easyResponsiveTabs(
      {
        type: 'default', //Types: default, vertical, accordion
        width: 'auto', //auto or any width like 600px
        fit: true, // 100% fit in a container
        tabidentify: 'hor_1', // The tab groups identifier
        activate: function (event) { // Callback function if tab is switched
          var $tab = $(this);
          var $info = $('#nested-tabInfo');
          var $name = $('span', $info);
          $name.text($tab.text());
          $info.show();
        }
      });
    });
  </script>
  <script src="${pageContext.request.contextPath}/static/js/creditly.js"></script>
  <!--For the Credit Cart Payment Tab-->
  <script>
    $(function () 
    {
      var creditly = Creditly.initialize(
        '.creditly-wrapper .expiration-month-and-year',
        '.creditly-wrapper .credit-card-number',
        '.creditly-wrapper .security-code',
        '.creditly-wrapper .card-type');

      $(".creditly-card-form .submit").click(function (e) {
        e.preventDefault();
        var output = creditly.validate();
        if (output) {
          // Your validated credit card output
          console.log(output);
        }
      });
    });
  </script>
  <script src="${pageContext.request.contextPath}/static/js/simpleCart.js"></script>
  <script>
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
        { attr: "quantity" , label: "Qty" } ,
    /* Price */
        { attr: "price" , label: "Price", view: 'currency' } ,
  
        ]
  });
  </script>
</body>
</html>
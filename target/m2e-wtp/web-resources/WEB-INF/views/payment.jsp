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
          <li>Payment</li>
        </ul>
      </div>
    </div>
  </section>

<!-- Main Section -->
  <section class="checkout_section container">
    <h3 class="text-center payment_header">Payment</h3>
  </section>

<!-- //tittle heading -->
      <div class="checkout-right">
        <!--Horizontal Tab-->
        <div id="parentHorizontalTab">
          <ul class="resp-tabs-list hor_1">
            <li>Cash on delivery (COD)</li>
            <li>Credit/Debit</li>
            <li>Net Banking</li>
            <li>Paypal Account</li>
          </ul>
          <div class="resp-tabs-container hor_1">

            <div>
              <div class="vertical_post check_box_agile">
                <h5>COD</h5>
                <div class="checkbox">
                  <div class="check_box_one cashon_delivery">
                    <label class="anim">
                      <input type="checkbox" class="checkbox">
                      <span> We also accept Credit/Debit card on delivery. Please Check with the agent.</span>
                    </label>
                  </div>

                </div>
              </div>
            </div>
            <div>
              <form action="${pageContext.request.contextPath}/receipt" method="get" class="creditly-card-form agileinfo_form">
                <div class="creditly-wrapper wthree, w3_agileits_wrapper">
                  <div class="credit-card-wrapper">
                    <div class="first-row form-group">
                      <div class="controls">
                        <label class="control-label">Name on Card</label>
                        <input class="billing-address-name form-control" type="text" name="cardname" placeholder="Enter Name Here">
                      </div>
                      <div class="w3_agileits_card_number_grids">
                        <div class="w3_agileits_card_number_grid_left">
                          <div class="controls">
                            <label class="control-label">Card Number</label>
                            <input class="number credit-card-number form-control" type="text" name="cardnumber" inputmode="numeric" autocomplete="cc-number"
                                autocompletetype="cc-number" x-autocompletetype="cc-number" placeholder="&#149;&#149;&#149;&#149; &#149;&#149;&#149;&#149; &#149;&#149;&#149;&#149; &#149;&#149;&#149;&#149;">
                          </div>
                        </div>
                        <div class="w3_agileits_card_number_grid_right">
                          <div class="controls">
                            <label class="control-label">CVV</label>
                            <input class="security-code form-control" · inputmode="numeric" type="text" name="cvv" placeholder="&#149;&#149;&#149;">
                          </div>
                        </div>
                        <div class="clear"> </div>
                      </div>
                      <div class="controls">
                        <label class="control-label">Expiration Date</label>
                        <input class="expiration-month-and-year form-control" type="text" name="exp_date" placeholder="MM / YY">
                      </div>
                    </div>
                    <button class="submit" type="submit" value="submit" name="submit">
                      <span>Make a payment </span>
                    </button>
                  </div>
                </div>
              </form>

            </div>
            <div>
              <div class="vertical_post">
                <form action="#" method="post">
                  <h5>Select From Popular Banks</h5>
                  <div class="swit-radio">
                    <div class="check_box_one">
                      <div class="radio_one">
                        <label>
                          <input type="radio" name="radio" checked="">
                          <i></i>Syndicate Bank</label>
                      </div>
                    </div>
                    <div class="check_box_one">
                      <div class="radio_one">
                        <label>
                          <input type="radio" name="radio">
                          <i></i>Bank of Baroda</label>
                      </div>
                    </div>
                    <div class="check_box_one">
                      <div class="radio_one">
                        <label>
                          <input type="radio" name="radio">
                          <i></i>Canara Bank</label>
                      </div>
                    </div>
                    <div class="check_box_one">
                      <div class="radio_one">
                        <label>
                          <input type="radio" name="radio">
                          <i></i>ICICI Bank</label>
                      </div>
                    </div>
                    <div class="check_box_one">
                      <div class="radio_one">
                        <label>
                          <input type="radio" name="radio">
                          <i></i>State Bank Of India</label>
                      </div>
                    </div>
                  </div>
                  <h5>Or Select Other Bank</h5>
                  <div class="section_room_pay">
                    <select class="year">
                      <option value="">=== Other Banks ===</option>
                      <option value="ALB-NA">Allahabad Bank NetBanking</option>
                      <option value="ADB-NA">Andhra Bank</option>
                      <option value="BBK-NA">Bank of Bahrain and Kuwait NetBanking</option>
                      <option value="BBC-NA">Bank of Baroda Corporate NetBanking</option>
                      <option value="BBR-NA">Bank of Baroda Retail NetBanking</option>
                      <option value="BOI-NA">Bank of India NetBanking</option>
                      <option value="BOM-NA">Bank of Maharashtra NetBanking</option>
                      <option value="CSB-NA">Catholic Syrian Bank NetBanking</option>
                      <option value="CBI-NA">Central Bank of India</option>
                      <option value="CUB-NA">City Union Bank NetBanking</option>
                      <option value="CRP-NA">Corporation Bank</option>
                      <option value="DBK-NA">Deutsche Bank NetBanking</option>
                      <option value="DCB-NA">Development Credit Bank</option>
                      <option value="DC2-NA">Development Credit Bank - Corporate</option>
                      <option value="DLB-NA">Dhanlaxmi Bank NetBanking</option>
                      <option value="FBK-NA">Federal Bank NetBanking</option>
                      <option value="IDS-NA">Indusind Bank NetBanking</option>
                      <option value="IOB-NA">Indian Overseas Bank</option>
                      <option value="ING-NA">ING Vysya Bank (now Kotak)</option>
                      <option value="JKB-NA">Jammu and Kashmir NetBanking</option>
                      <option value="JSB-NA">Janata Sahakari Bank Limited</option>
                      <option value="KBL-NA">Karnataka Bank NetBanking</option>
                      <option value="KVB-NA">Karur Vysya Bank NetBanking</option>
                      <option value="LVR-NA">Lakshmi Vilas Bank NetBanking</option>
                      <option value="OBC-NA">Oriental Bank of Commerce NetBanking</option>
                      <option value="CPN-NA">PNB Corporate NetBanking</option>
                      <option value="PNB-NA">PNB NetBanking</option>
                      <option value="RSD-DIRECT">Rajasthan State Co-operative Bank-Debit Card</option>
                      <option value="RBS-NA">RBS (The Royal Bank of Scotland)</option>
                      <option value="SWB-NA">Saraswat Bank NetBanking</option>
                      <option value="SBJ-NA">SB Bikaner and Jaipur NetBanking</option>
                      <option value="SBH-NA">SB Hyderabad NetBanking</option>
                      <option value="SBM-NA">SB Mysore NetBanking</option>
                      <option value="SBT-NA">SB Travancore NetBanking</option>
                      <option value="SVC-NA">Shamrao Vitthal Co-operative Bank</option>
                      <option value="SIB-NA">South Indian Bank NetBanking</option>
                      <option value="SBP-NA">State Bank of Patiala NetBanking</option>
                      <option value="SYD-NA">Syndicate Bank NetBanking</option>
                      <option value="TNC-NA">Tamil Nadu State Co-operative Bank NetBanking</option>
                      <option value="UCO-NA">UCO Bank NetBanking</option>
                      <option value="UBI-NA">Union Bank NetBanking</option>
                      <option value="UNI-NA">United Bank of India NetBanking</option>
                      <option value="VJB-NA">Vijaya Bank NetBanking</option>
                    </select>
                  </div>
                  <input type="submit" value="PAY NOW">
                </form>
              </div>
            </div>
            <div>
              <div id="tab4" class="tab-grid" style="display: block;">
                <div class="row">
                  <div class="col-md-6">
                    <img class="pp-img" src="${pageContext.request.contextPath}/static/images/paypal.png" alt="Image Alternative text" title="Image Title">
                    <p>Important: You will be redirected to PayPal's website to securely complete your payment.</p>
                    <a class="btn btn-primary">Checkout via Paypal</a>
                  </div>
                  <div class="col-md-6 number-paymk">
                    <form class="cc-form">
                      <div class="clearfix">
                        <div class="form-group form-group-cc-number">
                          <label>Card Number</label>
                          <input class="form-control" placeholder="xxxx xxxx xxxx xxxx" type="text">
                          <span class="cc-card-icon"></span>
                        </div>
                        <div class="form-group form-group-cc-cvc">
                          <label>CVV</label>
                          <input class="form-control" placeholder="xxxx" type="text">
                        </div>
                      </div>
                      <div class="clearfix">
                        <div class="form-group form-group-cc-name">
                          <label>Card Holder Name</label>
                          <input class="form-control" type="text">
                        </div>
                        <div class="form-group form-group-cc-date">
                          <label>Valid Thru</label>
                          <input class="form-control" placeholder="mm/yy" type="text">
                        </div>
                      </div>
                      <div class="checkbox checkbox-small">
                        <label>
                          <input class="i-check" type="checkbox" checked="">Add to My Cards</label>
                      </div>
                      <input type="submit" class="submit" value="Proceed Payment">
                    </form>
                  </div>
                </div>

              </div>
            </div>

          </div>
        </div>
        <!--Plug-in Initialisation-->
      </div>


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
	  <!-- Javascript -->
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
  <script src="js/creditly.js"></script>
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
  <script src="js/simpleCart.js"></script>
  <script>
    simpleCart({
    checkout: {
      type: "PayPal",
      email: "you@yours.com"
    },
    cartStyle: "table", 
    cartColumns: [
    /* Picture (same for every product right now) */
        { view: function( item, column) {
            return "<a class=\"thumbnail pull-left\" href=\"#\"> "
            +"<img class=\"media-object\" src=\"http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png\" "
            +"style=\"width: 72px; height: 72px;\"> </a>";
            }, label: false },
    /* Name */
        { attr: "name", label: "Product"},
    /* Quantity */
        { attr: "quantity" , label: "Qty" } ,
    /* Price */
        { attr: "price" , label: "Price", view: 'currency' } ,
    /* Remove */
        { view: "remove" , text: "Remove" , label: false }
        ]
  });
  </script>
</body>
</html>
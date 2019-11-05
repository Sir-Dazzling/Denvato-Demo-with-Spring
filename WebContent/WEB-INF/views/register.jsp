<!-- My Tag Libs -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="rfd" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
    <title>Denvato Stores</title>

    <!--Linking my Css Files-->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/form-elements.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/register-style.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome.min.css" >
   
  </head>
<body onload='document.loginForm.username.focus();'>

	<div class="top-content">
		<div class="inner-bg">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text">
						<div class="description">
							<c:if test="${not empty error}">
								<div class="error">${error}</div>
							</c:if>
							<c:if test="${not empty msg}">
								<div class="msg">${msg}</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box myBox">
						<div class="form-top">
							<div class="form-top-left">
								<h3>Register Here</h3>
                            	<p>Please fill out all details carefully</p>
							</div>
							<div class="form-top-right">
								<i class="fa fa-lock"></i>
							</div>
						</div>
						<div class="form-bottom"><!-- Register Form -->
							<rfd:form role="form"  action="${pageContext.request.contextPath}/registerUser" method="POST" class="login-form" modelAttribute="user">
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
			                        <button type="submit" value="submit" name="submit" class="btn" disabled>Submit</button>
			                          <a id="registerLink" href="${pageContext.servletContext.contextPath}/login">Back to Login</a>  
			                </rfd:form>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 social-login myBox">
						<h3>...or register with:</h3>
						<div class="social-login-buttons">
							<a class="btn btn-link-1 btn-link-1-facebook" href="#">
	                        		<i class="fa fa-facebook"></i> Facebook
	                        </a>
	                        <a class="btn btn-link-1 btn-link-1-twitter" href="#">
	                        		<i class="fa fa-twitter"></i> Twitter
	                        </a>
	                        <a class="btn btn-link-1 btn-link-1-google-plus" href="#">
	                        		<i class="fa fa-google-plus"></i> Google Plus
	                        </a>
						</div>
					</div>
				</div>
			</div>
		</div>


	  <!-- Javascript -->
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
     <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
     <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
     <script src="${pageContext.request.contextPath}/static/js/jquery.backstretch.min.js"></script>
     <script src="${pageContext.request.contextPath}/static/js/script.js"></script>
     <script src="${pageContext.request.contextPath}/static/js/script2.js"></script>
     <script src="${pageContext.request.contextPath}/static/js/scripts.js"></script>
</body>
</html>
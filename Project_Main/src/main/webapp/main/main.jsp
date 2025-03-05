<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>
	<div class="wrapper row0">
	  <div id="topbar" class="hoc clear"> 
	    <div class="fl_left">
	      <ul class="nospace">
	        <li><i class="fas fa-mobile-alt rgtspace-5"></i> +00 (123) 456 7890</li>
	        <li><i class="far fa-envelope rgtspace-5"></i> info@domain.com</li>
	      </ul>
	    </div>
	    <div class="fl_right">
	      <ul class="nospace">
	        <li><a href="#"><i class="fas fa-home"></i></a></li>
	        <li><a href="#" title="Help Centre"><i class="far fa-life-ring"></i></a></li>
	        <li><a href="#" title="Login"><i class="fas fa-sign-in-alt"></i></a></li>
	        <li><a href="#" title="Sign Up"><i class="fas fa-edit"></i></a></li>
	        <li id="searchform">
	          <div>
	            <form action="#" method="post">
	              <fieldset>
	                <legend>Quick Search:</legend>
	                <input type="text" placeholder="Enter search term&hellip;">
	                <button type="submit"><i class="fas fa-search"></i></button>
	              </fieldset>
	            </form>
	          </div>
	        </li>
	      </ul>
	    </div>
	  </div>
	</div>
		
	<jsp:include page="../main/header.jsp"></jsp:include>

	<jsp:include page="../main/home.jsp"></jsp:include>
	
	<jsp:include page="${main_jsp }"></jsp:include>
	
	<jsp:include page="../main/footer.jsp"></jsp:include>
	
	<!-- JAVASCRIPTS -->
	<script src="../layout/scripts/jquery.min.js"></script>
	<script src="../layout/scripts/jquery.backtotop.js"></script>
	<script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>
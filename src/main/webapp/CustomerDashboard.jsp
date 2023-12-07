<%@page import="com.app.factory.AdminDaoFactory"%>
<%@page import="com.app.dao.IAdminDao"%>
<%@page import="com.app.bean.Customer" %>
<%@page import="com.app.factory.MaidDaoFactory"%>
<%@page import="com.app.dao.IMaidDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, 
                   initial-scale=1.0">
<title>Customer Dashboard</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="responsive.css">
<%@include file="./Component/dashboardallcss.jsp"%>
<%@include file="./Component/allcss.jsp"%>
<style type="text/css">
<%@include file="./Component/style.css"%>
<%@include file="./Component/dashboard.css"%>
</style>
<body>
	
	<%
	String cid = (String) session.getAttribute("Customers");
	IAdminDao dao = AdminDaoFactory.getDao();
	Customer c = dao.getCustomerById(cid);
	IMaidDao dao1 = MaidDaoFactory.getDao1();
	Integer countCustomers = dao.countCustomers();
	Integer countAllMaids = dao1.countAllMaids();
	Integer countActiveMaids = dao1.countActiveMaids();
	Integer countInActiveMaids = dao1.countInActiveMaids();
	%>
	<!-- for header part -->
	<%
		if(cid!=null&&c.getRoleType().equals("CUSTOMER")){
	%>
	<header>

		<div class="logosec">
			<div class="logo">Customer DashBoard</div>
			
		</div>

		<div class="searchbar">
			<input type="text" placeholder="Search">
			<div class="searchbtn">
				<img
					src="https://media.geeksforgeeks.org/wp-content/uploads/20221210180758/Untitled-design-(28).png"
					class="icn srchicn" alt="search-icon">
			</div>
		</div>

		<div class="message">
			<div class="circle"></div>
			<img
				src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183322/8.png"
				class="icn" alt="">
			<div class="dp">
					<a style="text-decoration: none" href="MainServlet?var=getProfile" class="text-dark"><img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210180014/profile-removebg-preview.png" class="dpicn" alt="dp"></a>
			</div>
		</div>

	</header>

	<div class="main-container">
		<div class="navcontainer">
		<nav class="nav">
			<div class="nav-upper-options">
				<div class="nav-option option1 ">
					<img
						src="https://media.geeksforgeeks.org/wp-content/uploads/20221210182148/Untitled-design-(29).png"
						class="nav-img" alt="dashboard">
					<h5><a style="text-decoration: none" class="text-white" href="CustomerDashboard.jsp">Dashboard</a></h5>
				</div>

				<div class="option2 nav-option">
					<img
							src="IMAGE/userLogo.png"
						class="nav-img" alt="blog">
					<h5><a style="text-decoration: none" href="MainServlet?var=getProfile" class="text-dark">Profile</a></h5>
				</div>

				<div class="nav-option option3">
					<img
							src="IMAGE/booking.png"
						class="nav-img" alt="report">
					<h5><a style="text-decoration: none" href="MainServlet?var=bookingDetail" class="text-dark">Booking Detail</a></h5>
				</div>

				<div class="nav-option option4">
					<img
							src="IMAGE/veridfiedMaid.png"
						class="nav-img" alt="institution">
					<h5><a style="text-decoration: none" href="#" class="text-dark">Maids</a></h5>
				</div>

				<div class="nav-option option5">
					<img
						src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183323/10.png"
						class="nav-img" alt="blog">
					<h5>new</h5>
				</div>

				<div class="nav-option option6">
					<img
						src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183320/4.png"
						class="nav-img" alt="settings">
					<h5>Settings</h5>
				</div>

				<div class="nav-option logout">
					<img
						src="IMAGE/log.jpg"
						class="nav-img" alt="logout">
					<h5><a style="text-decoration: none" class="text-dark" onclick="logOut()" >Logout</a></h5>
				</div>

			</div>
		</nav>
	</div>

		<div class="main">

			<div class="searchbar2">
				<input type="text" name="" id="" placeholder="Search">
				<div class="searchbtn">
					<img
						src="https://media.geeksforgeeks.org/wp-content/uploads/20221210180758/Untitled-design-(28).png"
						class="icn srchicn" alt="search-button">
				</div>
			</div>
			
			<div class="box-container">

				<div class="box box1">
					<div class="text">
						<h2 class="topic-heading"><%=countCustomers %></h2>
						<h2 class="topic">Customers</h2>
					</div>

					<img
						src="IMAGE/customers.png"
						alt="Views">
				</div>

				<div class="box box2">
					<div class="text">
						<h2 class="topic-heading"><%=countAllMaids %></h2>
						<h2 class="topic">Total Maids</h2>
					</div>

					<img
						src="IMAGE/allmaids.png"
						alt="likes">
				</div>

				<div class="box box3">
					<div class="text">
						<h2 class="topic-heading"><%=countActiveMaids %></h2>
						<h2 class="topic">Active Maids</h2>
					</div>

					<img
						src="IMAGE/activemaids.png"
						alt="comments">
				</div>

				<div class="box box4">
					<div class="text">
						<h2 class="topic-heading"><%=countInActiveMaids %></h2>
						<h2 class="topic">InActive Maids</h2>
					</div>

					<img
						src="IMAGE/inactivemaids.png" width="70px" style="height: 70px"
						alt="published">
				</div>
			</div>
			<hr>
		<div class="report-body">
					<div class="report-topic-heading">
		<div style="width: 38%; margin-left: 17%"
			class="container bg-white mt-5" >
			<div class="row">
				<div class="col-5 mx-auto">
					<img alt="" height="40px" class="mt-2"
						src="IMAGE/logo-bookmybai1.png">

				</div>
				<h6 style="font-size: 12.5px; margin-top: -5px;" class="text-center">The
					new way to hire a trusted maid</h6>
			</div>
			<div>
				<div class="choosediv">
					<div class="maidbox bg-success">
						<a type="submit" class="btn btn-success" href="MainServlet?var=cooking">Cooking</a>
					</div>
					<div class="maidbox bg-success">
						<a type="submit" class="btn btn-success" href="MainServlet?var=cleaning">Cleaning</a>
					</div>
					<div class="maidbox bg-success">
						<a type="submit" class="btn btn-success" href="MainServlet?var=daycare">Day Care</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>

	<script src="./index.js"></script>
	<%}
		else{
			response.sendRedirect("customerlogin.jsp");
		}
	%>
</body>
<script type="text/javascript">
	function logOut() {
		swal({
			  title: "Are you sure?",
			  text: "Once logout, you will able to login again!",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  document.location.href="MainServlet?var=logoutCustomer";
			    
			  } else {
			    swal("You are not loged out!");
			  }
			});
	}

</script>
</html>
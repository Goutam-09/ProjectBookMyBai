<%@page import="com.app.factory.MaidDaoFactory"%>
<%@page import="com.app.dao.IMaidDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.app.factory.AdminDaoFactory"%>
<%@page import="com.app.dao.IAdminDao"%>
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
<title>Admin Dashboard</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%@include file="./Component/dashboardallcss.jsp"%>
<%@include file="./Component/allcss.jsp"%>
<style type="text/css">
<%@include file="./Component/style.css"%>
<%@include file="./Component/dashboard.css"%>
</style>
<body>
	<!-- for header part -->
	<%
		String cid = (String) session.getAttribute("Customers");
		IAdminDao dao = AdminDaoFactory.getDao();
		IMaidDao dao1 = MaidDaoFactory.getDao1();
		Customer c1 = dao.getCustomerById(cid);
		Integer countCustomers = dao.countCustomers();
		Integer countAllMaids = dao1.countAllMaids();
		Integer countActiveMaids = dao1.countActiveMaids();
		Integer countInActiveMaids = dao1.countInActiveMaids();
	%>
	<%if(cid!=null && c1.getRoleType().equals("ADMIN")){ %>
	<header>

		<div class="logosec">
			<div class="logo">Admin DashBoard</div>

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
				<a style="text-decoration: none" href="MainServlet?var=getProfile" class="text-dark"><img src="IMAGE/goutam.jpg" class="dpicn" alt="dp"></a>
			</div>
		</div>

	</header>

	<div class="main-container">
		<div class="navcontainer">
			<nav class="nav">
				<div class="nav-upper-options">
					<div class="nav-option option1">
						<img
							src="https://media.geeksforgeeks.org/wp-content/uploads/20221210182148/Untitled-design-(29).png"
							class="nav-img" alt="dashboard">
						<h5><a style="text-decoration: none" class="text-white" href="AdminDashboard.jsp">Dashboard</a></h5>
					</div>

					<div class="option2 nav-option">
						<img
							src="IMAGE/userLogo.png"
							class="nav-img" alt="blog">
						<h5><a style="text-decoration: none" href="MainServlet?var=getProfile" class="text-dark">Profile</a></h5>
					</div>

					<div class="nav-option option3">
						<img
							src="IMAGE/customer.png"
							class="nav-img" alt="report">
						<h5><a style="text-decoration: none" href="MainServlet?var=getCustomers" class="text-dark">Customers</a></h5>
					</div>

					<div class="nav-option option4">
						<img
							src="IMAGE/veridfiedMaid.png"
							class="nav-img" alt="institution">
						<h5><a style="text-decoration: none" href="MaidServlet?var=getVerifiedMaids" class="text-dark">Verified Maids</a></h5>
					</div>

					<div class="nav-option option5">
						<img
							src="IMAGE/unverifiedMaid.png"
							class="nav-img" alt="blog">
						<h5><a style="text-decoration: none" href="MaidServlet?var=getUnVerifiedMaids" class="text-dark">Unverified Maids</a></h5>
					</div>
					
					<div class="nav-option option6">
						<img style="height: 40px"
							src="IMAGE/inquiry.png" width="40px"
							class="nav-img" alt="settings">
						<h5><a style="text-decoration: none" type="button" class="text-dark" href="MainServlet?var=inquiryList">Inquiry List</a></h5>
					</div>
					
					<div class="nav-option option7">
						<img style="height: 30px"
							src="IMAGE/booking.png" width="30px"
							class="nav-img" alt="settings">
						<h5><a style="text-decoration: none" type="button" class="text-dark" href="MainServlet?var=bookingListFull">Bookings</a></h5>
					</div>

					<div class="nav-option logout">
						<img src="IMAGE/log.jpg" class="nav-img" alt="logout" width="35px">
						<h5><a style="text-decoration: none" type="button" class="text-dark" onclick="logOut()" >Logout</a></h5>
					</div>

				</div>
			</nav>
		</div>
		<div class="main">
			<div class="searchbar2">
				<input type="text" name="" id="" placeholder="Search">
				<div class="searchbtn">
					<img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210180758/Untitled-design-(28).png"
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

			<div class="report-container">
				<div class="report-header">
					<h1 class="recent-Articles">Recent Customers</h1>
				</div>

				<div class="report-body">
					<div class="report-topic-heading">
						<table class="table">
							<thead>
								<tr>
									<th scope="col" class="text-success">Id</th>
									<th scope="col" class="text-success">Customers</th>
									<th scope="col" class="text-success">Email</th>
									<th scope="col" class="text-success">Mobile No.</th>
								</tr>
							</thead>
							<tbody>
							<%@page import="com.app.bean.Customer" %>
							<%
								ArrayList<Customer> list = (ArrayList<Customer>)dao.getCustomerList();
							%>
							<%
								if(list!=null){
									for(Customer c:list){%>
										<tr>
										<th><%=c.getcId() %></th>
										<th><%=c.getcName() %></th>
										<th><%=c.getcEmail() %></th>
										<td><%=c.getcMob() %></td>
									</tr>
								<%}
							} %>										
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
		<script src="./index.js"></script>
		<%} 
	else{
			request.setAttribute("sMsg", "Login First");
			response.sendRedirect("customerlogin.jsp");
	}%>
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
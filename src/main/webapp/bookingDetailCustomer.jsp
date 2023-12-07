<%@page import="java.util.ArrayList"%>
<%@page import="com.app.bean.Booking"%>
<%@page import="com.app.bean.Customer"%>
<%@page import="com.app.factory.AdminDaoFactory"%>
<%@page import="com.app.dao.IAdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%@include file="Component/dashboardallcss.jsp"%>
<%@include file="Component/allcss.jsp"%>
<style type="text/css">
<%@ include file="./Component/style.css"%>
<%@include file="./Component/dashboard.css"%>
</style>
</head>
<body>
	<%
	String cid = (String) session.getAttribute("Customers");
	IAdminDao dao = AdminDaoFactory.getDao();
	Customer c = dao.getCustomerById(cid);
	Booking b =(Booking) dao.getCustomerBookingById(cid);
	%>
	<%
	if (cid != null) {
	%>
	<%@include file="./Component/customerNavbar.jsp"%>
	<div class="main-container">
		<%@include file="./Component/customerSidebar.jsp"%>
		<div class="main">
			<div class="report-container"
				style="margin-left: -20px; max-width: 1300px">
				<section>
					<div class="container" style="margin-top: -80px">
						<div class="row">
							<div class="col-lg-12">
								<table class="table">
									<thead>
									
										<tr>
											<th scope="col">Booking Id</th>
											<th scope="col">Customer Id</th>
											<th scope="col">Maid Id</th>
											<th scope="col">Maid Name</th>
											<th scope="col">Maid Service</th>
											<th scope="col">Customer Name</th>
											<th scope="col">Customer Address</th>
											<th scope="col">Payment</th>
											<th scope="col">Booking Status</th>
										</tr>
										
									</thead>
									<tbody>
									<%if(b!=null){ %>
										<tr>
											<th scope="row"><%=b.getbId()%></th>
											<th scope="row"><%=b.getcId()%></th>
											<th scope="row"><%=b.getmId()%></th>
											<th><%=b.getMaidName()%></th>
											<td><%=b.getMaidService()%></td>
											<td><%=b.getCustomerName()%></td>
											<td><%=b.getCustomerAddress()%></td>
											<td><%=b.getTotalPayment()%> Rs</td>
											<td><%=b.getBookigStatus()%></td>											
										</tr>
										<%}
									else{%>
										<h1 style="color: red">No Detail Found</h1>
									<%}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</section>

			</div>
		</div>
	</div>
	<%
	} else {
	response.sendRedirect("customerlogin.jsp");
	}
	%>
</body>
</html>
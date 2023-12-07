<%@page import="com.app.factory.AdminDaoFactory"%>
<%@page import="com.app.dao.IAdminDao"%>
<%@page import="com.app.factory.MaidDaoFactory"%>
<%@page import="com.app.dao.IMaidDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.app.bean.Maid"%>
<%@page import="com.app.bean.Booking"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking List</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%@include file="./Component/dashboardallcss.jsp"%>
<%@include file="./Component/allcss.jsp"%>
<style type="text/css">
<%@include file="./Component/style.css"%>
<%@include file="./Component/dashboard.css"%>
</style>
</head>
<body>

	<%
	String cid = (String) session.getAttribute("Customers");
	IAdminDao dao = AdminDaoFactory.getDao();
	ArrayList<Booking> list = (ArrayList<Booking>) dao.getBookingList();
	%>
	<%
	if (cid != null) {
	%>
	<%@include file="./Component/AdminNav.jsp"%>
	<div class="main-container">
		<%@include file="./Component/AdminSidebar.jsp"%>
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
											<th scope="col">Action</th>
										</tr>
									</thead>
									<tbody>
										<%
										for (Booking br : list) {
										%>
										<tr>
											<th scope="row"><%=br.getbId()%></th>
											<th scope="row"><%=br.getcId()%></th>
											<th scope="row"><%=br.getmId()%></th>
											<th><%=br.getMaidName()%></th>
											<td><%=br.getMaidService()%></td>
											<td><%=br.getCustomerName()%></td>
											<td><%=br.getCustomerAddress()%></td>
											<td><%=br.getTotalPayment()%> Rs</td>
											<td><%=br.getBookigStatus()%></td>
											<td><a href="MainServlet?var=editBooking&id=<%=br.getbId()%>"><img src="IMAGE/edit.png" width="50px"></a></td>
										</tr>
										<%
										}
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

<%@page import="com.app.factory.AdminDaoFactory"%>
<%@page import="com.app.dao.IAdminDao"%>
<%@page import="com.app.factory.MaidDaoFactory"%>
<%@page import="com.app.dao.IMaidDao"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Maid</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%@include file="Component/dashboardallcss.jsp"%>
<%@include file="Component/allcss.jsp"%>
<style type="text/css">
<%@ include file="./Component/style.css"%>
<%@include file="./Component/dashboard.css"%>

div.elem-group {
  margin: 20px 0;
}

div.elem-group.inlined {
  width: 49%;
  display: inline-block;
  float: left;
  margin-left: 1%;
}

label {
  display: block;
  padding-bottom: 10px;
  font-size: 1.25em;
}

input, select, textarea {
  border-radius: 2px;
  border: 2px solid #777;
  box-sizing: border-box;
  font-size: 1.25em;
  width: 100%;
  padding: 10px;
}

div.elem-group.inlined input {
  width: 95%;
  display: inline-block;
}

textarea {
  height: 250px;
}

hr {
  border: 1px dotted #ccc;
}

button {
  height: 50px;
  background: orange;
  border: none;
  color: white;
  font-size: 1.25em;
  font-family: 'Nanum Gothic';
  border-radius: 4px;
  cursor: pointer;
}

button:hover {
  border: 2px solid black;
}
</style>
</head>
<body>
	<%@page import="com.app.bean.Maid"%>
	<%@page import="com.app.bean.Customer"%>
	<%@page import="com.app.bean.Cooking"%>
	<%@page import="com.app.bean.ServiceRequirement"%>
	<%
		String cid = (String) session.getAttribute("Customers");
		String mid = (String) request.getParameter("id");
		IAdminDao dao1 = AdminDaoFactory.getDao();
		Customer c = dao1.getCustomerById(cid);
		IMaidDao dao = MaidDaoFactory.getDao1();
		Maid m = dao.getMaidById(mid);
		Integer total = (Integer) request.getAttribute("total");
	%>
	<%
	if (cid != null) {
	%>
	<%@include file="./Component/customerNavbar.jsp"%>
	<div class="main-container">
			<%@include  file="./Component/customerSidebar.jsp"%>
	<div class="main">
	<section class="vh-100 gradient-custom">
		<div class="container py-5 h-100">
			<div class="row justify-content-center align-items-center h-100">
				<div class="col-12 col-lg-9 col-xl-7">
					<div class="card shadow-2-strong card-registration"
						style="border-radius: 15px;">
						<div class="card-body p-4 p-md-5">
							<h1 class="mb-4 pb-2 pb-md-0 mb-md-5 text-center text-success">Maid Booking</h1>
							<form action="MainServlet?var=booking&money=<%=total %>&maidId=<%=m.getmId() %>" method="post">

								<div class="row">
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input type="text" name="mname" value="<%=m.getmName() %>"
												class="form-control form-control-lg" required/> 
												<label class="form-label">Maid Name</label>
										</div>

									</div>
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input type="text" name="mservice" value="<%=m.getmOccupation() %>"
												class="form-control form-control-lg" required/> 
												<label class="form-label">Maid Service</label>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input type="text" name="cname" value="<%=c.getcName() %>" class="form-control form-control-lg" required/> 
												<label class="form-label">Customer Name</label>
										</div>

									</div>
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<input type="text" name="cAddress" class="form-control form-control-lg" required/> 
												<label class="form-label">Customer Address</label>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 mb-4 pb-2">
										<div class="form-outline">
											<input disabled type="text" name="pay" value="<%=total %> Rs"
												class="form-control form-control-lg" required/> 
												<label class="form-label">Total Payment</label>
										</div>
									</div>
								</div>
								<div class="mt-4 pt-2">
									<button style="margin-left: 40%" type="submit"
										class="btn btn-primary btn-lg btn-block">Booking</button>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	</div>
	</div>
	<%
	} else {
	response.sendRedirect("customerlogin.jsp");
	}
	%>
</body>

</html>

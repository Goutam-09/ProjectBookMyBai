<%@page import="com.app.factory.AdminDaoFactory"%>
<%@page import="com.app.dao.IAdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<%@page import="com.app.bean.Customer"%>
	<%
		String cid = (String) session.getAttribute("Customers");
		String id = request.getParameter("id");
		IAdminDao dao = AdminDaoFactory.getDao();
		Customer c = dao.getCustomerById(id);
	%>
	<%if(cid!=null){ %>
	<section class="vh-100 gradient-custom">
		<div class="container py-5 h-100">
			<div class="row justify-content-center align-items-center h-100">
				<div class="col-12 col-lg-9 col-xl-7">
				<div class="card shadow-2-strong card-registration"
						style="border-radius: 15px;">
						<div class="card-body p-4 p-md-5">
						<% %>
							<h1 class="mb-4 pb-2 pb-md-0 mb-md-5 text-center text-success">Customer
								Update</h1>
							<form action="./MainServlet?var=cusUpdate&id=<%=c.getcId()%>&role=<%=c.getRoleType() %>" method="post">

								<div class="row">
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input type="text" name="name" value="<%=c.getcName() %>"
												class="form-control form-control-lg" required/> <label
												class="form-label">Customer Name</label>
										</div>

									</div>
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input type="email" name="email" value="<%=c.getcEmail() %>"
												class="form-control form-control-lg" required/> <label
												class="form-label">Customer Email</label>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4 d-flex align-items-center">

										<div class="form-outline datepicker w-100">
											<input type="text" name="mobile" value="<%=c.getcMob() %>"
												class="form-control form-control-lg" required/> <label
												class="form-label">Mobile No.</label>
										</div>

									</div>
									<div class="col-md-6 mb-4">
										<h6 class="mb-2 pb-1">Gender:</h6>

										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="gender"
											<%if(c.getcGender().equals("Male")){%>
												checked
											<%} %>
												value="Male"  required /> <label class="form-check-label">Male</label>
											
										</div>

										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="gender"
											<%if(c.getcGender().equals("Female")){%>
												checked
											<%} %>
												value="Female"  required /> <label class="form-check-label">Female</label>
										</div>

										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="gender"
											<%if(c.getcGender().equals("Other")){%>
												checked
											<%} %>
												value="Other"  required /> <label class="form-check-label">Other</label>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<input type="password" name="pwd" value="<%=c.getcPass() %>"
												class="form-control form-control-lg" required/> <label
												class="form-label">Password</label>
										</div>
									</div>
									<div class="col-md-6 mb-4 pb-2">

										<select required name="ctype" class="select form-control-lg">
											<option value="<%=c.getCustomertype() %>"><%=c.getCustomertype() %></option>
											<option value="Regular">Regular</option>
											<option value="One Time">One Time</option>
										</select> <label class="form-label select-label">Customer Type</label>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4 pb-2">
										<div class="form-outline">
											<select  name="propertytype" class="select form-control-lg" required>
												<option value="<%=c.getPropertyType() %>"><%=c.getPropertyType() %></option>
												<option value="Flat">Flat</option>
												<option value="Duplex">Duplex</option>
												<option value="Bunglow">Bunglow</option>
											</select > <label class="form-label select-label">Customer Property Type</label>
										</div>
									</div>
									<div class="col-md-6 mb-4 pb-2">
										<div class="form-outline">
											<input type="number" name="size" value="<%=c.getPropertySize() %>"
												class="form-control form-control-lg" placeholder="Enter size in number form" required />
											 <label class="form-label select-label">Property Size in sq.m</label>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4 pb-2">
										<div class="form-outline">
											<input type="number" name="members" value="<%=c.getNoOfFamilyMembers() %>"
												class="form-control form-control-lg" required/> <label
												class="form-label">Family Members</label>
										</div>
									</div>
									<div class="col-md-6 mb-4 pb-2">
										<div class="form-outline">
											<select required name="service" class="select form-control-lg">
												<option value="<%=c.getServiceRequirement() %>"><%=c.getServiceRequirement() %></option>
												<option value="Cooking">Cooking</option>
												<option value="Cleaning">Cleaning</option>
												<option value="Cooking & Cleaning both">Cooking & Cleaning both</option>
												<option value="Care taker-Child">Care taker-Child</option>
												<option value="Care taker-Elderly care">Care taker-Elderly care</option>
											</select> <label class="form-label select-label">Service
												Required</label>
										</div>
									</div>
								</div>

								<div class="mt-4 pt-2">
									<button style="margin-left: 40%" type="submit"
										class="btn btn-primary btn-lg btn-block">Update</button>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%}
	else{
		response.sendRedirect("customerlogin.jsp");
	}
	%>
</body>
</html>
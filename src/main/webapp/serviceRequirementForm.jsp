<%@page import="com.app.factory.AdminDaoFactory"%>
<%@page import="com.app.dao.IAdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
<%@include file="./Component/dashboardallcss.jsp"%>
<%@include file="./Component/allcss.jsp"%>
<style type="text/css">
<%@include file="./Component/style.css"%>
<%@include file="./Component/dashboard.css"%>
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

</head>
<body>
	<%@page  import="com.app.bean.Customer" %>
	<%
		String cid = (String) session.getAttribute("Customers");
		IAdminDao dao = AdminDaoFactory.getDao();
		Customer c = dao.getCustomerById(cid);
		String services = (String) request.getAttribute("service");
	%>
	<%if(cid!=null){ %>
	<section class="vh-100 gradient-custom">
		<div class="container py-5 h-100">
			<a href="CustomerDashboard.jsp"><img src="IMAGE/back-button.png"
				width="2%"></a>
			<div class="row justify-content-center align-items-center h-100">
				<div class="col-12 col-lg-9 col-xl-7">
					<div class="card shadow-2-strong card-registration"
						style="border-radius: 15px;">
						<div class="card-body p-4 p-md-5">
							<h1 class="mb-4 pb-2 pb-md-0 mb-md-5 text-center text-success">Service requirement Form</h1>
							<form action="./MainServlet?var=serviceRequirement&req=<%=services %>" method="post">
								<div class="row">
								<%if(services.equals("Cooking")){%>
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<select required name="Rtype" class="select form-control-lg">
												<option value="">Choose option</option>
												<option value="Veg Cooking">Veg Cooking</option>
												<option value="Non-Veg Cooking">Non - Veg Cooking</option>
											</select>
											<label class="form-label">Cooking</label>	
										</div>
									</div>
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<select required name="shift" class="select form-control-lg">
												<option value="">Choose option</option>
												<option value="One Shift">One Shift</option>
												<option value="Two Shift">Two Shift</option>
												<option value="Adhoc">Adhoc</option>
											</select>
											<label class="form-label">Service Shift</label>
										</div>
									</div>
									<% }%>
									<%if(services.equals("Cleaning")){%>
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<select required name="Rtype" class="select form-control-lg">
												<option value="">Choose option</option>
												<option value="Dust Cleaning">Dust Cleaning</option>
												<option value="Standard Cleaning">Standard Cleaning</option>
												<option value="Mopping">Mopping</option>
											</select>
											<label class="form-label">Cleaning</label>
										</div>
									</div>	
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<select required name="shift" class="select form-control-lg">
												<option value="">Choose option</option>
												<option value="Regular">Regular</option>
												<option value="Weekly">Weekly</option>
												<option value="Monthly">Monthly</option>
												<option value="Adhoc">Adhoc</option>
											</select>	
											<label class="form-label">Service Shift</label>
										</div>
									</div>
									<% }%>
									<%if(services.equals("Day Care")){%>
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<select required name="Rtype" class="select form-control-lg">
												<option value="">Choose option</option>
												<option value="Caretaker">Caretaker</option>
												<option value="Elderly Care">Elderly Care</option>
											</select>
											<label class="form-label">Day Care</label>	
										</div>
									</div>	
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<input type="number" class="form-control form-control-lg" placeholder="Only number is accepted" name="shift" required>
											<label class="form-label">Service timing in hrs</label>
										</div>
									</div>
									<% }%>
								</div>
								<div class="row">
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<input type="date" class="form-control form-control-lg"  name="ssd" required>
											<label class="form-label">Service-Start-Date</label>
										</div>
									</div>
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<input type="date" name="sed"
												class="form-control form-control-lg" required/> 
												<label class="form-label">Service-End-Date</label>
										</div>
									</div>
							</div>
								<div class="row">
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<select name="locality" class="select form-control-lg" required>
											<option value="">Choose option</option>
											<option value="Agra">Agra</option>
											<option value="Aurangabad">Aurangabad</option>
											<option value="Amritsar">Amritsar</option>
											<option value="Allahabad">Allahabad</option>
											<option value="Amravati">Amravati</option>
											<option value="Bangalore">Bangalore</option>
											<option value="Bhopal">Bhopal</option>
											<option value="Bareilly">Bareilly</option>
											<option value="Bhavnagar">Bhavnagar</option>
											<option value="Chennai">Chennai</option>
											<option value="Chandigarh">Chandigarh</option>
											<option value="Delhi">Delhi</option>
											<option value="Delhi">Dehradun</option>
											<option value="Firozabad">Firozabad</option>
											<option value="Ghaziabad">Ghaziabad</option>
											<option value="Gwalior">Gwalior</option>
											<option value="Hyderabad">Hyderabad</option>
											<option value="Indore">Indore</option>
											<option value="Jabalpur">Jabalpur</option>
											<option value="Jodhpur">Jodhpur</option>
											<option value="Jaipur">Jaipur</option>
											<option value="Jammu">Jammu</option>
											<option value="Kolkata">Kolkata</option>
											<option value="Kanpur">Kanpur</option>
											<option value="Kota">Kota</option>
											<option value="Karnataka">Karnataka</option>
											<option value="Kochi">Kochi</option>
											<option value="Lucknow">Lucknow</option>
											<option value="Mumbai">Mumbai</option>
											<option value="Meerut">Meerut</option>
											<option value="Moradabad">Moradabad</option>
											<option value="Nagpur">Nagpur</option>
										</select> 
										<label class="form-label select-label">Locality</label>
										</div>
									</div>
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<select required name="time" class="select form-control-lg">
												<option value="">Choose Option</option>
												<option value="8:00 AM - 9:00 AM">8:00 AM - 9:00 AM</option>
												<option value="9:00 AM- 10:00 AM">9:00 AM- 10:00 AM</option>
												<option value="10:00 AM-11:00 AM">10:00 AM-11:00 AM</option>
												<option value="11:00 AM- 12 Noon">11:00 AM- 12 Noon</option>
											</select>
											<label class="form-label">Time Slot</label>
										</div>
									</div>
								</div>
								<div class="row">
								<div class="col-md-6 mb-4">
									<div class="form-outline mb-4">
										<input type="text" name="name" value="<%=c.getcName() %>"
										class="form-control form-control-lg" /> 
										<label class="form-label">Customer Name</label>
									</div>
								</div>
							</div>
								<div class="mt-4">
									<button type="submit" class="btn btn-primary btn-lg btn-block">Apply</button>
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
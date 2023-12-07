<%@page import="org.apache.jasper.tagplugins.jstl.core.Remove"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

</head>
<body>
	<%
		String sucmsg = (String) request.getAttribute("sucmsg");
		String failmsg = (String) request.getAttribute("errmsg");
		String cid =(String) session.getAttribute("Customers");
	%>
	<section class="vh-100 gradient-custom">
		<div class="container py-5 h-100">
			<div class="row justify-content-center align-items-center h-100">
				<div class="col-12 col-lg-9 col-xl-7">
				<%
						if (sucmsg != null) {
						%>
						<div class="bg-success text-center">
							<h6><%=sucmsg%></h6>
						</div>
						<%
						session.removeAttribute("sucmsg");
						}
						%>
						<%
						if (failmsg != null) {
						%>
						<div class="bg-danger text-center">
							<h6><%=failmsg%></h6>
						</div>
						<%
						session.removeAttribute("errmsg");
						}
					%>
					<div class="card shadow-2-strong card-registration"
						style="border-radius: 15px;">
						<div class="card-body p-4 p-md-5">
							<h1 class="mb-4 pb-2 pb-md-0 mb-md-5 text-center text-success">Customer
								Sign up</h1>
							<form action="./MainServlet?var=cusRegister&id=<%=cid %>" method="post">

								<div class="row">
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input type="text" name="name"
												class="form-control form-control-lg" required/> <label
												class="form-label">Customer Name</label>
										</div>

									</div>
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input type="email" name="email"
												class="form-control form-control-lg" required/> <label
												class="form-label">Customer Email</label>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4 d-flex align-items-center">

										<div class="form-outline datepicker w-100">
											<input type="text" name="mobile"
												class="form-control form-control-lg" required/> <label
												class="form-label">Mobile No.</label>
										</div>

									</div>
									<div class="col-md-6 mb-4">

										<h6 class="mb-2 pb-1">Gender:</h6>

										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" value="Male"
												name="gender" required/> <label class="form-check-label">Male</label>
										</div>

										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" value="Female"
												name="gender" required/> <label class="form-check-label">Female</label>
										</div>

										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" value="Other"
												name="gender" required/> <label class="form-check-label">Other</label>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<input type="password" name="pwd"
												class="form-control form-control-lg" required/> <label
												class="form-label">Password</label>
										</div>
									</div>
									<div class="col-md-6 mb-4 pb-2">

										<select required name="ctype" class="select form-control-lg">
											<option value="">Choose option</option>
											<option value="Regular">Regular</option>
											<option value="One Time">One Time</option>
										</select> <label class="form-label select-label">Customer Type</label>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4 pb-2">
										<div class="form-outline">
											<select  name="propertytype" class="select form-control-lg" required>
												<option value="">Choose option</option>
												<option value="Flat">Flat</option>
												<option value="Duplex">Duplex</option>
												<option value="Bunglow">Bunglow</option>
											</select > <label class="form-label select-label">Customer Property Type</label>
										</div>
									</div>
									<div class="col-md-6 mb-4 pb-2">
										<div class="form-outline">
											<input type="number" name="size"
												class="form-control form-control-lg" placeholder="Enter size in number form" required />
											 <label class="form-label select-label">Property Size in sq.m</label>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4 pb-2">
										<div class="form-outline">
											<input type="number" name="members"
												class="form-control form-control-lg" required/> <label
												class="form-label">Family Members</label>
										</div>
									</div>
									<div class="col-md-6 mb-4 pb-2">
										<div class="form-outline">
											<select required name="service" class="select form-control-lg">
												<option value="">Choose option</option>
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
										class="btn btn-primary btn-lg btn-block">Sign up</button>
									<p class="text-center text-muted mt-4 mb-0">Already have acount? 
									<a href="customerlogin.jsp" class=""><u>Sign in</u></a>
									</p>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
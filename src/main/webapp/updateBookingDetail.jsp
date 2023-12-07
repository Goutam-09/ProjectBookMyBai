	<%@page import="com.app.bean.Maid"%>
	<%@page import="com.app.bean.Customer"%>
	<%@page import="com.app.bean.Cooking"%>
	<%@page import="com.app.bean.ServiceRequirement"%>
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
		
	%>
	<section class="vh-100 gradient-custom">
		<div class="container py-5 h-100">
			<div class="row justify-content-center align-items-center h-100">
				<div class="col-12 col-lg-9 col-xl-7">
					<div class="card shadow-2-strong card-registration"
						style="border-radius: 15px;">
						<div class="card-body p-4 p-md-5">
							<h1 class="mb-4 pb-2 pb-md-0 mb-md-5 text-center text-success">Update Booking</h1>
							<form action="" method="post">

								<div class="row">
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input type="text" name="mname" value=""
												class="form-control form-control-lg" required/> 
												<label class="form-label">Maid Name</label>
										</div>

									</div>
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input type="text" name="mservice" value=""
												class="form-control form-control-lg" required/> 
												<label class="form-label">Maid Service</label>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input type="text" name="cname" value="" class="form-control form-control-lg" required/> 
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
											<input type="text" name="pay" value=""
												class="form-control form-control-lg" required/> 
												<label class="form-label">Total Payment</label>
										</div>
									</div>
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<h6 class="mb-2 pb-1">Booking Status</h6>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="verify" value="Pending"   /> 
												<label class="form-check-label">Pending</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="verify" value="Successfull"  checked /> 
												<label class="form-check-label">Successfull</label>
											</div>
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
</body>
</html>
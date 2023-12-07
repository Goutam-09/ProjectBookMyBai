<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Maid Registration</title>
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
					<div class="card shadow-2-strong card-registration"
						style="border-radius: 15px;">
						<%
						if (sucmsg != null) {
						%>
						<div class="bg-success text-center">
							<h6><%=sucmsg%></h6>
						</div>
						<%
						}
						%>
						<%
						if (failmsg != null) {
						%>
						<div class="bg-danger text-center">
							<h6><%=failmsg%></h6>
						</div>
						<%
						}
						%>
						<div class="card-body p-4 p-md-5">
							<h1 class="mb-4 pb-2 pb-md-0 mb-md-5 text-center text-success">Maid
								Sign up</h1>
								
							<form action="./MaidServlet?var=maidRegister&id=<%=cid %>" method="post">

								<div class="row">
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input type="text" name="name"
												class="form-control form-control-lg" required /> <label
												class="form-label">Maid Name</label>
										</div>

									</div>
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input type="tel" name="mobile"
												class="form-control form-control-lg" required /> <label
												class="form-label">Mobile No.</label>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4">
										<h6 class="mb-2 pb-1">Gender:</h6>

										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="gender"
												value="Male" required /> <label class="form-check-label">Male</label>
										</div>

										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="gender"
												value="Female" required /> <label class="form-check-label">Female</label>
										</div>

										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="gender"
												value="Other" required /> <label class="form-check-label">Other</label>
										</div>



									</div>
									<div class="col-md-6 mb-4">
										<select name="occupation" class="select form-control-lg"
											required>
											<option value="">Choose option</option>
											<option value="Veg Cooking">Veg Cooking</option>
											<option value="Non-Veg Cooking">Non-Veg Cooking</option>
											<option value="Dust Cleaning">Dust Cleaning</option>
											<option value="Standard Cleaning">Standard Cleaning</option>
											<option value="Mopping">Mopping</option>
											<option value="Caretaker">Caretaker</option>
											<option value="Elderly Care">Elderly Care</option>
										</select> <label class="form-label select-label">Occupation</label>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4 pb-2">
										<select name="joinAs" class="select form-control-lg" required>
											<option value="">Choose option</option>
											<option value="Full Time">Full Time</option>
											<option value="Adhoc">Adhoc</option>
										</select> <label class="form-label select-label">Join As</label>
									</div>
									<div class="col-md-6 mb-4 pb-2">

										<select name="locality" class="select form-control-lg"
											required>
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
										</select> <label class="form-label select-label">Locality</label>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4 pb-2">
										<div class="form-outline">
											<select name="apartment" class="select form-control-lg"
												required>
												<option value="">Choose option</option>
												<option value="Flat">Flat</option>
												<option value="Duplex">Duplex</option>
												<option value="Bunglow">Bunglow</option>
											</select> <label class="form-label select-label">Apartment</label>
										</div>
									</div>
									<div class="col-md-6 ">
										<div class="form-outline">
											<i class="bi bi-file-earmark"><input name="photo"
												type="file" class="form-control form-control-lg" required>Click
												to Upload Your Photo</i>
										</div>
									</div>
									<div class="col-md-6 ">
										<div class="form-outline">
											<input type="text" name="pwd"
												class="form-control form-control-lg" required> <label
												class="form-label">Password</label>
										</div>
									</div>
								</div>
						<div class="mt-4 pt-2">
							<button  type="submit"
								class="btn btn-primary btn-lg btn-block">Sign up</button>
							<p class="text-center text-muted mt-4 mb-5">
								Already have acount? <a href="maidlogin.jsp" class=""><u>Sign
										in</u></a>
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
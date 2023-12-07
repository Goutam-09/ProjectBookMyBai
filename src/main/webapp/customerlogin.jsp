<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

</head>
<body>
	<%
	String failmsg = (String) request.getAttribute("err");
	String msg = request.getParameter("sMsg");
	%>
	<section class="vh-100">
		<div class="container py-5 h-100">
		<%
			if(msg!=null){%>
			<div class="bg-danger text-center">
				<h6 class=""><%=msg%></h6>
			</div>
		<%}%>
		
			<%
			if (failmsg != null) {
			%>
			<div class="bg-danger text-center">
				<h6><%=failmsg%></h6>
			</div>
			<%
			}
			%>
			<a href="index.jsp"><img src="IMAGE/back-button.png" width="2%"></a>
			<h1 class="text-center text-success">Customer Sign In</h1>
			<div
				class="row d-flex align-items-center justify-content-center h-100">
				<div class="col-md-8 col-lg-7 col-xl-6">
					<img
						src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
						class="img-fluid" alt="Phone image">
				</div>
				<div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
					<form action="./MainServlet?var=cusLogin" method="post">
						<!-- Email input -->
						<div class="form-outline mb-4">
							<input type="email" name="email"
								class="form-control form-control-lg" required /> <label
								class="form-label">Email Id</label>
						</div>

						<!-- Password input -->
						<div class="form-outline mb-4">
							<input type="password" name="pwd"
								class="form-control form-control-lg" required /> <label
								class="form-label">Password</label>
						</div>

						<div style="margin-left: 75%"
							class="text-right align-items-center mb-4">
							<a href="#" class="">Forgot password?</a>
						</div>

						<button style="margin-left: 40%" type="submit"
							class="btn btn-primary btn-lg btn-block">Sign in</button>

						<p class="text-center text-muted mt-4 mb-0">
							Create an Account <a href="customerregistration.jsp" class=""><u>register
									here</u></a>
						</p>

					</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
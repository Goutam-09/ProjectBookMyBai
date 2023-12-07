<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Maid Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style type="text/css">
.bg-image-vertical {
	position: relative;
	overflow: hidden;
	background-repeat: no-repeat;
	background-position: right center;
	background-size: auto 100%;
}

@media ( min-width : 1025px) {
	.h-custom-2 {
		height: 100%;
	}
}
</style>
</head>
<body>
	<%
	String msg = (String) request.getAttribute("err");
	%>
	<section class="vh-100">
		<div class="container-fluid">
			<div class="row">
				<%
				if (msg != null) {
				%>
				<div class="bg-danger text-center">
					<h6><%=msg%></h6>
				</div>
				<%
				}
				%>
				<a href="index.jsp"><img
					style="margin-top: 50px; margin-left: 80px"
					src="IMAGE/back-button.png" width="2%"></a>
				<div class="col-sm-6 px-0 d-none d-sm-block">
					<img style="height: 100%; width: 100%;" src="IMAGE/maid.png"
						class="" alt="">
				</div>
				<div class="col-sm-6 text-black">

					<div
						class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">

						<form style="width: 23rem;" action="./MaidServlet?var=maidLogin"
							method="post">

							<h1 class="mb-4 pb-2 pb-md-0 mb-md-5 text-center text-primary">
								Maid Log in</h1>

							<div class="form-outline mb-4">
								<input type="text" name="name"
									class="form-control form-control-lg" /> <label
									class="form-label">Username</label>
							</div>

							<div class="form-outline mb-4">
								<input type="password" name="pwd"
									class="form-control form-control-lg" /> <label
									class="form-label">Password</label>
							</div>
							<p class="small pb-lg-2">
								<a style="margin-left: 70%" class="" href="#!">Forgot
									password?</a>
							</p>
							<div class="pt-1 mb-4">
								<button style="margin-left: 150px"
									class="btn btn-success btn-block" type="submit">Login</button>
							</div>
							<p style="margin-left: 50px">
								Don't have an account? <a href="maidregistration.jsp"
									class="link-info">Register here</a>
							</p>

						</form>

					</div>

				</div>

			</div>
		</div>
	</section>
</body>
</html>
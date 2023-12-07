<%@page import="com.app.factory.MaidDaoFactory"%>
<%@page import="com.app.dao.IMaidDao"%>
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
	<%@page import="com.app.bean.Maid" %>
		<%
			String cid =(String) request.getAttribute("Customers");
			String id = request.getParameter("id");
			IMaidDao dao = MaidDaoFactory.getDao1();
			Maid m = dao.getMaidById(id);
			
			
		%>
		
		
	<%@include file="./Component/customerNavbar.jsp"%>
	<div class="main-container">
		<%@include  file="./Component/customerSidebar.jsp"%>
		<div class="main">
			<div class="report-container">
				<section style="background-color: #eee;">	
  <div class="container py-5">
    <div class="row">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
          <% if(m.getmGender().equals("Male")) {%>
            <img src="IMAGE/male.png" alt="avatar"class="rounded-circle img-fluid" style="width: 150px;">
            <%}
          else{ %>
        	   <img src="IMAGE/female.png" alt="avatar"class="rounded-circle img-fluid" style="width: 150px;">
         <%} %> 
         
              
            <h5 class="my-3"><%=m.getmName() %></h5>
            
            <img src="IMAGE/verify.png" alt="avatar"class="rounded-circle img-fluid" style="width: 50px;">
          </div>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Name</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=m.getmName() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Mobile</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=m.getmMob() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Gender</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=m.getmGender() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Occupation</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=m.getmOccupation() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Register As</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=m.getmRegType() %></p>
              </div>
            </div>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Locality</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=m.getmLocality() %></p>
              </div>
            </div>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Verified</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=m.getVerifiedTag() %></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

	</div>
	</div>
	</div>

</body>
</html>
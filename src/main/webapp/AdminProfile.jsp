<%@page import="com.app.dao.IAdminDao"%>
<%@page import="com.app.factory.AdminDaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@page import="com.app.bean.Customer" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
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
			Customer c =(Customer) request.getAttribute("profile");
			String cid = (String) session.getAttribute("Customers");
			IAdminDao dao = AdminDaoFactory.getDao();
			Customer c1 = dao.getCustomerById(cid);
		%>
		<%
			if(cid!=null && c1.getRoleType().equals("ADMIN")){
		%>
		<%@include file="./Component/AdminNav.jsp"%>
	<div class="main-container">
		<%@include  file="./Component/AdminSidebar.jsp"%>
	<div class="main">
	<div class="report-container">
	<section style="background-color: #eee;">	
  <div class="container py-5">
    <div class="row">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
            <img src="IMAGE/goutam.jpg" width="150px;" alt="avatar"
              class="rounded-circle img-fluid" style="margin-left: 70px">
             <a type="button" href="updateCustomer.jsp?id=<%=cid %>"><img src="IMAGE/edit.png" width="50px;"style="margin-top: -100px"></a>
            <h5 class="my-3"><%=c.getcName() %></h5>
            <p class="text-muted mb-1">Full Stack Java Developer</p>
          </div>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Id</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=c.getcId() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Name</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=c.getcName() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=c.getcEmail() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Mobile</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=c.getcMob() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Gender</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=c.getcGender() %></p>
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
	<%}
			else{
				response.sendRedirect("customerlogin.jsp");
			 }
	%>
</body>
</html>
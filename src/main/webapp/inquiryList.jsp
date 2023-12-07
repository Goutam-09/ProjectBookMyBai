<%@page import="com.app.factory.AdminDaoFactory"%>
<%@page import="com.app.dao.IAdminDao"%>
<%@page import="com.app.factory.MaidDaoFactory"%>
<%@page import="com.app.dao.IMaidDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.app.bean.Maid" %>
<%@page import="com.app.bean.ServiceRequirement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inquiry List</title>
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
			String cid = (String) session.getAttribute("Customers");
			IAdminDao dao = AdminDaoFactory.getDao();
			ArrayList<ServiceRequirement> list =(ArrayList<ServiceRequirement>) dao.getCustomerInquiryList();
			
		%>
		<%if(cid!=null){ %>
		<%@include file="./Component/AdminNav.jsp"%>
	<div class="main-container">
		<%@include  file="./Component/AdminSidebar.jsp"%>
	<div class="main">
	<div class="report-container" style="; margin-left: -20px;max-width: 1300px">
	<section >	
  <div class="container" style="margin-top: -80px">
    <div class="row">
      <div class="col-lg-12">
        <table class="table">
  <thead>
    <tr>
      <th scope="col">Requirement Service Id</th>
      <th scope="col">Customer Id</th>
      <th scope="col">Customer Name</th>
      <th scope="col">Required Service</th>
      <th scope="col">Service Start Time</th>
      <th scope="col">Service Date</th>
      <th scope="col">Shift</th>
      <th scope="col">Locality</th>
    </tr>
  </thead>
  <tbody>
  <%for(ServiceRequirement sr : list){ %>
    <tr>
      <th scope="row"><%=sr.getsId() %></th>
      <th><%=sr.getcId() %></th>
      <td><%=sr.getcName() %></td>
      <td><%=sr.getService() %></td>
       <td><%=sr.getTimeSlot() %></td>
      <td><%=sr.getServiceStartDate() %></td>
      <td><%=sr.getServiceShift() %></td>
      <td><%=sr.getLocality() %></td>
    </tr>  
    <%} %>
  </tbody>
</table>
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
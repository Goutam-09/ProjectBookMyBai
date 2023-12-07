<%@page import="com.app.bean.ServiceRequirement"%>
<%@page import="com.app.dao.IMaidDao"%>
<%@page import="com.app.factory.MaidDaoFactory"%>
<%@page import="java.util.ArrayList"%>
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
<%@include file="./Component/dashboardallcss.jsp"%>
<%@include file="./Component/allcss.jsp"%>
<style type="text/css">
<%@include file="./Component/style.css"%>
<%@include file="./Component/dashboard.css"%>

</style>
</head>
<body>
		<%@page import="com.app.bean.Maid" %>
		<%@page import="com.app.bean.Cooking" %>					
		<%
			String cid =(String) session.getAttribute("Customers");
			ArrayList<Maid> list =(ArrayList<Maid>) request.getAttribute("lists");
			IMaidDao dao = MaidDaoFactory.getDao1();
			String service = (String) request.getAttribute("req");
			ServiceRequirement sr =(ServiceRequirement) request.getAttribute("requirement");
		%>
		
		<%if(cid!=null){ %>
		<%@include file="./Component/customerNavbar.jsp"%>
		<div class="main-container">
		<%@include  file="./Component/customerSidebar.jsp"%>
		<div class="main">
			<div class="report-container" style="; margin-left: -18px">
				<section >	
				 <div class="container" style="margin-top: -80px;"> 
    				<div class="row">
    				  <div class="col-3">
    				  <%if(list==null){ %>
    				  	<h5 class="text-danger text-center">No Maid Available right now</h5>
    				  	<%} %>
    				  <%if(list!=null){
    					  for(Maid m : list){%> 
    				  			<div class="card p-1 mt-3" style="width: 12rem;">
    				  				<%if(m.getmGender().equals("Male")) {%>
  										<img src="IMAGE/male.png" class="card-img-top"><%} 
    				  				else{%>
    				  					<img src="IMAGE/female.png" class="card-img-top" >
    				  				<%}%>
  									
  										<div class="card-body">
    										<h5 class="card-title text-primary"><%=m.getmName() %></h5>
    										<p class="card-text"></p>
    										<div class="flex">
  												<a type="button" href="MainServlet?var=maidDetail&id=<%=m.getmId()%>" class="btn btn-outline-success">Detail</a>
   												<a type="button" href="MaidServlet?var=maidBooking&id=<%=m.getmId()%>&service=<%=service%>	&req=<%=sr.getServiceShift() %>&locality=<%=sr.getLocality() %>
   												&cid=<%=cid %>&ssd=<%=sr.getServiceStartDate() %>&sed=<%=sr.getServiceEndDate()%>&services=<%=sr.getService() %>" class="btn btn-outline-success">Book </a>
											</div>
   										</div>
							  		</div>
						</div>
    				  	  <%}
    				  }
    				%>
    					  
    				
    				  
    				    
				      </div>
    				</div>
			</section>
	</div>
	</div>
	</div>
	<%}
		else{
			response.sendRedirect("customerlogin.jsp");
		}%>
	
</body>
</html>
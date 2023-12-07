<%@page import="com.app.factory.MaidDaoFactory"%>
<%@page import="com.app.dao.IMaidDao"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unverified Maids</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%@include file="Component/dashboardallcss.jsp"%>
<%@include file="Component/allcss.jsp"%>
<style type="text/css">
<%@include file="Component/style.css"%>
<%@include file="Component/dashboard.css"%>
</style>
</head>
<body>
		<%@page import="com.app.bean.Maid" %>
							
		<%
			String cid = (String) session.getAttribute("Customers");
			IMaidDao dao = MaidDaoFactory.getDao1();
			ArrayList<Maid> list =(ArrayList) dao.getAllUnverifiedMaid();
		%>
		<%if(cid!=null){ %>
		<%@include file="./Component/AdminNav.jsp"%>
	<div class="main-container">
		<%@include  file="./Component/AdminSidebar.jsp"%>
	<div class="main">
	<div class="report-container" style="; margin-left: -20px;max-width: 1130px">
	<section >	
  <div class="container" style="margin-top: -80px">
    <div class="row">
      <div class="col-lg-4">
        <table class="table">
  <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Name</th>
      <th scope="col">Mobile</th>
      <th scope="col">Gender</th>
      <th scope="col">Occupation</th>
      <th scope="col">Register </th>
      <th scope="col">Locality</th>
      <th scope="col">Apartment</th>
      <th scope="col">Verified</th>
      <th scope="col">Action</th>
      <th><a type="button" href="maidregistration.jsp"><img style="margin-left: 50px" alt="" src="IMAGE/addfemale.png" width="70px"></a></th>
    </tr>
  </thead>
  <tbody>
  <%if(list!=null){ 
  for(Maid m : list){ %>
    <tr>
      <th scope="row"><%=m.getmId() %></th>
      <td><%=m.getmName() %></td>
      <td><%=m.getmMob()%></td>
      <td><%=m.getmGender()%></td>
      <td><%=m.getmOccupation()%></td>
      <td><%=m.getmRegType()%></td>
      <td><%=m.getmLocality()%></td>
      <td><%=m.getmApartment()%></td>
      <td><%=m.getVerifiedTag() %></td>
      <td>
      	<a type="button" href="updateMaid.jsp?id=<%= m.getmId() %>"><img src="IMAGE/edit.png" width="50px"></a>
      	<a type="button" onclick="deleteMaid('<%=m.getmId()%>','<%=m.getVerifiedTag() %>')"><img src="IMAGE/delete.png" width="50px"></a>
      </td>
    </tr>
    <%}
  	}
  	else{%>
  		<h1 class="text-success text-center">No maids Available right now</h1>
  	<% }%>
  
  
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
<script type="text/javascript">
	function deleteMaid(id,verify) {
		swal({
			  title: "Are you sure?",
			  text: "Once deleted, you will not be able to recover this imaginary file!",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  document.location.href="MaidServlet?var=deleteMaid&id="+id+"&verify="+verify;
			    
			  } else {
			    swal("Your imaginary file is safe!");
			  }
			});
	}

</script>
</html> 
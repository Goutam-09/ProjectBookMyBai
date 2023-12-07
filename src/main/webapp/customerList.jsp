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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%@include file="./Component/dashboardallcss.jsp"%>
<%@include file="./Component/allcss.jsp"%>
<style type="text/css">
<%@include file="./Component/style.css"%>
<%@include file="./Component/dashboard.css"%>
</style>
</head>
<body>
		<%@page import="com.app.bean.Customer" %>
							
		<%
			String cid = (String) session.getAttribute("Customers");
			String sucMsg = request.getParameter("sucmsg");
			String errMsg = request.getParameter("errmsg");
			Customer c =(Customer) request.getAttribute("profile");
			IAdminDao dao = AdminDaoFactory.getDao();
			Customer c2=dao.getCustomerById(cid);
			ArrayList<Customer> list =(ArrayList) dao.getCustomerList() ;
		%>
		<%if(cid!=null && c2.getRoleType().equals("ADMIN")){ %>
		<%@include file="./Component/AdminNav.jsp"%>
	<div class="main-container">
		<%@include  file="./Component/AdminSidebar.jsp"%>
	<div class="main">
	<div class="report-container" style="margin-left: -20px;max-width: 1350px">
	<section >
	<%
		if(sucMsg!=null){%>
			<h3 class="text-success text-center"><%=sucMsg %></h3>
		<%}
		if(errMsg!=null){%>
			<h3 class="text-danger text-center"><%=errMsg %></h3>
		<%}%>
		
	
  <div class="container" style="margin-top: -60px;">
    <div class="row">
      <div class="col-lg-4">
        <table class="table">
  <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Mobile</th>
      <th scope="col">Gender</th>
      <th scope="col">Customer Type</th>
      <th scope="col">Property Type</th>
      <th scope="col">Family Members</th>
      <th scope="col">Services</th>
      <th scope="col">Action</th> 
      <th><a type="button" href="customerregistration.jsp">
      <img style="margin-left: 50px" alt="" src="IMAGE/addUser.png" width="60px"></a>
      </th>
    </tr>
  </thead>
  <tbody>
  <%for(Customer c1 : list){ %>
    <tr>
      <th scope="row"><%=c1.getcId() %></th>
      <td><%=c1.getcName() %></td>
      <td><%=c1.getcEmail() %></td>
      <td><%=c1.getcMob() %></td>
      <td><%=c1.getcGender() %></td>
      <td><%=c1.getCustomertype() %></td>
      <td><%=c1.getPropertyType() %></td>
      <td><%=c1.getNoOfFamilyMembers() %></td>
      <td><%=c1.getServiceRequirement() %></td>
      <td>
      	<a type="button" href="updateCustomer.jsp?id=<%=c1.getcId() %>" ><img src="IMAGE/edit.png" width="50px"></a>
      	<a type="button"  onclick="deleteCustomer('<%=c1.getcId()%>')"><img src="IMAGE/delete.png" width="50px"></a>
      </td>
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
<script type="text/javascript">
	function deleteCustomer(id) {
		swal({
			  title: "Are you sure?",
			  text: "Once deleted, you will not be able to recover this imaginary file!",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  document.location.href="MainServlet?var=deleteCus&id="+id;
			    
			  } else {
			    swal("Your imaginary file is safe!");
			  }
			});
	}

</script>
	
</html>
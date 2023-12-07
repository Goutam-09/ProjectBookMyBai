
<div class="navcontainer">
		<nav class="nav">
			<div class="nav-upper-options">
				<div class="nav-option option1 ">
					<img
						src="https://media.geeksforgeeks.org/wp-content/uploads/20221210182148/Untitled-design-(29).png"
						class="nav-img" alt="dashboard">
					<h5><a style="text-decoration: none" class="text-white" href="AdminDashboard.jsp">Dashboard</a></h5>
				</div>

				<div class="option2 nav-option">
					<img
							src="IMAGE/userLogo.png"
						class="nav-img" alt="blog">
					<h5><a style="text-decoration: none" href="MainServlet?var=getProfile" class="text-dark">Profile</a></h5>
				</div>

				<div class="nav-option option3">
					<img
							src="IMAGE/customer.png"
						class="nav-img" alt="report">
					<h5><a style="text-decoration: none" href="MainServlet?var=getCustomers" class="text-dark">Customers</a></h5>
				</div>

				<div class="nav-option option4">
					<img
							src="IMAGE/veridfiedMaid.png"
						class="nav-img" alt="institution">
					<h5><a style="text-decoration: none" href="MaidServlet?var=getVerifiedMaids" class="text-dark">Verified Maids</a></h5>
				</div>

				<div class="nav-option option5">
					<img
						src="IMAGE/unverifiedMaid.png"
						class="nav-img" alt="blog">
					<h5><a style="text-decoration: none" href="MaidServlet?var=getUnVerifiedMaids" class="text-dark">Unverified Maids</a></h5>
				</div>

				<div class="nav-option option6">
					<img style="height: 40px"
						src="IMAGE/inquiry.png" width="40px"
						class="nav-img" alt="settings">
					<h5><a style="text-decoration: none" type="button" class="text-dark" href="MainServlet?var=inquiryList">Inquiry List</a></h5>
				</div>
				
				<div class="nav-option option7">
						<img style="height: 30px"
							src="IMAGE/booking.png" width="30px"
							class="nav-img" alt="settings">
						<h5><a style="text-decoration: none" type="button" class="text-dark" href="MainServlet?var=bookingListFull">Bookings</a></h5>
					</div>

				<div class="nav-option logout">
					<img src="IMAGE/log.jpg" class="nav-img" alt="logout" width="35px">
					<h5><a style="text-decoration: none" type="button" class="text-dark" onclick="logOut()">Logout</a></h5>
				</div>

			</div>
		</nav>
	</div>
	<script type="text/javascript">
	function logOut() {
		swal({
			  title: "Are you sure?",
			  text: "Once logout, you will able to login again!",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  document.location.href="MainServlet?var=logoutCustomer";
			    
			  } else {
			    swal("You are not loged out!");
			  }
			});
	}

</script>

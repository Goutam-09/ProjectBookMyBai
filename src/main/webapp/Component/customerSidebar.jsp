<div class="navcontainer">
		<nav class="nav">
			<div class="nav-upper-options">
				<div class="nav-option option1">
					<img
						src="https://media.geeksforgeeks.org/wp-content/uploads/20221210182148/Untitled-design-(29).png"
						class="nav-img" alt="dashboard">
					<h5><a style="text-decoration: none" class="text-white" href="CustomerDashboard.jsp">Dashboard</a></h5>
				</div>

				<div class="option2 nav-option">
					<img
							src="IMAGE/userLogo.png"
						class="nav-img" alt="blog">
					<h5><a style="text-decoration: none" href="MainServlet?var=getProfile" class="text-dark">Profile</a></h5>
				</div>

				<div class="nav-option option3">
					<img
							src="IMAGE/booking.png"
						class="nav-img" alt="report">
					<h5><a style="text-decoration: none" href="MainServlet?var=bookingDetail" class="text-dark">Booking Detail</a></h5>
				</div>

				<div class="nav-option option4">
					<img
							src="IMAGE/veridfiedMaid.png"
						class="nav-img" alt="institution">
					<h5><a style="text-decoration: none" href="" class="text-dark">Maids</a></h5>
				</div>

				<div class="nav-option option5">
					<img
						src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183323/10.png"
						class="nav-img" alt="blog">
					<h5>new</h5>
				</div>

				<div class="nav-option option6">
					<img
						src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183320/4.png"
						class="nav-img" alt="settings">
					<h5>Settings</h5>
				</div>

				<div class="nav-option logout">
					<img src="IMAGE/log.jpg"
						class="nav-img" alt="logout">
					<h5><a style="text-decoration: none" class="text-dark" onclick="logOut()" >Logout</a></h5>
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

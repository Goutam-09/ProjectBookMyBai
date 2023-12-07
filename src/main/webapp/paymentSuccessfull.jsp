<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html
	style="-moz-osx-font-smoothing: grayscale; -webkit-font-smoothing: antialiased; background-color: #464646; margin: 0; padding: 0;">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="./Component/allcss.jsp"%>
</head>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="format-detection" content="telephone=no">
<title>GO Email Templates: Generic Template</title>

</head>
<%
String pId = String.valueOf(request.getAttribute("pId"));
String accNumber = String.valueOf(request.getAttribute("accNumber"));
String name = String.valueOf(request.getAttribute("name"));
String money = String.valueOf(request.getAttribute("money"));
System.out.println(accNumber);
System.out.println(money);
System.out.println(name);
System.out.println(pId);
%>
<body bgcolor="#d7d7d7" class="generic-template"
	style="-moz-osx-font-smoothing: grayscale; -webkit-font-smoothing: antialiased; background-color: #d7d7d7; margin: 0; padding: 0;">

	<!-- Content Start -->
	<table cellpadding="0" cellspacing="0" cols="1" bgcolor="#d7d7d7"
		align="center" style="max-width: 600px;">
		<tr bgcolor="#d7d7d7">
			<td height="50"
				style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
		</tr>

		<!-- This encapsulation is required to ensure correct rendering on Windows 10 Mail app. -->
		<tr bgcolor="#d7d7d7">
			<td
				style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;">
				<!-- Seperator Start -->
				<table cellpadding="0" cellspacing="0" cols="1" bgcolor="#d7d7d7"
					align="center" style="max-width: 600px; width: 100%;">
					<tr bgcolor="#d7d7d7">
						<td height="30"
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
					</tr>
				</table> <!-- Seperator End --> <!-- Generic Pod Left Aligned with Price breakdown Start -->
				<table align="center" cellpadding="0" cellspacing="0" cols="3"
					bgcolor="white" class="bordered-left-right"
					style="border-left: 10px solid #d7d7d7; border-right: 10px solid #d7d7d7; max-width: 600px; width: 100%;">
					<tr height="50">
						<td colspan="3"
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
					</tr>
					<tr align="center">
						<td width="36"
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
						<td class="text-primary"
							style="color: #F16522; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;">
							<img src="IMAGE/righttick.png" alt="GO" width="50"
							style="border: 0; font-size: 0; margin: 0; max-width: 100%; padding: 0;">
						</td>
						<td width="36"
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
					</tr>
					<tr height="17">
						<td colspan="3"
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
					</tr>
					<tr align="center">
						<td width="36"
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
						<td class="text-primary"
							style="color: #F16522; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;">
							<h1
								style="color: green; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 30px; font-weight: 700; line-height: 34px; margin-bottom: 0; margin-top: 0;">Payment
								Successfull</h1>
						</td>
						<td width="36"
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
					</tr>
					<tr height="30">
						<td colspan="3"
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
					</tr>
					<tr align="left">
						<td width="36"
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
						<td
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;">
							<p
								style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 22px; margin: 0;">
								Hi
								<%=name%>,
							</p>
						</td>
						<td width="36"
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>

					</tr>
					<tr height="10">
						<td colspan="3"
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
					</tr>
					<tr align="left">
						<td width="36"
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
						<td
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;">
							<p
								style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 22px; margin: 0;">Your
								transaction was successful!</p> <br>
							<p
								style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 22px; margin: 0;">
								<strong>Payment Details:</strong><br /> Amount:
								<%=money%>
								Rs <br /> Account Number :
								<%=accNumber%><br />
							</p> <br>

						</td>
						<td width="36"
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
					</tr>
					<tr height="30">
						<td
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
						<td
							style="border-bottom: 1px solid #D3D1D1; color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
						<td
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
					</tr>
					<tr height="30">
						<td colspan="3"
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
					</tr>
					<tr align="center">
						<td width="36"
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
						<td
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;">
							<p
								style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 22px; margin: 0;">
								<span style="color: black">Transaction Id : </span><strong
									style="color: green"> <%=pId%></strong>
							</p>
							<p>
								<a type="button" class="btn btn-primary" href="MainServlet?var=bookingDetail" style="background-color:">Go Back</a>
							</p>
						</td>

						<td width="36"
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
					</tr>

					<tr height="50">
						<td colspan="3"
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
					</tr>

				</table> <!-- Generic Pod Left Aligned with Price breakdown End --> <!-- Seperator Start -->
				<table cellpadding="0" cellspacing="0" cols="1" bgcolor="#d7d7d7"
					align="center" style="max-width: 600px; width: 100%;">
					<tr bgcolor="#d7d7d7">
						<td height="50"
							style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
					</tr>
				</table>

			</td>
		</tr>
	</table>
</html>
package com.app.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.bean.Booking;
import com.app.bean.Customer;
import com.app.bean.Maid;
import com.app.bean.Payment;
import com.app.bean.ServiceRequirement;
import com.app.dao.IAdminDao;
import com.app.dao.IMaidDao;
import com.app.factory.AdminDaoFactory;
import com.app.factory.MaidDaoFactory;


public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MainServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean bol=false;
		int nom = 0;
		Customer c10 = null;
		String task = request.getParameter("var");
		HttpSession session = request.getSession();
		IAdminDao dao = AdminDaoFactory.getDao();
		IMaidDao dao1 = MaidDaoFactory.getDao1();
		UUID uuid = UUID.randomUUID();
		String stringUUID = uuid.toString();
		RequestDispatcher rd;
		switch (task) {
		case "cusRegister":
			Customer c = new Customer();
			c.setcId(stringUUID);
			c.setcName(request.getParameter("name"));
			c.setcEmail(request.getParameter("email"));
			c.setcMob(request.getParameter("mobile"));
			c.setcGender(request.getParameter("gender"));
			c.setcPass(request.getParameter("pwd"));
			c.setCustomertype(request.getParameter("ctype"));
			c.setPropertyType(request.getParameter("propertytype"));
			c.setPropertySize(Integer.parseInt(request.getParameter("size")));
			nom =Integer.parseInt(request.getParameter("members"));
			c.setNoOfFamilyMembers(nom);
			c.setServiceRequirement(request.getParameter("service"));
			String cid = (String) request.getParameter("id");
			c10 = dao.getCustomerById(cid);
			if(c10==null) {
				bol = dao.SignupCustomer(c);
				rd = request.getRequestDispatcher("customerregistration.jsp");
				if(bol) {
					request.setAttribute("sucmsg", "Registration Successfully");
					rd.forward(request, response);
				}
				else {
					request.setAttribute("errmsg", "Registration Failed");
					rd.forward(request, response);
				}
			}
			if(c10.getRoleType().equals("ADMIN")) {
				bol = dao.SignupCustomer(c);
				if (bol) {
					rd = request.getRequestDispatcher("customerList.jsp");
					rd.forward(request, response);
				}
				else {
					rd = request.getRequestDispatcher("AdminDashboard.jsp");
					rd.forward(request, response);
				}
			} 
			break;
		case "cusLogin":
			Customer c1 = dao.loginCustomer(request.getParameter("email"),request.getParameter("pwd"));
			System.out.println(c1);
			if (c1 != null) {
				if (c1.getRoleType().equals("ADMIN")) {
					session = request.getSession();
					session.setAttribute("Customers",c1.getcId());
					rd = request.getRequestDispatcher("AdminDashboard.jsp");
					rd.forward(request, response);
				} 
				else {
					System.out.println("hey");
					session = request.getSession();
					session.setAttribute("Customers",c1.getcId());
					rd = request.getRequestDispatcher("CustomerDashboard.jsp");
					rd.forward(request, response);
				}
			} 
			else {
				request.setAttribute("err", "Login Failed");
				rd = request.getRequestDispatcher("customerlogin.jsp");
				rd.forward(request, response);
			}
			break;
		case "cusUpdate":
				Customer c2 = new Customer();
				c2.setcId(request.getParameter("id"));
				c2.setcName(request.getParameter("name"));
				c2.setcEmail(request.getParameter("email"));
				c2.setcMob(request.getParameter("mobile"));
				c2.setcGender(request.getParameter("gender"));
				c2.setcPass(request.getParameter("pwd"));
				c2.setCustomertype(request.getParameter("ctype"));
				c2.setPropertyType(request.getParameter("propertytype"));
				c2.setPropertySize(Integer.parseInt(request.getParameter("size")));
				nom =Integer.parseInt(request.getParameter("members"));
				c2.setNoOfFamilyMembers(nom);
				c2.setServiceRequirement(request.getParameter("service"));
				bol = dao.updateCustomer(c2);
				String str = request.getParameter("role");
				request.setAttribute("profile", c2);
				if(bol) {
					request.setAttribute("sucmsg", "Update Successfully");
					if(str.equals("CUSTOMER")) {
						rd = request.getRequestDispatcher("customerList.jsp");
						rd.forward(request, response);
					}
					else {
						rd = request.getRequestDispatcher("AdminProfile.jsp");
						rd.forward(request, response);
					}
				} else {
					request.setAttribute("errmsg", "Update Failed");
					rd = request.getRequestDispatcher("customerList.jsp");
					rd.forward(request, response);
				}
				break;
		case "deleteCus":
			bol = dao.deleteCustomer(request.getParameter("id"));
			rd = request.getRequestDispatcher("customerList.jsp");
			if(bol) {
			//	request.setAttribute("sucmsg", "Delete Successfully");
				rd.forward(request, response);
			}
			else {
			//	request.setAttribute("errmsg", "Delete Failed");
				rd.forward(request, response);
			}
			break;
		case "getProfile":
			String id =(String) session.getAttribute("Customers");
			Customer c3 = dao.getCustomerById(id);
			request.setAttribute("profile", c3);
			if(c3.getRoleType().trim().equals("ADMIN"))
				rd = request.getRequestDispatcher("AdminProfile.jsp");
			else 
				rd = request.getRequestDispatcher("customerProfile.jsp");
			rd.forward(request, response);
			break;
		case "getCustomers":
			rd = request.getRequestDispatcher("customerList.jsp");
			rd.forward(request, response);
			break;
		case "cooking":
			request.setAttribute("service", "Cooking");
			rd = request.getRequestDispatcher("serviceRequirementForm.jsp");
			rd.forward(request, response);
			break;
		case "cleaning":
			request.setAttribute("service", "Cleaning");
			rd = request.getRequestDispatcher("serviceRequirementForm.jsp");
			rd.forward(request, response);
			break;
			
		case "daycare":
			request.setAttribute("service", "Day Care");
			rd = request.getRequestDispatcher("serviceRequirementForm.jsp");
			rd.forward(request, response);
			break;
		case "serviceRequirement":
			ServiceRequirement sr = new ServiceRequirement();
			sr.setsId(stringUUID);
			String cId =(String) session.getAttribute("Customers");
			String req = request.getParameter("req");
			sr.setcId(cId);
			sr.setcName(request.getParameter("name"));
			sr.setService(request.getParameter("Rtype"));
			sr.setServiceShift(request.getParameter("shift"));
			sr.setServiceStartDate(request.getParameter("ssd"));
			sr.setServiceEndDate(request.getParameter("sed"));
			sr.setTimeSlot(request.getParameter("time"));
			sr.setLocality(request.getParameter("locality"));
			bol = dao1.addRequirement(sr);
			if(bol) {
				ArrayList<Maid> list =  (ArrayList<Maid>) dao1.getRequiredMaidList(request.getParameter("Rtype"),request.getParameter("locality"));
				request.setAttribute("lists", list);
				request.setAttribute("requirement", sr);
				request.setAttribute("req", req);
				rd = request.getRequestDispatcher("requiredMaidList.jsp");
				rd.forward(request, response);
			}
			else {
				rd = request.getRequestDispatcher("requiredMaidList.jsp");
				session.setAttribute("msg", "No Maid Found");
				rd.forward(request, response);
			}
			break;
		case "maidDetail":
			String id2 = request.getParameter("id");
			rd = request.getRequestDispatcher("detailmaid.jsp");
			rd.forward(request, response);
			break;
		
		case "logoutCustomer":
			session = request.getSession();
			session.removeAttribute("Customers");
			HttpSession session1 = request.getSession();
			response.sendRedirect("customerlogin.jsp");
			break;
	
		case "inquiryList":
			rd = request.getRequestDispatcher("inquiryList.jsp");
			rd.forward(request, response);
			break;
		
		case "booking":
			Booking b = new Booking();
			String mId = request.getParameter("maidId");
			String c11 =(String) session.getAttribute("Customers");
			c10 = dao.getCustomerById(c11);
			b.setbId(stringUUID);
			b.setcId(c10.getcId());
			b.setmId(mId);
			b.setMaidName(request.getParameter("mname"));
			b.setMaidService(request.getParameter("mservice"));
			b.setCustomerName(request.getParameter("cname"));
			b.setCustomerAddress(request.getParameter("cAddress"));
			b.setTotalPayment(Integer.parseInt(request.getParameter("money")));
			bol = dao.isBooking(b);
			if(bol) {
				request.setAttribute("PayDetail", b);
				rd = request.getRequestDispatcher("payment.jsp");
				rd.forward(request, response);
			}
			else {
				rd = request.getRequestDispatcher("maidBookingPage.jsp");
				rd.forward(request, response);
			}
			break;
		
		case "bookingListFull":
			rd = request.getRequestDispatcher("bookingList.jsp");
			rd.forward(request, response);
			break;
			
		case "payment":
			String paymentId = stringUUID;
			String ccustomerId = request.getParameter("cId");
			String name = request.getParameter("name");
			String accNumber = request.getParameter("accountNumber");
			String expDate = request.getParameter("expiryDate");
			String cvvNumber = request.getParameter("cvvnumber");
			String pay = request.getParameter("pay");
			Payment p = new Payment();
			p.setpId(paymentId);
			p.setcId(ccustomerId);
			p.setName(name);
			p.setAccNumber(accNumber);
			p.setExpDate(expDate);
			p.setCvvNumber(cvvNumber);
			p.setPayment(pay);
			bol = dao.ispaymentDone(p);
			if(bol) {
				request.setAttribute("pId", paymentId);
				request.setAttribute("accNumber", accNumber);
				request.setAttribute("name", name);
				request.setAttribute("money", pay);
				rd = request.getRequestDispatcher("paymentSuccessfull.jsp");
				rd.forward(request, response);
			}
			else {
				rd = request.getRequestDispatcher("maidBookingPage.jsp");
				rd.forward(request, response);
			}
			break;
			
		case "bookingDetail":
			rd = request.getRequestDispatcher("bookingDetailCustomer.jsp");
			rd.forward(request, response);
			break;
			
		case "editBooking":
			
			
		}		
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

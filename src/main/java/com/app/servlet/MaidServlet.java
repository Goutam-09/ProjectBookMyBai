package com.app.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.bean.Cleaning;
import com.app.bean.Cooking;
import com.app.bean.Customer;
import com.app.bean.DayCare;
import com.app.bean.Maid;
import com.app.dao.IAdminDao;
import com.app.dao.IMaidDao;
import com.app.factory.AdminDaoFactory;
import com.app.factory.MaidDaoFactory;

public class MaidServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MaidServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String task = request.getParameter("var");
		IMaidDao dao1 = MaidDaoFactory.getDao1();
		IAdminDao dao = AdminDaoFactory.getDao();
		boolean bol = false;
		UUID uuid = UUID.randomUUID();
		String stringUUID = uuid.toString();
		RequestDispatcher rd;
		switch (task) {
		case "maidRegister":
			String cid = request.getParameter("id");
			Customer c = dao.getCustomerById(cid);
			Maid m = new Maid();
			m.setmId(stringUUID);
			m.setmName(request.getParameter("name"));
			m.setmMob(request.getParameter("mobile"));
			m.setmGender(request.getParameter("gender"));
			m.setmOccupation(request.getParameter("occupation"));
			m.setmRegType(request.getParameter("joinAs"));
			m.setmLocality(request.getParameter("locality"));
			m.setmApartment(request.getParameter("apartment"));
			m.setmPhoto(request.getParameter("photo"));
			m.setPassword(request.getParameter("pwd"));
			if(c.getRoleType().equals("ADMIN")) {
				bol = dao1.signupMaid(m);
				if(bol) {
					rd = request.getRequestDispatcher("unverifiedMaidList.jsp");
					rd.forward(request, response);
				}
				else {
					rd = request.getRequestDispatcher("AdminDashboard.jsp");
					rd.forward(request, response);
				}	
			}
			else {
				
				rd = request.getRequestDispatcher("maidregistration.jsp");
				bol = dao1.signupMaid(m);
				if (bol) {
					request.setAttribute("sucmsg", "Registration Successfully");
					rd.forward(request, response);
				} else {
					request.setAttribute("errmsg", "Registration Failed");
					rd.forward(request, response);
				}
			}
			break;
		case "maidLogin":
			Maid m1 = dao1.loginMaid(request.getParameter("name"), request.getParameter("pwd"));
			rd = request.getRequestDispatcher("maidlogin.jsp");
			HttpSession session = request.getSession();
			if (m1 != null) {
				session.setAttribute("M1", m1);
				response.sendRedirect("MaidDashboard.jsp");
			} else {
				request.setAttribute("err", "Login Failed");
				rd.forward(request, response);
			}
			break;
		case "updateMaid":
			Maid m2 = new Maid();
			m2.setmId(request.getParameter("id"));
			m2.setmName(request.getParameter("name"));
			m2.setmMob(request.getParameter("mobile"));
			m2.setmGender(request.getParameter("gender"));
			m2.setmOccupation(request.getParameter("occupation"));
			m2.setmRegType(request.getParameter("joinAs"));
			m2.setmLocality(request.getParameter("locality"));
			m2.setmApartment(request.getParameter("apartment"));
			m2.setmPhoto(request.getParameter("photo"));
			m2.setPassword(request.getParameter("pwd"));
			m2.setVerifiedTag(request.getParameter("verify"));
			bol = dao1.updateMaid(m2);
			if(bol) {
				request.setAttribute("sucmsg", "Update Successfully");
				rd = request.getRequestDispatcher("maidsList.jsp");
				rd.forward(request, response);
			} else {
				request.setAttribute("errmsg", "Update Failed");
				rd = request.getRequestDispatcher("maidsList.jsp");
				rd.forward(request, response);
			}	
			break;
		case "deleteMaid":
			String v = request.getParameter("verify");
			bol = dao1.deleteMaid(request.getParameter("id"));
			if(v.equals("VERIFIED")) {
				rd = request.getRequestDispatcher("maidsList.jsp");
				rd.forward(request, response);
			}
			else {
				rd = request.getRequestDispatcher("unverifiedMaidList.jsp");
				rd.forward(request, response);
			}
			break;
		case "getVerifiedMaids":
			rd = request.getRequestDispatcher("maidsList.jsp");
			rd.forward(request, response);
			break;
			
		case "getUnVerifiedMaids":
			rd = request.getRequestDispatcher("unverifiedMaidList.jsp");
			rd.forward(request, response);
			break;
			
		case "maidBooking":
			String ssd = request.getParameter("ssd");
			String sed = request.getParameter("sed");
			DateTimeFormatter f = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate date1 = LocalDate.parse(ssd, f);
			LocalDate date2 = LocalDate.parse(sed, f);
			int daysBetween = (int) ChronoUnit.DAYS.between(date1, date2);
			String ci = request.getParameter("cid"); 
			Customer c7 = dao.getCustomerById(ci);
			String mId = request.getParameter("id");
			String locality = request.getParameter("locality");
			String serviceShift = request.getParameter("req");
			String service = request.getParameter("service");
			Integer locationRate = dao1.getLocationRate(locality);
			
			int totalAmt = 0 ;
			int shiftRate = 0;
			if(service.trim().equals("Cooking")) {
				Cooking cooking = dao1.getCookingRate(serviceShift);
				if(daysBetween<=31 && daysBetween>=28) {
					if(serviceShift.trim().equals("One Shift")) 
						shiftRate = cooking.getOneshiftrate();
					else if(service.trim().equals("Two Shift"))
						shiftRate = cooking.getTwoshiftrate();
					else 
						shiftRate = cooking.getAdhoc();
					int total = locationRate + (cooking.getNom()*c7.getNoOfFamilyMembers()*shiftRate);
					request.setAttribute("total", total);
				}
				else {
					if(serviceShift.trim().equals("One Shift")) 
						shiftRate = cooking.getOneshiftrate();
					else if(service.trim().equals("Two Shift"))
						shiftRate = cooking.getTwoshiftrate();
					else 
						shiftRate = cooking.getAdhoc();
					int total = (locationRate + (cooking.getNom()*c7.getNoOfFamilyMembers()*shiftRate))/28 ;
					totalAmt = total*daysBetween;
					request.setAttribute("total", totalAmt);
				}
				rd = request.getRequestDispatcher("maidBookingPage.jsp");
				rd.forward(request, response);
			} 
			else if(service.trim().equals("Cleaning")) {
				Cleaning cleaning = dao1.getCleaningRate(serviceShift);
				if(daysBetween<=31 && daysBetween>=28) {
					if(serviceShift.trim().equals("Regular"))
						shiftRate = cleaning.getRegularShift();
					if(serviceShift.trim().equals("Weekly"))
						shiftRate = cleaning.getWeeklyShift();
					if(serviceShift.trim().equals("Monthly"))
						shiftRate = cleaning.getMonthlyShift();
					if(serviceShift.trim().equals("Adhoc"))
						shiftRate = cleaning.getAdhocShift();
					int total = locationRate + (c7.getPropertySize()* cleaning.getPropertyRate()*shiftRate);
					request.setAttribute("total", total);
				}
				else {
					if(serviceShift.trim().equals("Regular"))
						shiftRate = cleaning.getRegularShift();
					if(serviceShift.trim().equals("Weekly"))
						shiftRate = cleaning.getWeeklyShift();
					if(serviceShift.trim().equals("Monthly"))
						shiftRate = cleaning.getMonthlyShift();
					if(serviceShift.trim().equals("Adhoc"))
						shiftRate = cleaning.getAdhocShift();
					int total = (locationRate + (c7.getPropertySize()*cleaning.getPropertyRate()*shiftRate ))/28;
					totalAmt = total*daysBetween;
					request.setAttribute("total", totalAmt);
				}
				rd = request.getRequestDispatcher("maidBookingPage.jsp");
				rd.forward(request, response);
			}
			else {
				DayCare d = dao1.getDayCareRate();
				String services  = request.getParameter("services");
				Integer hr =Integer.parseInt(request.getParameter("req"));
				if(services.trim().equals("Caretaker")) {
					if(daysBetween<=31 && daysBetween>=28) {
						int total = locationRate + d.getChildCareRate() + (hr *d.getHourRate());
						request.setAttribute("total", total);
					}
					else {
						int total = (locationRate + d.getChildCareRate() +( hr *d.getHourRate()))/28;
						totalAmt = total*daysBetween;
						request.setAttribute("total", totalAmt);
					}
					rd = request.getRequestDispatcher("maidBookingPage.jsp");
					rd.forward(request, response);
				}
				else {
					if(daysBetween<=31 && daysBetween>=28) {
						int total = locationRate + d.getElderlyCareRate() + (hr *d.getHourRate());
						request.setAttribute("total", total);
					}
					else {
						int total = (locationRate + d.getElderlyCareRate() +( hr *d.getHourRate()))/28;
						totalAmt = total*daysBetween;
						request.setAttribute("total", totalAmt);
					}
					rd = request.getRequestDispatcher("maidBookingPage.jsp");
					rd.forward(request, response);
				}
			}
			break;
			
			
		}	
	}
		
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

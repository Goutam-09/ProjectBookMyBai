package com.app.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.app.bean.Booking;
import com.app.bean.Customer;
import com.app.bean.Maid;
import com.app.bean.Payment;
import com.app.bean.ServiceRequirement;
import com.app.dao.IAdminDao;
import com.app.connection.DbConnection;

public class AdminDaoImpl implements IAdminDao {
	private Connection con;
	private PreparedStatement pstmt;
	private String TABLE_NAME = "customer";
	private String TABLE_NAME_1 = "customerrequirement";
	private String TABLE_NAME_2 = "booking";
	private String TABLE_NAME_3 = "payment";
	private String ADD_CUSTOMER = "INSERT INTO "+TABLE_NAME+" (cid,roletype,cname,cemail,cmobile,cgender,cpassword,customertype,cprotype,cprosize,cnom,cservice) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";	
	private String CHECK_CUSTOMER = "SELECT * FROM "+TABLE_NAME+" WHERE cemail=? AND cpassword=?";
	private String GET_CUSTOMER_BY_ID = "SELECT * FROM "+TABLE_NAME+" WHERE cid=?";
	private String CUSTOMER_LIST = "SELECT *FROM "+TABLE_NAME+" WHERE roletype='CUSTOMER'";
	private String UPDATE_CUSTOMER_BY_ID = "UPDATE "+TABLE_NAME+" SET cname=?,cemail=?,cmobile=?,cgender=?,cpassword=?,customertype=?,cprotype=?,cprosize=?,cnom=?,cservice=? WHERE cid=?";
	private String DELETE_CUSTOMER_BY_ID = "DELETE FROM "+TABLE_NAME+" WHERE cid=?"; 
	private String COUNT_CUSTOMERS = "SELECT COUNT(roletype) FROM "+TABLE_NAME+" WHERE roletype='CUSTOMER'";
	private String INQUIRY_LIST = "SELECT * FROM "+TABLE_NAME_1;
	private String COUNT_INQUIRY = "SELECT COUNT(*) FROM "+TABLE_NAME_1;
	private String MAID_BOOKING = "INSERT INTO "+TABLE_NAME_2+" (bid,cid,mid,mname,mservice,cname,caddress,totalPayment,bookingStatus) VALUES(?,?,?,?,?,?,?,?,?)";
	private String BOOKING_LIST = "SELECT * FROM "+TABLE_NAME_2;
	private String PAYMENT_DONE = "INSERT INTO "+TABLE_NAME_3+" (pId,cId,cName,accNumber,cardExpiryDate,cardCvvNumber,payment,bookingStatus) VALUES(?,?,?,?,?,?,?,?)";
	private String GET_PAYMENT_DETAIL = "SELECT * FROM "+TABLE_NAME_3;
	private String BOOKING_BY_ID = "SELECT * FROM "+TABLE_NAME_2+" WHERE cid=?";
	private String UPDATE_BOOKING = "UPDATE "+TABLE_NAME_2+" SET bookingStatus=? WHERE cId=?";
	
	public AdminDaoImpl() {
		super();
		con= DbConnection.getConnection();
	}

	@Override
	public boolean SignupCustomer(Customer cus) {
		try {
			pstmt = con.prepareStatement(ADD_CUSTOMER);
			pstmt.setString(1, cus.getcId());
			pstmt.setString(2, cus.getRoleType());
			pstmt.setString(3, cus.getcName());
			pstmt.setString(4, cus.getcEmail());
			pstmt.setString(5, cus.getcMob());
			pstmt.setString(6, cus.getcGender());
			pstmt.setString(7, cus.getcPass());
			pstmt.setString(8, cus.getCustomertype());
			pstmt.setString(9, cus.getPropertyType());
			pstmt.setInt(10, cus.getPropertySize());
			pstmt.setInt(11, cus.getNoOfFamilyMembers());
			pstmt.setString(12, cus.getServiceRequirement());
			return pstmt.executeUpdate()>0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteCustomer(String cId) {
		try {
			pstmt = con.prepareStatement(DELETE_CUSTOMER_BY_ID);
			pstmt.setString(1, cId);
			return pstmt.executeUpdate()>0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public boolean updateCustomer(Customer cus) {
		try {
			
			pstmt = con.prepareStatement(UPDATE_CUSTOMER_BY_ID);
			pstmt.setString(1, cus.getcName());
			pstmt.setString(2, cus.getcEmail());
			pstmt.setString(3, cus.getcMob());
			pstmt.setString(4, cus.getcGender());
			pstmt.setString(5, cus.getcPass());
			pstmt.setString(6, cus.getCustomertype());
			pstmt.setString(7, cus.getPropertyType());
			pstmt.setInt(8, cus.getPropertySize());
			pstmt.setInt(9, cus.getNoOfFamilyMembers());
			pstmt.setString(10, cus.getServiceRequirement());
			pstmt.setString(11, cus.getcId());
			return pstmt.executeUpdate()>0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Customer> getCustomerList() {
		try {
			pstmt = con.prepareStatement(CUSTOMER_LIST);
			ResultSet rs = pstmt.executeQuery();
			List<Customer> list = new ArrayList<Customer>();
			Customer c =null;
			while(rs.next()) {
				c = new Customer();
				c.setcId(rs.getString(1));
				c.setcName(rs.getString(3));
				c.setcEmail(rs.getString(4));
				c.setcMob(rs.getString(5));;
				c.setcGender(rs.getString(6));;
				c.setCustomertype(rs.getString(8));;
				c.setPropertyType(rs.getString(9));;
				c.setPropertySize(rs.getInt(10));
				c.setNoOfFamilyMembers(rs.getInt(11));
				c.setServiceRequirement(rs.getString(12));
				list.add(c);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List<Customer> getCustomerAreaWiseList(String area) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Customer loginCustomer(String email,String password) {
		try {
			pstmt = con.prepareStatement(CHECK_CUSTOMER);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			Customer c = null;
			if(rs.next()) {
				c = new Customer();
				c.setcId(rs.getString(1));
				c.setRoleType(rs.getString(2));
				c.setcName(rs.getString(3));
				c.setcEmail(rs.getString(4));
				c.setcMob(rs.getString(5));
				c.setcGender(rs.getString(6));
				c.setCustomertype(rs.getString(7));
				return c;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Customer getCustomerById(String id) {
		try {
			pstmt = con.prepareStatement(GET_CUSTOMER_BY_ID);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			Customer c = null;
			if(rs.next()) {
				c = new Customer();
				c.setcId(rs.getString(1));
				c.setRoleType(rs.getString(2));
				c.setcName(rs.getString(3));
				c.setcEmail(rs.getString(4));
				c.setcMob(rs.getString(5));;
				c.setcGender(rs.getString(6));
				c.setcPass(rs.getString(7));
				c.setCustomertype(rs.getString(8));;
				c.setPropertyType(rs.getString(9));;
				c.setPropertySize(rs.getInt(10));
				c.setNoOfFamilyMembers(rs.getInt(11));
				c.setServiceRequirement(rs.getString(12));
				return c;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public Integer countCustomers() {
		try {
			pstmt = con.prepareStatement(COUNT_CUSTOMERS);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public Integer countInquiries() { 
		try {
			pstmt = con.prepareStatement(COUNT_INQUIRY);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ServiceRequirement> getCustomerInquiryList() {
		try {
			pstmt = con.prepareStatement(INQUIRY_LIST);
			ResultSet rs = pstmt.executeQuery();
			List<ServiceRequirement> list = new ArrayList<ServiceRequirement>();
			ServiceRequirement sr = null;
			while(rs.next()) {
				sr = new ServiceRequirement();
				sr.setsId(rs.getString(1));
				sr.setcId(rs.getString(2));
				sr.setcName(rs.getString(3));
				sr.setService(rs.getString(4));
				sr.setServiceShift(rs.getString(5));
				sr.setServiceStartDate(rs.getString(6));
				sr.setTimeSlot(rs.getString(7));
				sr.setLocality(rs.getString(8));
				list.add(sr);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return null;
	}

	@Override
	public boolean isBooking(Booking booking) {
		try {
			pstmt = con.prepareStatement(MAID_BOOKING);
			pstmt.setString(1, booking.getbId());
			pstmt.setString(2, booking.getcId());
			pstmt.setString(3, booking.getmId());
			pstmt.setString(4, booking.getMaidName());
			pstmt.setString(5, booking.getMaidService());
			pstmt.setString(6, booking.getCustomerName());
			pstmt.setString(7, booking.getCustomerAddress());
			pstmt.setInt(8, booking.getTotalPayment());
			pstmt.setString(9, booking.getBookigStatus());
			return pstmt.executeUpdate()>0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Booking> getBookingList() {
		try {
			pstmt = con.prepareStatement(BOOKING_LIST);
			ResultSet rs = pstmt.executeQuery();
			List<Booking> list = new ArrayList<Booking>();
			Booking b = null;
			while(rs.next()) {
				b = new Booking();
				b.setbId(rs.getString(1));
				b.setcId(rs.getString(2));
				b.setmId(rs.getString(3));
				b.setMaidName(rs.getString(4));
				b.setMaidService(rs.getString(5));
				b.setCustomerName(rs.getString(6));
				b.setCustomerAddress(rs.getString(7));
				b.setTotalPayment(rs.getInt(8));
				b.setBookigStatus(rs.getString(9));
				list.add(b);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean ispaymentDone(Payment pay) {
		try {
			pstmt = con.prepareStatement(PAYMENT_DONE);
			pstmt.setString(1, pay.getpId());
			pstmt.setString(2, pay.getcId());
			pstmt.setString(3, pay.getName());
			pstmt.setString(4, pay.getAccNumber());
			pstmt.setString(5, pay.getExpDate());
			pstmt.setString(6, pay.getCvvNumber());
			pstmt.setString(7, pay.getPayment());
			pstmt.setString(8, pay.getBookingStatus());
			return pstmt.executeUpdate()>0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Payment getCustomerBooking() {
		try {
			pstmt = con.prepareStatement(GET_PAYMENT_DETAIL);
			ResultSet rs = pstmt.executeQuery();
			Payment p = null;
			if(rs.next()) {
				p = new Payment();
				p.setcId(rs.getString(2));
				p.setpId(rs.getString(1));
				p.setName(rs.getString(3));
				p.setAccNumber(rs.getString(4));
				p.setExpDate(rs.getString(5));
				p.setCvvNumber(rs.getString(6));
				p.setPayment(rs.getString(7));
				p.setBookingStatus(rs.getString(8));
				return p;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Booking getCustomerBookingById(String id) {
		try {
			pstmt = con.prepareStatement(BOOKING_BY_ID);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			Booking b = null;
			if(rs.next()) {
				b = new Booking();
				b.setbId(rs.getString(1));
				b.setcId(rs.getString(2));
				b.setmId(rs.getString(3));
				b.setMaidName(rs.getString(4));
				b.setMaidService(rs.getString(5));
				b.setCustomerName(rs.getString(6));
				b.setCustomerAddress(rs.getString(7));
				b.setTotalPayment(rs.getInt(8));
				b.setBookigStatus(rs.getString(9));
				return b;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean updateBookingList(String cid,String status) {
		try {
			pstmt = con.prepareStatement(UPDATE_BOOKING);
			pstmt.setString(1, status);
			pstmt.setString(2, cid);
			return pstmt.executeUpdate()>0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}

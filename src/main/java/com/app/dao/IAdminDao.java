package com.app.dao;

import java.util.List;

import com.app.bean.Booking;
import com.app.bean.Customer;
import com.app.bean.Maid;
import com.app.bean.Payment;
import com.app.bean.ServiceRequirement;

public interface IAdminDao {
	public boolean SignupCustomer(Customer cus);
	public Customer loginCustomer(String email,String password);
	public boolean deleteCustomer(String cId);
	public boolean updateCustomer(Customer cus);
	public List<Customer> getCustomerList();
	public List<Customer> getCustomerAreaWiseList(String area);
	public Customer getCustomerById(String id);
	public Integer countCustomers();
	public Integer countInquiries();
	public List<ServiceRequirement> getCustomerInquiryList();
	public boolean isBooking(Booking booking);
	public List<Booking> getBookingList();
	public boolean ispaymentDone(Payment pay);
	public Payment getCustomerBooking();
	public Booking getCustomerBookingById(String id);
	public boolean updateBookingList(String cid,String status);
}

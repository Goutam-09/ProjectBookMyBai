package com.app.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.app.bean.Cleaning;
import com.app.bean.Cooking;
import com.app.bean.DayCare;
import com.app.bean.Maid;
import com.app.bean.ServiceRequirement;
import com.app.dao.IMaidDao;
import com.app.connection.DbConnection;

public class MaidDaoImpl implements IMaidDao {
	Integer total;
	private Connection con;
	private PreparedStatement pstmt;
	private String TABLE_NAME = "maid";
	private String TABLE_NAME1 = "Customerrequirement";
	private String TABLE_NAME2 = "location";
	private String TABLE_NAME3 = "cooking";
	private String TABLE_NAME4 = "cleaning";
	private String TABLE_NAME5 = "daycare";
	private String ADD_MAID = "INSERT INTO "+TABLE_NAME+" (mid,name,password,mobile,gender,occupation,registerAs,locality,apartment,photo,verified) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
	private String LOGIN_MAID = "SELECT * FROM "+TABLE_NAME+" WHERE name=? AND password=?";
	private String GET_MAID_BY_ID = "SELECT * FROM "+TABLE_NAME+" WHERE mid=?";
	private String ALL_Verified_MAID_LIST = "SELECT * FROM "+TABLE_NAME+" WHERE verified='VERIFIED'";
	private String ALL_UnVerified_MAID_LIST = "SELECT * FROM "+TABLE_NAME+" WHERE verified='UNVERIFIED'";
	private String ACTIVE_MAIDS_LIST = "SELECT * FROM "+TABLE_NAME+" WHERE status=active";
	private String UPDATE_MAID = "UPDATE "+TABLE_NAME+" SET name=?,password=?,mobile=?,gender=?,occupation=?,registerAs=?,locality=?,apartment=?,photo=?,verified=? WHERE mid=?";
	private String DELETE_MAID = "DELETE FROM "+TABLE_NAME+" WHERE mid=?";
	private String GET_REQUIRED_MAIDS = "SELECT * FROM "+TABLE_NAME+" WHERE occupation=? AND locality=? AND verified='VERIFIED'";
	private String ADD_REQUIREMENT = "INSERT INTO "+TABLE_NAME1+" (sId,cId,customerName,service,shift,startDate,endDate,timeSlot,locality) VALUES(?,?,?,?,?,?,?,?,?)";
	private String COUNT_ALL_MAIDS = "SELECT COUNT(*) FROM "+TABLE_NAME+"";
	private String COUNT_ACTIVE_MAIDS = "SELECT COUNT(verified) FROM "+TABLE_NAME+" WHERE verified='VERIFIED'";
	private String COUNT_INACTIVE_MAIDS = "SELECT COUNT(verified) FROM "+TABLE_NAME+" WHERE verified='UNVERIFIED'";
	private String GET_LOCATION_RATE = "SELECT rate FROM "+TABLE_NAME2+" WHERE city=?";
	private String GET_COOKING_RATE = "SELECT * FROM "+TABLE_NAME3; 
	private String GET_CLEANING_RATE = "SELECT * FROM "+TABLE_NAME4;
	private String GET_DAYCARE_RATE = "SELECT * FROM "+TABLE_NAME5;
	
	public MaidDaoImpl() {
		super();
		con = DbConnection.getConnection();
	}

	@Override
	public boolean signupMaid(Maid maid) {
		try {
			pstmt = con.prepareStatement(ADD_MAID);
			pstmt.setString(1, maid.getmId());
			pstmt.setString(2, maid.getmName());
			pstmt.setString(3, maid.getPassword());
			pstmt.setString(4, maid.getmMob());
			pstmt.setString(5, maid.getmGender());
			pstmt.setString(6, maid.getmOccupation());
			pstmt.setString(7, maid.getmRegType());
			pstmt.setString(8, maid.getmLocality());
			pstmt.setString(9, maid.getmApartment());
			pstmt.setString(10, maid.getmPhoto());
			pstmt.setString(11, maid.getVerifiedTag());
			return pstmt.executeUpdate()>0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Maid loginMaid(String name,String password) {
		try {
			pstmt = con.prepareStatement(LOGIN_MAID);
			pstmt.setString(1, name);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			Maid m = null;
			if(rs.next()) {
				m = new Maid();
				m.setmId(rs.getString(1));
				m.setmName(rs.getString(2));
				m.setPassword(rs.getString(3));
				m.setmMob(rs.getString(4));
				m.setmGender(rs.getString(5));
				m.setmOccupation(rs.getString(6));
				m.setmRegType(rs.getString(7));
				m.setmLocality(rs.getString(8));
				m.setmApartment(rs.getString(9));
				m.setmPhoto(rs.getString(10));
				m.setVerifiedTag(rs.getString(11));
				return m;				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Maid getMaidById(String mId) {
		try {
			pstmt = con.prepareStatement(GET_MAID_BY_ID);
			pstmt.setString(1, mId);
			ResultSet rs = pstmt.executeQuery();
			Maid m = null;
			if(rs.next()) {
				m = new Maid();
				m.setmId(rs.getString(1));
				m.setmName(rs.getString(2));
				m.setPassword(rs.getString(3));
				m.setmMob(rs.getString(4));
				m.setmGender(rs.getString(5));
				m.setmOccupation(rs.getString(6));
				m.setmRegType(rs.getString(7));
				m.setmLocality(rs.getString(8));
				m.setmApartment(rs.getString(9));
				m.setmPhoto(rs.getString(10));
				m.setVerifiedTag(rs.getString(11));
				return m;				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Maid> getAllMaid() {
		try {
			pstmt = con.prepareStatement(ALL_Verified_MAID_LIST);
			ResultSet rs = pstmt.executeQuery();
			List<Maid> list = new ArrayList<Maid>();
			Maid m = null;
			while(rs.next()) {
				m= new Maid();
				m.setmId(rs.getString(1));
				m.setmName(rs.getString(2));
				m.setmMob(rs.getString(4));
				m.setmGender(rs.getString(5));
				m.setmOccupation(rs.getString(6));
				m.setmRegType(rs.getString(7));
				m.setmLocality(rs.getString(8));
				m.setmApartment(rs.getString(9));
				m.setVerifiedTag(rs.getString(11));
				list.add(m);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public List<Maid> getAllUnverifiedMaid() {
		try {
			pstmt = con.prepareStatement(ALL_UnVerified_MAID_LIST);
			ResultSet rs = pstmt.executeQuery();
			List<Maid> list = new ArrayList<Maid>();
			Maid m = null;
			while(rs.next()) {
				m= new Maid();
				m.setmId(rs.getString(1));
				m.setmName(rs.getString(2));
				m.setmMob(rs.getString(4));
				m.setmGender(rs.getString(5));
				m.setmOccupation(rs.getString(6));
				m.setmRegType(rs.getString(7));
				m.setmLocality(rs.getString(8));
				m.setmApartment(rs.getString(9));
				m.setVerifiedTag(rs.getString(11));
				list.add(m);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Maid> getActiveMaids() {
		try {
			pstmt = con.prepareStatement(ACTIVE_MAIDS_LIST);
			ResultSet rs = pstmt.executeQuery();
			List<Maid> list = new ArrayList<Maid>();
			Maid m = null;
			while(rs.next()) {
				m= new Maid();
				m.setmId(rs.getString(1));
				m.setmName(rs.getString(2));
				m.setmMob(rs.getString(3));
				m.setmGender(rs.getString(4));
				m.setmOccupation(rs.getString(5));
				m.setmRegType(rs.getString(6));
				m.setmLocality(rs.getString(7));
				m.setmApartment(rs.getString(8));
				m.setmPhoto(rs.getString(9));
				m.setVerifiedTag(rs.getString(10));
				list.add(m);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean updateMaid(Maid maid) {
		try {
			pstmt = con.prepareStatement(UPDATE_MAID);
			pstmt.setString(1, maid.getmName());
			pstmt.setString(2, maid.getPassword());
			pstmt.setString(3, maid.getmMob());
			pstmt.setString(4, maid.getmGender());
			pstmt.setString(5, maid.getmOccupation());
			pstmt.setString(6, maid.getmRegType());
			pstmt.setString(7, maid.getmLocality());
			pstmt.setString(8, maid.getmApartment());
			pstmt.setString(9, maid.getmPhoto());
			pstmt.setString(10, maid.getVerifiedTag());
			pstmt.setString(11, maid.getmId());
			return pstmt.executeUpdate()>1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteMaid(String mId) {
		try {
			pstmt = con.prepareStatement(DELETE_MAID);
			pstmt.setString(1, mId);
			return pstmt.executeUpdate()>1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public List<Maid> getRequiredMaidList(String requirement,String location) {
		try {
			pstmt = con.prepareStatement(GET_REQUIRED_MAIDS);
			pstmt.setString(1, requirement);
			pstmt.setString(2, location);
			ResultSet rs = pstmt.executeQuery();
			List<Maid> list = new ArrayList<Maid>();
			Maid m = null;
			while(rs.next()) {
				m= new Maid();
				m.setmId(rs.getString(1));
				m.setmName(rs.getString(2));
				m.setmMob(rs.getString(4));
				m.setmGender(rs.getString(5));
				m.setmOccupation(rs.getString(6));
				m.setmRegType(rs.getString(7));
				m.setmLocality(rs.getString(8));
				m.setmApartment(rs.getString(9));
				m.setmPhoto(rs.getString(10));
				list.add(m);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public boolean addRequirement(ServiceRequirement sr) {
		try {
			pstmt = con.prepareStatement(ADD_REQUIREMENT);
			pstmt.setString(1, sr.getsId());
			pstmt.setString(2, sr.getcId());
			pstmt.setString(3, sr.getcName());
			pstmt.setString(4, sr.getService());
			pstmt.setString(5, sr.getServiceShift());
			pstmt.setString(6, sr.getServiceStartDate());
			pstmt.setString(7, sr.getServiceEndDate());
			pstmt.setString(8, sr.getTimeSlot());
			pstmt.setString(9, sr.getLocality());
			
			return pstmt.executeUpdate()>0;	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Integer countAllMaids() {
		try {
			pstmt = con.prepareStatement(COUNT_ALL_MAIDS);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Integer countActiveMaids() {
		try {
			pstmt = con.prepareStatement(COUNT_ACTIVE_MAIDS);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Integer countInActiveMaids() {
		try {
			pstmt = con.prepareStatement(COUNT_INACTIVE_MAIDS);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Integer getLocationRate(String location) {
		try {
			pstmt = con.prepareStatement(GET_LOCATION_RATE);
			pstmt.setString(1, location);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Cooking getCookingRate(String shift) {
		try {
			pstmt = con.prepareStatement(GET_COOKING_RATE);
			ResultSet rs = pstmt.executeQuery();
			Cooking c = null;
			if(rs.next()) {
				c = new Cooking();
				c.setNom(rs.getInt(1));
				if(shift.equals("One Shift")) 
					c.setOneshiftrate(rs.getInt(2));
				if(shift.equals("Two Shift")) 
					c.setTwoshiftrate(rs.getInt(3));
				if(shift.equals("Adhoc"))
					c.setTwoshiftrate(rs.getInt(4));
				return c;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Cleaning getCleaningRate(String shift) {
		try {
			pstmt = con.prepareStatement(GET_CLEANING_RATE);
			ResultSet rs = pstmt.executeQuery();
			Cleaning c = null;
			if(rs.next()) {
				c = new Cleaning();
				c.setPropertyRate(rs.getInt(1));
				if(shift.equals("Regular"))
					c.setRegularShift(rs.getInt(2));
				if(shift.equals("Weekly"))
					c.setWeeklyShift(rs.getInt(3));
				if(shift.equals("Monthly"))
					c.setMonthlyShift(rs.getInt(4));
				if(shift.equals("Adhoc"))
					c.setAdhocShift(rs.getInt(5));
				return c;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public DayCare getDayCareRate() {
		try {
			pstmt = con.prepareStatement(GET_DAYCARE_RATE);
			ResultSet rs = pstmt.executeQuery();
			DayCare d = null;
			if(rs.next()) {
				d = new DayCare();
				d.setHourRate(rs.getInt(2));
				d.setChildCareRate(rs.getInt(3));
				d.setElderlyCareRate(rs.getInt(4));
				return d;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	
	
}

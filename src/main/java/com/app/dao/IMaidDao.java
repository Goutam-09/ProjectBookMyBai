package com.app.dao;

import java.util.List;

import com.app.bean.Cleaning;
import com.app.bean.Cooking;
import com.app.bean.DayCare;
import com.app.bean.Maid;
import com.app.bean.ServiceRequirement;

public interface IMaidDao {
	
	public boolean signupMaid(Maid maid);
	public Maid loginMaid(String name,String password);
	public Maid getMaidById(String mId);
	public List<Maid> getAllMaid();
	public List<Maid> getAllUnverifiedMaid();
	public List<Maid> getActiveMaids();
	public boolean updateMaid(Maid maid);
	public boolean deleteMaid(String mId);
	public List<Maid> getRequiredMaidList(String requirement,String location);
	public boolean addRequirement(ServiceRequirement sr);
	public Integer countAllMaids();
	public Integer countActiveMaids();
	public Integer countInActiveMaids();
	public Integer getLocationRate(String location);
	public Cooking getCookingRate(String shift);
	public Cleaning getCleaningRate(String shift);
	public DayCare getDayCareRate();
}

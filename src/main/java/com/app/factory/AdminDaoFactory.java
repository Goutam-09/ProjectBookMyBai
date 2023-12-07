package com.app.factory;

import com.app.dao.IAdminDao;
import com.app.dao.impl.AdminDaoImpl;

public class AdminDaoFactory {
	public static IAdminDao getDao() {
		return new AdminDaoImpl();
	}
}

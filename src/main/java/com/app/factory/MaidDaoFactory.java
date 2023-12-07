package com.app.factory;

import com.app.dao.IMaidDao;
import com.app.dao.impl.MaidDaoImpl;

public class MaidDaoFactory {
	public static IMaidDao getDao1() {
		return new MaidDaoImpl();
	}
}

package com.app.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	private static final String DB_URL = "jdbc:mysql://localhost:3306/maidmanagement";
	private static final String DB_NAME = "root";
	private static final String DB_PWD = "root";
	private static Connection con = null;

	public static Connection getConnection() {
		if (con == null)
			return con = getConnection(DB_URL, DB_NAME, DB_PWD);
		return con;
	}

	private static Connection getConnection(String dbUrl, String dbName, String DBbPwd_PWD) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(dbUrl, dbName, DBbPwd_PWD);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}

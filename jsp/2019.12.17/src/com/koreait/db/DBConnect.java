package com.koreait.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	private static String jdbcDriver = "oracle.jdbc.driver.OracleDriver";
	private static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private static String user = "james";
	private static String password = "BOND";
	
	public static Connection getConnection() throws Exception {
		Class.forName(jdbcDriver);
		return DriverManager.getConnection(url, user, password);
	}
	
}

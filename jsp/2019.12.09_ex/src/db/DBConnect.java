package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String user = "james";
		String password = "bond";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		return DriverManager.getConnection(url,user,password);
	}
}

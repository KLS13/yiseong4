package com.koreait.db;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Ex01_create_table {

	@SuppressWarnings("resource")
	public static void main(String[] args) {

		Connection conn = null;
		PreparedStatement ps = null;
		String sql = null;
		int result = 0;
		
		try {
			conn = DBConnect.getConnection();
			sql = "create table client_t (" +
					"cId number(3) primary key, " +
					"cName varchar2(20)," +
					"cAddr varchar2(50), " +
					"cSsn varchar2(15), " +
					"cEmpId number(3)" +
				  ")";
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			if ( result != -1 ) {
				System.out.println("client_t 테이블 생성 성공.");
			}
			sql = "create table emp_t (" +
					"empId number(3) primary key, " +
					"empName varchar2(20), " +
					"empGender varchar2(10), " +
					"empDeptNo number(3), " +
					"empJobId varchar2(10), " +
					"empHireDate date, " + 
					"empManager number(3), " +
					"empSalary number(10)" +
					")";
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			if ( result != -1 ) {
				System.out.println("emp_t 테이블 생성 성공.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) { conn.close(); }
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}
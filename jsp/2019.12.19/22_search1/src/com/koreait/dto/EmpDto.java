package com.koreait.dto;

import java.sql.Date;

public class EmpDto {
	private int empId,empDeptNo, empManager,empSalary;
	private String empName,empGender,empJobId;
	private Date empHireDate;
	
	public EmpDto() { }

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public int getEmpDeptNo() {
		return empDeptNo;
	}

	public void setEmpDeptNo(int empDeptNo) {
		this.empDeptNo = empDeptNo;
	}

	public int getEmpManager() {
		return empManager;
	}

	public void setEmpManager(int empManager) {
		this.empManager = empManager;
	}
	public int getEmpSalary() {
		return empSalary;
	}
	public void setEmpSalary(int empSalary) {
		this.empSalary = empSalary;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpGender() {
		return empGender;
	}
	public void setEmpGender(String empGender) {
		this.empGender = empGender;
	}
	public String getEmpJobId() {
		return empJobId;
	}
	public void setEmpJobId(String empJobId) {
		this.empJobId = empJobId;
	}
	public Date getEmpHireDate() {
		return empHireDate;
	}
	public void setEmpHireDate(Date empHireDate) {
		this.empHireDate = empHireDate;
	}
}

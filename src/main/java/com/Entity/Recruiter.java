package com.Entity;

public class Recruiter {
	private int id;
	private String companyName;
	private String recruiterName;
	private String email;
	private String password;
	private String mobile;
	private String role;
	private String status;
	private String name;
	
	public Recruiter() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Recruiter(String companyName, String recruiterName, String email, String password, String mobile,
			String role, String status) {
		super();
		this.companyName = companyName;
		this.recruiterName = recruiterName;
		this.email = email;
		this.password = password;
		this.mobile = mobile;
		this.role = role;
		this.status = status;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getRecruiterName() {
		return recruiterName;
	}
	public void setRecruiterName(String recruiterName) {
		this.recruiterName = recruiterName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Recruiter [id=" + id + ", companyName=" + companyName + ", recruiterName=" + recruiterName + ", email="
				+ email + ", password=" + password + ", mobile=" + mobile + ", role=" + role + ", status=" + status
				+ "]";
	}
	
	

	
}

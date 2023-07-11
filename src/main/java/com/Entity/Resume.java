package com.Entity;

public class Resume {
	private int id;
	private String userResume;
	private String userName;
	private String userMobile;
	private String recruiterCompany;
	
	public Resume() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Resume(String userResume, String userName, String userMobile, String recruiterCompany) {
		super();
		this.userResume = userResume;
		this.userName = userName;
		this.userMobile = userMobile;
		this.recruiterCompany = recruiterCompany;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserResume() {
		return userResume;
	}

	public void setUserResume(String userResume) {
		this.userResume = userResume;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserMobile() {
		return userMobile;
	}

	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}

	public String getRecruiterCompany() {
		return recruiterCompany;
	}

	public void setRecruiterCompany(String recruiterCompany) {
		this.recruiterCompany = recruiterCompany;
	}

	@Override
	public String toString() {
		return "Resume [id=" + id + ", userResume=" + userResume + ", userName=" + userName + ", userMobile="
				+ userMobile + ", recruiterCompany=" + recruiterCompany + "]";
	}

}

package com.web.tech.entities;

public class Security {
	private int sid;
	private String first_school_name;
	private String born;
	private String fev_fr;
	private String email;
	private String password;

	public Security() {
		super();
	}

	public Security(String first_school_name, String born, String fev_fr, String email, String password) {
		super();
		this.first_school_name = first_school_name;
		this.born = born;
		this.fev_fr = fev_fr;
		this.email = email;
		this.password = password;
	}

	public Security(int sid, String first_school_name, String born, String fev_fr, String email, String password) {
		super();
		this.sid = sid;
		this.first_school_name = first_school_name;
		this.born = born;
		this.fev_fr = fev_fr;
		this.email = email;
		this.password = password;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getFirst_school_name() {
		return first_school_name;
	}

	public void setFirst_school_name(String first_school_name) {
		this.first_school_name = first_school_name;
	}

	public String getBorn() {
		return born;
	}

	public void setBorn(String born) {
		this.born = born;
	}

	public String getFev_fr() {
		return fev_fr;
	}

	public void setFev_fr(String fev_fr) {
		this.fev_fr = fev_fr;
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

}

package com.web.tech.entities;

public class Deleteduser {
	private int did;
	private String username;
	private String useremail;

	public Deleteduser() {
		super();
	}

	public Deleteduser(int did, String username, String useremail) {
		super();
		this.did = did;
		this.username = username;
		this.useremail = useremail;
	}

	public Deleteduser(String username, String useremail) {
		super();
		this.username = username;
		this.useremail = useremail;
	}

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

}

package com.web.tech.entities;

public class User {
	private int id;
	private String username;
	private String useremail;
	private String password;
	private String repassword;
	private String gender;
	private String about;
	private String imgname;

	public String getImgname() {
		return imgname;
	}

	public void setImgname(String imgname) {
		this.imgname = imgname;
	}

	public User(String username, String useremail, String password, String repassword, String gender, String about,
			String imgname) {
		super();
		this.username = username;
		this.useremail = useremail;
		this.password = password;
		this.repassword = repassword;
		this.gender = gender;
		this.about = about;
		this.imgname = imgname;
	}

	public User(int id, String username, String useremail, String password, String repassword, String gender,
			String about, String imgname) {
		super();
		this.id = id;
		this.username = username;
		this.useremail = useremail;
		this.password = password;
		this.repassword = repassword;
		this.gender = gender;
		this.about = about;
		this.imgname = imgname;
	}

	public User() {
		super();
	}

	public User(int id, String username, String useremail, String password, String repassword, String gender,
			String about) {
		super();
		this.id = id;
		this.username = username;
		this.useremail = useremail;
		this.password = password;
		this.repassword = repassword;
		this.gender = gender;
		this.about = about;
	}

	public User(String username, String useremail, String password, String repassword, String gender, String about) {
		super();
		this.username = username;
		this.useremail = useremail;
		this.password = password;
		this.repassword = repassword;
		this.gender = gender;
		this.about = about;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", useremail=" + useremail + ", password=" + password
				+ ", repassword=" + repassword + ", gender=" + gender + ", about=" + about + ", imgname=" + imgname
				+ "]";
	}

}

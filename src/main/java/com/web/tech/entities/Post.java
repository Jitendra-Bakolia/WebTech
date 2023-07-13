package com.web.tech.entities;

import java.sql.Timestamp;

public class Post {
	private int pid;
	private String title;
	private String pcontent;
	private String pcode;
	private String ppic;
	private Timestamp pdate;
	private int catid;
	private int userid;

	public Post() {
		super();
	}

	public Post(int pid, String title, String pcontent, String pcode, String ppic, Timestamp pdate, int catid,
			int userid) {
		super();
		this.pid = pid;
		this.title = title;
		this.pcontent = pcontent;
		this.pcode = pcode;
		this.ppic = ppic;
		this.pdate = pdate;
		this.catid = catid;
		this.userid = userid;
	}

	public Post(String title, String pcontent, String pcode, String ppic, Timestamp pdate, int catid, int userid) {
		super();
		this.title = title;
		this.pcontent = pcontent;
		this.pcode = pcode;
		this.ppic = ppic;
		this.pdate = pdate;
		this.catid = catid;
		this.userid = userid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public String getPpic() {
		return ppic;
	}

	public void setPpic(String ppic) {
		this.ppic = ppic;
	}

	public Timestamp getPdate() {
		return pdate;
	}

	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}

	public int getCatid() {
		return catid;
	}

	public void setCatid(int catid) {
		this.catid = catid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

}

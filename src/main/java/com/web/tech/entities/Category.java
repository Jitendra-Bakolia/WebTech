package com.web.tech.entities;

public class Category {
	private int cid;
	private String name;
	private String discription;

	public Category(int cid, String name, String discription) {
		super();
		this.cid = cid;
		this.name = name;
		this.discription = discription;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

	public Category() {
		super();
	}

	public Category(String name, String discription) {
		super();
		this.name = name;
		this.discription = discription;
	}

}

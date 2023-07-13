package com.web.tech.entities;

public class Msg {
	private String content;
	private String type;
	private String cssClass;

	public Msg(String content, String type, String cssClass) {
		super();
		this.content = content;
		this.type = type;
		this.cssClass = cssClass;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCssClass() {
		return cssClass;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

}

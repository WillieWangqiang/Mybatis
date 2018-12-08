package com.webmall.pojo;

public class ComputerUser {
	private int id;
	private String comp_name;
	private String comp_nicke_name;
	private String comp_passwrod;
	private String comp_email;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getComp_name() {
		return comp_name;
	}
	public void setComp_name(String comp_name) {
		this.comp_name = comp_name;
	}
	public String getComp_nicke_name() {
		return comp_nicke_name;
	}
	public void setComp_nicke_name(String comp_nicke_name) {
		this.comp_nicke_name = comp_nicke_name;
	}
	public String getComp_passwrod() {
		return comp_passwrod;
	}
	public void setComp_passwrod(String comp_passwrod) {
		this.comp_passwrod = comp_passwrod;
	}
	public String getComp_email() {
		return comp_email;
	}
	public void setComp_email(String comp_email) {
		this.comp_email = comp_email;
	}
	@Override
	public String toString() {
		return "ComputerUser [id=" + id + ", comp_name=" + comp_name + ", comp_nicke_name=" + comp_nicke_name
				+ ", comp_passwrod=" + comp_passwrod + ", comp_email=" + comp_email + "]";
	}
	
	
}

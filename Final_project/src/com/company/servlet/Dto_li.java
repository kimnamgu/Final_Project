package com.company.servlet;

public class Dto_li {

	private String name;
	private String email;
	private String pass;
	private String title;
	private String content;
	private String ip;
	private int no;
	private String hit;
	private String date;
	private String file;
	
	public Dto_li() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Dto_li(String title, int no, String hit, String date, String file) {
		super();
		this.title = title;
		this.no = no;
		this.hit = hit;
		this.date = date;
		this.file = file;
	}


	public String getname() {
		return name;
	}
	public void setname(String name) {
		this.name = name;
	}
	public String getemail() {
		return email;
	}
	public void setemail(String email) {
		this.email = email;
	}
	public String getpass() {
		return pass;
	}
	public void setpass(String pass) {
		this.pass = pass;
	}
	public String gettitle() {
		return title;
	}
	public void setBtitle(String title) {
		this.title = title;
	}
	public String getcontent() {
		return content;
	}
	public void setcontent(String content) {
		this.content = content;
	}
	public String getip() {
		return ip;
	}
	public void setip(String ip) {
		this.ip = ip;
	}
	public int getno() {
		return no;
	}
	public void setno(int no) {
		this.no = no;
	}
	public String gethit() {
		return hit;
	}
	public void sethit(String hit) {
		this.hit = hit;
	}
	public String getdate() {
		return date;
	}
	public void setdate(String date) {
		this.date = date;
	}
	public String getfile() {
		return file;
	}
	public void setfile(String file) {
		this.file =file;
	}
	
	public Dto_li(String name, String email, String pass, String title, String content, String ip, int no,
			String hit, String date) {
		super();
		this.name = name;
		this.email = email;
		this.pass = pass;
		this.title = title;
		this.content = content;
		this.ip = ip;
		this.no = no;
		this.hit = hit;
		this.date = date;
	}
	public Dto_li(String name, String title, int no,
			String hit, String date ,String file) {
		super();
		this.name = name;
		this.title = title;
		this.no = no;
		this.hit = hit;
		this.date = date;
		this.file = file;
	}
	public Dto_li(String name, String email, String pass, String title, String content,int no,
			String hit, String date) {
		super();
		this.name = name;
		this.email = email;
		this.pass = pass;
		this.title =title;
		this.content = content;
		this.no = no;
		this.hit = hit;
		this.date = date;
	}


	public Dto_li(int no, String name, String email, String title, String date,
			String file) {
		
		this.name = name;
		this.title = title;
		this.no = no;
		this.date = date;
		this.file = file;
		this.email = email;
		

		
	}



	
}

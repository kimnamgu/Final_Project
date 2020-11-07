package com.company.java;

public class Dto_list {

	private String bname;
	private String bemail;
	private String bpass;
	private String btitle;
	private String bcontent;
	private String bip;
	private int bno;
	private String bhit;
	private String bdate;
	private String bfile;
	
	public Dto_list() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBemail() {
		return bemail;
	}
	public void setBemail(String bemail) {
		this.bemail = bemail;
	}
	public String getBpass() {
		return bpass;
	}
	public void setBpass(String bpass) {
		this.bpass = bpass;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBip() {
		return bip;
	}
	public void setBip(String bip) {
		this.bip = bip;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBhit() {
		return bhit;
	}
	public void setBhit(String bhit) {
		this.bhit = bhit;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public String getBfile() {
		return bfile;
	}
	public void setBfile(String bfile) {
		this.bfile =bfile;
	}
	
	public Dto_list(String bname, String bemail, String bpass, String btitle, String bcontent, String bip, int bno,
			String bhit, String bdate) {
		super();
		this.bname = bname;
		this.bemail = bemail;
		this.bpass = bpass;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bip = bip;
		this.bno = bno;
		this.bhit = bhit;
		this.bdate = bdate;
	}
	public Dto_list(String bname, String btitle, int bno,
			String bhit, String bdate ,String bfile) {
		super();
		this.bname = bname;
		this.btitle = btitle;
		this.bno = bno;
		this.bhit = bhit;
		this.bdate = bdate;
		this.bfile = bfile;
	}
	public Dto_list(String bname, String bemail, String bpass, String btitle, String bcontent,int bno,
			String bhit, String bdate) {
		super();
		this.bname = bname;
		this.bemail = bemail;
		this.bpass = bpass;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bno = bno;
		this.bhit = bhit;
		this.bdate = bdate;
	}

	
	
}

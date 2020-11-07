package com.company.db;

public class Dto_members {
	
	private int mbno;
	private String mbid;
	private String mbpass;
	private String mbemail;
	private String mbmobile;
	private String mbaddress;
	private String mbemail_agree;
	private String mblike;
	private String mbdate;
	public Dto_members() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getMbno() {
		return mbno;
	}

	public void setMbno(int mbno) {
		this.mbno = mbno;
	}

	public String getMbid() {
		return mbid;
	}

	public void setMbid(String mbid) {
		this.mbid = mbid;
	}

	public String getMbpass() {
		return mbpass;
	}

	public void setMbpass(String mbpass) {
		this.mbpass = mbpass;
	}

	public String getMbemail() {
		return mbemail;
	}

	public void setMbemail(String mbemail) {
		this.mbemail = mbemail;
	}

	public String getMbmobile() {
		return mbmobile;
	}

	public void setMbmobile(String mbmobile) {
		this.mbmobile = mbmobile;
	}

	public String getMbaddress() {
		return mbaddress;
	}

	public void setMbaddress(String mbaddress) {
		this.mbaddress = mbaddress;
	}

	public String getMbemail_agree() {
		return mbemail_agree;
	}

	public void setMbemail_agree(String mbemail_agree) {
		this.mbemail_agree = mbemail_agree;
	}

	public String getMblike() {
		return mblike;
	}

	public void setMblike(String mblike) {
		this.mblike = mblike;
	}

	public String getMbdate() {
		return mbdate;
	}

	public void setMbdate(String mbdate) {
		this.mbdate = mbdate;
	}

	public Dto_members(int mbno, String mbid, String mbpass, String mbemail, String mbmobile, String mbaddress,
			String mbemail_agree, String mblike, String mbdate) {
		super();
		this.mbno = mbno;
		this.mbid = mbid;
		this.mbpass = mbpass;
		this.mbemail = mbemail;
		this.mbmobile = mbmobile;
		this.mbaddress = mbaddress;
		this.mbemail_agree = mbemail_agree;
		this.mblike = mblike;
		this.mbdate = mbdate;
	}
	

	public Dto_members( String mbid, String mbpass, String mbemail, String mbmobile, String mbaddress,
			String mbemail_agree, String mblike, String mbdate) {
		super();
		this.mbid = mbid;
		this.mbpass = mbpass;
		this.mbemail = mbemail;
		this.mbmobile = mbmobile;
		this.mbaddress = mbaddress;
		this.mbemail_agree = mbemail_agree;
		this.mblike = mblike;
		this.mbdate = mbdate;
	}
	
	
	
	
	
}

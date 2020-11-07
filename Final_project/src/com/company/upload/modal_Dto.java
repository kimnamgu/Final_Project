package com.company.upload;

public class modal_Dto {

	
		private int mno;
		private String mtitle;
		private String mdate;
		private String mfile;
		
		public int getMno() {
			return mno;
		}
		public void setMno(int mno) {
			this.mno = mno;
		}
		public String getMtitle() {
			return mtitle;
		}
		public void setMtitle(String mtitle) {
			this.mtitle = mtitle;
		}
		public String getmdate() {
			return mdate;
		}
		public void setmdate(String mdate) {
			this.mdate = mdate;
		}
		public String getMfile() {
			return mfile;
		}
		public void setMfile(String mfile) {
			this.mfile = mfile;
		}
		public modal_Dto() {
			super();
			// TODO Auto-generated constructor stub
		}

		public modal_Dto(int mno, String mtitle, String mdate, String mfile) {
			super();
			this.mno = mno;
			this.mtitle = mtitle;
			this.mdate = mdate;
			this.mfile = mfile;
		}
		@Override
		public String toString() {
			return "modal_Dto [mno=" + mno + ", mtitle=" + mtitle + ", mdate=" + mdate + ", mfile=" + mfile + "]";
		}
		
}

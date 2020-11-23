package com.customerclientModal;

import java.util.List;

public class BriefcaseJsonObject {

	    int iTotalRecords;
	    int iTotalDisplayRecords;
	    String sEcho;
	    String sColumns;
	    List<Briefcase> aaData;
		
	    public int getiTotalRecords() {
			return iTotalRecords;
		}
		public void setiTotalRecords(int iTotalRecords) {
			this.iTotalRecords = iTotalRecords;
		}
		public int getiTotalDisplayRecords() {
			return iTotalDisplayRecords;
		}
		public void setiTotalDisplayRecords(int iTotalDisplayRecords) {
			this.iTotalDisplayRecords = iTotalDisplayRecords;
		}
		public String getsEcho() {
			return sEcho;
		}
		public void setsEcho(String sEcho) {
			this.sEcho = sEcho;
		}
		public String getsColumns() {
			return sColumns;
		}
		public void setsColumns(String sColumns) {
			this.sColumns = sColumns;
		}
		public List<Briefcase> getAaData() {
			return aaData;
		}
		public void setAaData(List<Briefcase> aaData) {
			this.aaData = aaData;
		}
	    
	    
	
	
}

package com.customeradmin.process;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.customeradminController.CustomerServletAction;


public class CustomerProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    CustomerServletAction servletaction;
    public CustomerProcess() {
        
    	  servletaction=new CustomerServletAction();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 String action=request.getParameter("action");
		 
			 
	     if(action.equals("customerlogout")){
	    	  servletaction.logout(request, response);	
		 }else if(action.equals("customerupdateprofile")){
			  servletaction.updateprofile(request, response);
		 }else if(action.equals("customerclientdetail")){
			  servletaction.clientdetail(request, response);
		 }else if(action.equals("customerclientdetaildelete")){
			  servletaction.clientdetaildelete(request, response);
		 }else if(action.equals("customerclientdetailupdate")){
			  servletaction.clientdetailupdate(request, response);
		 }else if(action.equals("customercomplainlist")){
			  servletaction.complainlist(request,response); 	  
		 }else if(action.equals("customerchangepassword")){ //
			  servletaction.changepassword(request, response);
		 }else if (action.equals("complainupdate")) {
			  servletaction.complainupdate(request, response);
		 }else if (action.equals("complainremark")) {
			  servletaction.complainremark(request, response);
		 }else if(action.equals("uploadphoto")) {
			  servletaction.uploadphoto(request, response);
		}else if(action.equals("clienRecord")) {
			  servletaction.clienRecord(request, response);
		}else if(action.equals("editclient")) {
			  servletaction.editclient(request, response);
		}else if(action.equals("viewclient")) {
			  servletaction.viewclient(request, response);
		}else if(action.equals("cloudRecord")) {
			  servletaction.cloudRecord(request, response);
		}else if(action.equals("trackingRecord")) {
			  servletaction.trackingRecord(request, response);
		}else if(action.equals("profileRecord")) {
			  servletaction.profileRecord(request, response);
		}else if(action.equals("profileView")) {
			  servletaction.profileCompleteDetails(request, response);
		}else if(action.equals("dashboard")) {
			  servletaction.DashboardDetails(request, response);
		}else if(action.equals("dashboardRequestAccessDepartment")) {
			  servletaction.dashboardRequestAccessDepartment(request, response);
		}else if(action.equals("dashboarddepartmentaccess")) {
			  servletaction.DashboardDepartmentAccess(request, response);
		}else if(action.equals("AcceptAndRejectDepartment")) {
			  servletaction.AcceptAndRejectDepartment(request, response);
		}else if(action.equals("clients")) {
 	          servletaction.ClientsNames(request, response);
	   }else if(action.equals("client_chat_details")) {
	          servletaction.client_chat_details(request, response);
	   }else if(action.equals("client_message")) {
	          servletaction.client_message(request, response);
	   }else if(action.equals("suggestionName")) {
	        servletaction.suggestionName(request, response);
	  }
	  
	    
	}
	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			 doGet(request, response);
		}

	

}

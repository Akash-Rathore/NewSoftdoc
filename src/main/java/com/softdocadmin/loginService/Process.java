package com.softdocadmin.loginService;




import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.softdocadmin.controller.ActionFirst;;


public class Process extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ActionFirst actionFirst;

	public Process() {
		actionFirst = new ActionFirst();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
           
		String action = request.getParameter("action");
		if (action.equals("logout")) {
			actionFirst.logout(request, response);
		} else if (action.equals("updateprofile")) {
			actionFirst.updateprofile(request, response);
		} else if (action.equals("customer")) {
			actionFirst.customer(request, response);
		} else if (action.equals("customerdelete")) {
			actionFirst.customerdelete(request, response);
		} else if (action.equals("customerupdate")) {
			actionFirst.customerupdate(request, response);
		} else if (action.equals("subadmine")) {
			actionFirst.subadmine(request, response);
		}else if (action.equals("changepassword")) {
			actionFirst.changepassword(request, response);
		} else if (action.equals("subadmindelete")) {
			actionFirst.subadmindelete(request, response);
		} else if (action.equals("subadminupdate")) {
			actionFirst.subadminupdate(request, response);
		} else if (action.equals("customerlocation")) {
			actionFirst.customerlocation(request, response);
		} else if (action.equals("complainlist")) {
			actionFirst.complainlist(request, response);
		} else if (action.equals("complainlistupdate")) {
			actionFirst.complainlistupdate(request, response);
		}else if (action.equals("uploadbill")) {
			actionFirst.uploadbill(request, response);
		}else if(action.equals("complainlistremark")) {
			actionFirst.complainlistremark(request, response);
		}else if(action.equals("paymentstatus")) {
			 actionFirst.paymentstatus(request, response);
		}else if(action.equals("uploadphoto")) {
			 actionFirst.uploadphoto(request, response);
		}else if(action.equals("deletelocation")) {
			actionFirst.deleteLocation(request, response);
		}else if(action.equals("editlocation")) {
			actionFirst.updatelocation(request, response);
		}
		

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

}

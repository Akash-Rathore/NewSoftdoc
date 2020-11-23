package com.subadminstore.process;


import java.io.IOException;
import javax.servlet.http.HttpServlet; 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.subadminstoreController.StroeControllerAction;

public class StoreProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	StroeControllerAction controlleraction;

	public StoreProcess() {

		controlleraction = new StroeControllerAction();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		 if (action.equals("storelogout")) {
			controlleraction.logout(request, response);
		  } else if (action.equals("storeupdateprofile")) {
			controlleraction.updateprofile(request, response);
		}else if(action.equals("storechangepassword")){ //
			controlleraction.changepassword(request, response);
		 }else if(action.equals("uploadphoto")) {
			 controlleraction.uploadphoto(request, response);
		}else if(action.equals("sendindexing")) {
			 controlleraction.sendindexing(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

}

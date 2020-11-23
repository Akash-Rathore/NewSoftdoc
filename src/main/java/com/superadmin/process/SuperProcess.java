package com.superadmin.process;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.superadminController.SuperControllerAction;

public class SuperProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	SuperControllerAction controlleraction;

	public SuperProcess() {

		controlleraction = new SuperControllerAction();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
        
		
		if (action.equals("superlogout")) {
			controlleraction.logout(request, response);
		} else if (action.equals("superupdateprofile")) {
			controlleraction.updateprofile(request, response);
		} else if (action.equals("supercomplainlistupdate")) {
			controlleraction.complainlistupdate(request, response);
		}else if(action.equals("supercomplainlistremark")) {
			controlleraction.complainlistremark(request, response);
		}else if(action.equals("superpassword")) {
			controlleraction.superpassword(request, response);
		}else if(action.equals("uploadphoto")) {
			controlleraction.uploadphoto(request, response);
		}else if(action.equals("filenumberdelete")){
			controlleraction.fileNumberDelete(request, response);
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

}

package com.softdocquality.process;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.subadminqualityController.QualityControllerAction;

//@WebServlet("/Processs")
//@WebServlet(name = "/QualityProcess", urlPatterns = { "/qualityprocess" })
public class QualityProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	QualityControllerAction controlleraction;

	public QualityProcess() {

		controlleraction = new QualityControllerAction();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if(action.equals("qualitylogout")) {
			controlleraction.logout(request, response);
		}else if (action.equals("qualityupdateprofile")) {
			controlleraction.updateprofile(request, response);
		}else if (action.equals("qualityquestion")) {
			controlleraction.qualityquestion(request, response);
		}else if (action.equals("qualitychangepassword")) {
			controlleraction.changepassword(request, response);
		}else if(action.equals("uploadphoto")) {
			controlleraction.uploadphoto(request, response);
		}

		

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

}

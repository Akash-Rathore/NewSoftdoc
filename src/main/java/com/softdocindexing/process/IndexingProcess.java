package com.softdocindexing.process;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.subadminindexingController.IndexingControllerAction;
//@MultipartConfig
//@WebServlet(name = "/IndexingProcess", urlPatterns = { "/indexingprocess" })
public class IndexingProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	IndexingControllerAction controlleraction;

	public IndexingProcess() {

		controlleraction = new IndexingControllerAction();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if (action.equals("indexinglogout")) {
			controlleraction.logout(request, response);
		}else if (action.equals("indexingupdateprofile")) {
			controlleraction.updateprofile(request, response);
		}else if (action.equals("indexinguploaddocument")) {
			controlleraction.uploaddocument(request, response);
		}else if (action.equals("indexingupdatequality")) {
			controlleraction.updatequality(request, response);
		}else if (action.equals("indexingeditdocument")) {
			controlleraction.editdocument(request, response);
		}else if (action.equals("indexingupdateindexing")) {
			controlleraction.updateindexing(request, response);
		}else if (action.equals("updateindexingdoc")) {
			controlleraction.updateindexingdoc(request, response);
		}else if (action.equals("indexuploaddelete")) {
			controlleraction.indexuploaddelete(request, response);
	    }else if(action.equals("indexchangepassword")){ 
			controlleraction.changepassword(request, response);
		}else if(action.equals("uploadphoto")) {
				controlleraction.uploadphoto(request, response);
		}else if(action.equals("indexingupdatedocument")) {
			controlleraction.updatedocument(request, response);
	   }else if(action.equals("indexingattachment")) {
			controlleraction.addattachment(request, response);
	  }else if(action.equals("attachmenthit")) {
			controlleraction.attachmenthit(request, response);
	  }else if(action.equals("updatequlaity")) {
			controlleraction.updatedocumentquality(request, response);
	  }else if(action.equals("deletedocument")) {
			controlleraction.deleteDocument(request, response);
	  }
		
		
		
		/*else if (action.equals("indexviewdocument")) {
			controlleraction.indexviewdocument(request, response);
	    }*/
   }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

}

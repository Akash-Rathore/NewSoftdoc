package com.customerclient.process;


import java.io.IOException;
import javax.servlet.ServletException;
//import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.customerclientController.ClientServletAction;
//@MultipartConfig
//@WebServlet(name="/ClientProcess",urlPatterns={"/clientprocess"})
public class ClientProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ClientServletAction servletaction;
    public ClientProcess() {
        
    	  servletaction=new ClientServletAction();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 String action=request.getParameter("action");
		 
		 if(action.equals("clientlogout")){
	    	  servletaction.logout(request, response);	
		 }else if(action.equals("clientupdateprofile")){
			  servletaction.updateprofile(request, response);
		 }else if(action.equals("clientcomplainlist")){
			  servletaction.complainlist(request,response); 	  
		 }else if(action.equals("clientchangepassword")){
			  servletaction.changepassword(request, response);
		 }else if(action.equals("clientviewdocumentfilter")){
			  servletaction.viewdocumentfilter(request, response);
		 }else if (action.equals("clientbookmarkupdate")) {
				servletaction.bookmarkupdate(request, response);
	     }else if (action.equals("folderbookmarkupdate")) {
				servletaction.folderbookmarkupdate(request, response);
	     }else if (action.equals("clienthit")) {
				servletaction.clienthit(request, response);
	     }else if(action.equals("uploadphoto")) {
	    	    servletaction.uploadphoto(request, response);
		 }else if(action.equals("removestar")) {
    	        servletaction.removestar(request, response);
	     }else if(action.equals("addfile")) {
 	            servletaction.addfile(request, response);
	     }else if(action.equals("updateaddfile")) {
	            servletaction.updateaddFile(request, response);
	     }else if(action.equals("clientupload")) {
	 	        servletaction.uploaddocument(request, response);
		 }else if(action.equals("trashfolder")) {
	 	        servletaction.trashfolder(request, response);
		 }else if(action.equals("trashdocument")) {
	 	        servletaction.trashdocument(request, response);
		 }else if(action.equals("updatedocument")) {
	 	        servletaction.updatedocument(request, response);
		 }else if(action.equals("deletedocument")) {
	 	        servletaction.deletedocument(request, response);
		 }else if(action.equals("undodocument")) {
	 	        servletaction.UndoDocument(request, response);
		 }else if(action.equals("undoFolder")) {
	 	        servletaction.UndoFolder(request, response);
		 }else if(action.equals("undofile")) {
	 	        servletaction.UndoFile(request, response);
		 }else if(action.equals("cronjob")) {
	 	        servletaction.cronjob(request, response);
		 }else if(action.equals("fileupdate")) {
	 	        servletaction.fileupdate(request, response);
		 }else if(action.equals("deleteAllDocument")) {
	 	        servletaction.deleteAllDocument(request, response);
		 }else if(action.equals("trashAllDocument")) {
	 	        servletaction.trashAllDocument(request, response);
		 }else if(action.equals("addfolder")) {
	 	        servletaction.addfolder(request, response);
		 }else if(action.equals("folderupdate")) {
	 	        servletaction.folderupdate(request, response);
		 }else if(action.equals("folderupload")) {
	 	        servletaction.folderupload(request, response);
		 }else if(action.equals("updatefolderdocument")) {
	 	        servletaction.updatefolderdocument(request, response);
		 }else if(action.equals("fetchdepartment")) {
	 	        servletaction.fetchdepartment(request, response);
		 }else if(action.equals("fetchfilename")) {
	 	        servletaction.fetchFileName(request, response);
		 }else if(action.equals("deletetrash")) {
	 	        servletaction.deletetrash(request, response);
		 }else if(action.equals("editAddFile")) {
	 	        servletaction.editAddFile(request, response);
		 }else if(action.equals("suggestionName")) {
	 	        servletaction.suggestionName(request, response);
		 }else if(action.equals("requestaccess")) {
	 	        servletaction.requestaccess(request, response);
		  }else if(action.equals("fileDetails")) {
	 	        servletaction.fileDetails(request, response);
		  }else if(action.equals("fetchfolder")) {
	 	     //   servletaction.fileDetails(request, response);
		  }else if(action.equals("folderdetails")) {
	 	        servletaction.folderdetails(request, response);
		  }else if(action.equals("singlefetchfolder")) {
	 	        servletaction.singlefetchfolder(request, response);
		  }else if(action.equals("fetchdocumenttype")) {
	 	        servletaction.fetchdocumenttype(request, response);
		  }else if(action.equals("folderDocumentType")) {
	 	        servletaction.folderDocumentType(request, response);
		  }else if(action.equals("trashDocumenttype")) {
	 	        servletaction.trashDocumentType(request, response);
		 }else if(action.equals("fileDocumentType")) {
	 	        servletaction.FileDocumentType(request , response);
		 }else if(action.equals("documentindexing")) {
	 	        servletaction.DocumentIndexing(request , response);
		 }else if(action.equals("allattchment")) {
	 	        servletaction.IndexingAttachment(request , response);
		 }else if(action.equals("folderAttachment")) {
	 	        servletaction.folderAttachment(request , response);
		 }else if(action.equals("dashboarddocument")) {
	 	        servletaction.dashboradDocument(request , response);
		 }else if(action.equals("documentdetails")) {
	 	        servletaction.documentDetails(request , response);
		 }else if(action.equals("trashallAttachment")) {
	 	        servletaction.trashallAttachment(request , response);
		 }else if(action.equals("editindexing")) {
	 	        servletaction.editIndexing(request , response);
		 }else if(action.equals("editpermission")) {
	 	        servletaction.editpermission(request , response);
		 }else if(action.equals("deleteSingleAttachment")) {
	 	        servletaction.deleteSingleAttachment(request , response);
		 }else if(action.equals("deletefile")) {
	 	        servletaction.deletefile(request , response);
		 }else if(action.equals("starDocument")) {
	 	        servletaction.starDocument(request , response);
		 }else if(action.equals("trashDashboard")) {
	 	        servletaction.trashDashboard(request , response);
		 }else if(action.equals("emptyTrash")) {
	 	        servletaction.emptyTrash(request , response);
		 }else if(action.equals("emptyTrashdocument")) {
	 	        servletaction.emptyTrashdocument(request , response);
		 }else if(action.equals("briefcase")) {
	 	        servletaction.briefcase(request , response);
		 }else if(action.equals("folderdelete")) {
	 	        servletaction.folderdelete(request , response);
		 }else if(action.equals("folderAccess")) {
	 	        servletaction.folderAccess(request , response);
		 }else if(action.equals("singlefetchdocument")) {
	 	        servletaction.singlefetchdocument(request , response);
		 }else if(action.equals("folderDocumentDetails")) {
	 	        servletaction.folderDocumentDetails(request, response);
		 }else if(action.equals("folderDocumentNoDetails")) {
	 	        servletaction.folderDocumentNoDetails(request, response);
		 }else if(action.equals("dashboardRequestAccess")) {
	 	        servletaction.dashboardRequestAccess(request, response);
		 }else if(action.equals("requestByYou")) {
	 	        servletaction.requestByYou(request, response);
		 }else if(action.equals("editDocument")) {
	 	        servletaction.editDocument(request, response);
		 }else if(action.equals("customerdepartment")) {
	 	        servletaction.Customerdepartment(request, response);
		 }else if(action.equals("requestaccessDept")) {
	 	        servletaction.requestaccessDept(request, response);
		 }else if(action.equals("documentAttachmentUpload")) {
	 	        servletaction.documentAttachmentUpload(request, response);
		 }else if(action.equals("comments")) {
	 	        servletaction.Comments(request, response);
		 }else if(action.equals("fetchComments")) {
	 	        servletaction.fetchComments(request, response);
		 }else if(action.equals("replycomments")) {
	 	        servletaction.replycomments(request, response);
		 }else if(action.equals("folderDocumentAttachement")) {
	 	        servletaction.folderDocumentAttachement(request, response);
		 }else if(action.equals("accessRequestedYou")) {
	 	        servletaction.accessRequestedYou(request, response);
		 }else if(action.equals("requestByFrom")) {
	 	        servletaction.requestByFrom(request, response);
		 }else if(action.equals("requestByFromFileAccept")) {
	 	        servletaction.requestByFromFileAccept(request, response);
		 }else if(action.equals("updateRemarksRequestAccess")) {
	 	        servletaction.updateRemarksRequestAccess(request, response);
		 }else if(action.equals("briefcaseaddfolder")) {
	 	        servletaction.briefcaseaddfolder(request, response);
		 }else if(action.equals("uploadBriefcase")) {
	 	        servletaction.uploadBriefcase(request, response);
		 }else if(action.equals("fetchuploadBriefcase")) {
	 	        servletaction.fetchuploadBriefcase(request, response);
		 }else if(action.equals("clients")) {
	 	        servletaction.ClientsNames(request, response);
		 }else if(action.equals("client_message")) {
	 	        servletaction.client_message(request, response);
		 }else if(action.equals("client_chat_details")) {
	 	        servletaction.client_chat_details(request, response);
		 }else if(action.equals("upload_file_briefcase")) {
	 	        servletaction.upload_file_briefcase(request, response);
		 }else if(action.equals("briefcaseSize")) {
	 	        servletaction.briefcaseSize(request, response);
		 }else if(action.equals("notification")) {
	 	        servletaction.notification(request, response);
		 }else if(action.equals("trashDashboardDocument")) {
	 	        servletaction.trashDashboardDocument(request, response);
		 }else if(action.equals("trashFile")) {
	 	        servletaction.trashFile(request, response);
		 }
		 
		 
		
		

	 }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 doGet(request, response);
	}

}

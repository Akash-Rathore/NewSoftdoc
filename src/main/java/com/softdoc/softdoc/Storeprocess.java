package com.softdoc.softdoc;


import java.util.List;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import com.softdocpickupapi.Location;

@Path("/process")
public class Storeprocess {

	Softdocpickup repo = new Softdocpickup();

	//==================================//========================
		@POST
		@Path("/login")
		@Produces({ MediaType.APPLICATION_JSON })
		@Consumes({ MediaType.APPLICATION_JSON })
		public Picklogin pickogin(Picklogin picklogin) {
		    
			Picklogin picklogin1 = repo.getlogin(picklogin);
			return picklogin1;
	   }
   // =================================//=========================
		@POST
		@Path("/forgot")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public Picklogin getforgot(Picklogin picklogin) {
			
			Picklogin Picklogin1= repo.getforgot(picklogin);
			return Picklogin1;
		}
	// ======================//=============================
	    @POST
		@Path("/faq")
		@Produces({ MediaType.APPLICATION_JSON})
		public List<Faq> getAlien() {
			List<Faq> list = repo.getfaq();
			return list;
		}
	   //============================//=========================

	 	@POST
		@Path("/web_details")
		@Produces({ MediaType.APPLICATION_JSON})
		public List<Privacypolicy> web_details(@PathParam("id") int id) {
			List<Privacypolicy> list = repo.web_details();
			return list;
		}
	
	 	
	 	
	  //========================//========================== 
	
	 	@POST
		@Path("/pickupdate")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public List<Todaypickup> todaypickup() {
			List<Todaypickup> list = repo.todaypickup();
			return list;
		}
	 	
	 	
      //========================//========================== 
		@POST
		@Path("/totalpickupdata")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public Pickup_details totalpickupdata(){
			    Pickup_details pickup_details = repo.totalpickupdata();
			return pickup_details;
		}
       
		//=======================//==============================		
		@POST
		@Path("/previouspickup")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public List<Previouspickup> tomorrowpickup() {

			List<Previouspickup> list = repo.tomorrowpickup();
			return list;
		}
     // ======================//========================//
		@POST
		@Path("/customerdetail")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public Customerdetails customerdetails(Customerdetails customerdetails) {

			Customerdetails list = repo.customerdetails(customerdetails);
			return list;
		}
		//=============================//=======================================
		@POST
		@Path("/customerlocation")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public List<Location> customerlocation(Location location) {

			List<Location> list = repo.customerlocation(location);
			return list;
		}
	//=================================//====================================
	/*	@POST
		@Path("/returndetails")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public List<Store> returndetails() {

			List<Store> list = repo.returndetails();
			return list;
		}*/
       
		//================================//=====================================	
		@POST
		@Path("/clientlogin")
		@Produces({ MediaType.APPLICATION_JSON })
		@Consumes({ MediaType.APPLICATION_JSON })
		public Picklogin clientogin(Picklogin picklogin) {
			    
				Picklogin picklogin1 = repo.clientlogin(picklogin);
				return picklogin1;
		}
	 
		//================================//========================================	
		@POST
		@Path("/clientforgot")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public Picklogin clientforgot(Picklogin picklogin) {
			
			Picklogin Picklogin1= repo.clientforgot(picklogin);
			return Picklogin1;
		}
      
	    //=================================//=========================================
	    @POST
		@Path("/clientdetail")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public Clientdetails clientdetail(Clientdetails clientdetails) {
			 Clientdetails clientdetail = repo.clientdetail(clientdetails);
			 return clientdetail;
		}
		
        //=================================//==========================================
		@POST
		@Path("/updateclientdetail")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public Clientdetails updateclientdetail(Clientdetails clientdetails) {
			 Clientdetails clientdetail = repo.updateclientdetail(clientdetails);
			 return clientdetail;
		}
	
	    //==================================//==========================================
		@POST
		@Path("/changepassword")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public Changepassword changepassword(Changepassword changepassword) {
			Changepassword changepassword1 = repo.changepassword(changepassword);
			 return changepassword1;
		}
        
		//==================================//==========================================
		@POST
		@Path("/showdepartment")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public List<Clientdetails> showdepartment(Clientdetails clientdetails) {
			List<Clientdetails> clientdetails1 = repo.showdepartment(clientdetails);
			 return clientdetails1;
		}		
        
		//======= ===========================//==========================================
	 	@POST
		@Path("/showdocumentnumber")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public List<Filenumber> showdocumentnumber(Filenumber filenumber){
			List<Filenumber> filenumber1= repo.showdocumentnumber(filenumber);
			return filenumber1;
		 
		}
	    
	 	//==================================//===========================================	
	 	@POST
		@Path("/stardocument")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public Filenumber stardocument(Filenumber filenumber){
			Filenumber filenumber1= repo.starfile(filenumber);
			return filenumber1;
		}
	    
	 	//================================//==================================== 	
	 	@POST
		@Path("/showstardocument")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public List<Filenumber> showdocument(Filenumber filenumber){
			List<Filenumber> filenumber1= repo.showdocument(filenumber);
			return filenumber1;
		}
        
	 	//================================//==================================== 	
	 	@POST
		@Path("/filenumber")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public Filenumber filenumber(Filenumber filenumber){
			  Filenumber filenumber1= repo.filenumber(filenumber);
			return filenumber1;
		}
        
	 	//================================//==================================== 	
	 	@POST
		@Path("/showcomplain")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public List<Clientcomplain> showcomplain(Clientcomplain clientcomplain){
	 		List<Clientcomplain> clientcomplain1= repo.showcomplain(clientcomplain);
			return clientcomplain1;
		}
	    
	 	//================================//======================================= 	
	 	@POST
		@Path("/complain")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public  Clientcomplain clientcomplain(Clientcomplain clientcomplain){
	 		  Clientcomplain clientcomplain1= repo.clientcomplain(clientcomplain);
			return clientcomplain1;
		}
	    
	 	//================================//======================================= 	
	 	@POST
		@Path("/documenttype")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public  List<Documenttype> documenttype1(Documenttype documenttype){
	 		  List<Documenttype> documenttype1= repo.documenttype(documenttype);
			return documenttype1;
		}
	    //=================================//=======================================
	 	@POST
		@Path("/createfilenumber")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public Filenumber createfile(Filenumber filenumber){
			 Filenumber filenumber1= repo.createfile(filenumber);
			return filenumber1;
		}
	    
	 	//==============================//=========================================== 	
	 	@POST
		@Path("/returntodaydocument")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public List<Todaypickup> returncustomerdetail() {
	 		List<Todaypickup> list = repo.returntodaypickup();
			return list;
		}
 
        //==============================//============================================	 	
		@POST
		@Path("/returnpreviouspickup")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public List<Previouspickup> returntomorrowpickup() {

			List<Previouspickup> list = repo.returntomorrowpickup();
			return list;
		}
	 	
       //==============================//=============================================	 	
		@POST
		@Path("/returndetail")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public Filenumber returndetails(Filenumber filenumber){
			 Filenumber filenumber1= repo.returndetail(filenumber);
			return filenumber1;
		}
        
		//===========================//=================================================		
		@POST
		@Path("/alldocument")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public  List<Filenumber> alldocument(Filenumber filenumber){
		 	  List<Filenumber> documenttype1= repo.clientdocument(filenumber);
			return documenttype1;
		}
       
		//===============================//========================================
		@POST
		@Path("/returndate")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public  Filenumber returndates(Filenumber filenumber){
		 	   Filenumber documenttype1= repo.returndate(filenumber);
			return documenttype1;
		}
       //======================================//======================================		
		@POST
		@Path("/fetchallhdocument")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public  List<Filenumber> fetchdocumentfileter(Filenumber filenumber){
			  List<Filenumber> documenttype1= repo.fetchdocumentfileter(filenumber);
			return documenttype1;
		}
	  
	    //======================================//======================================		
		@POST
		@Path("/attachmentno")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public  List<Filenumber> attachmentnumber(Filenumber filenumber){
		 	  List<Filenumber> documenttype1= repo.attachmentnumber(filenumber);
			return documenttype1;
		}
		
		
		@POST
		@Path("/unstardocument")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public Filenumber unstardocument(Filenumber filenumber){
			Filenumber filenumber1= repo.unstarfile(filenumber);
			return filenumber1;
		}
		
		
		
		@POST
		@Path("/hitdocument")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public HitDocument hitdocument(HitDocument hitdocument){
			HitDocument hitDocument1 = repo.hitdocument(hitdocument);
			return hitDocument1;
		}
			 
		
		
		@POST
		@Path("/kamendrabhai")
		@Produces({ MediaType.APPLICATION_JSON})
		@Consumes({ MediaType.APPLICATION_JSON})
		public HitDocument example(HitDocument hitdocument){

			HitDocument hitDocument=new HitDocument();
			hitDocument.setId("false_919808073446@c.us_A596F7B8280E36A47A36EE9C4F9FBCAE");
			hitDocument.setItemType("text");
			hitDocument.setBoundType("in");
			hitDocument.setChannelId("2166");
			return hitDocument;
		}
		
		
		
  }





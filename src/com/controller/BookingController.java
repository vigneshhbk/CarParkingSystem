package src.com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;






import src.com.bean.BookingBean;
import src.com.dao.BookingDAO;
import src.com.util.MainClass;

/**
 * Servlet implementation class LoginController
 */
public class BookingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingController() {
        super();
        // TODO Auto-generated constructor stub
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("Booking Controller entered ");
		  PrintWriter out=response.getWriter();
		  try{

			  BookingBean bb=new BookingBean();
	   		  BookingDAO bd=new BookingDAO();

			  
			  //setting booking bean to send info
			  bb.setuserid(request.getParameter("UserId"));
			  bb.setFname(request.getParameter("FirstName"));
	   		  bb.setLname(request.getParameter("LastName"));
	   		  bb.setEmail(request.getParameter("Email"));
	   		  bb.setPhone(request.getParameter("Phone"));
	   		  bb.setcreditnumber(request.getParameter("CCNum"));
	   		  bb.setlotid(request.getParameter("LotId"));
	   		  bb.setindate(request.getParameter("InDate"));
	   		  bb.setintime(request.getParameter("InTime"));
	   		  bb.setoutdate(request.getParameter("OutDate"));		
	   		  bb.setouttime(request.getParameter("OutTime")); 
			  
	   		  

	  		System.out.println("User id: "+bb.getuserid());
	  		System.out.println("First Name: "+bb.getFname());
	  		System.out.println("last Name: "+bb.getLname());
	  		System.out.println("Lot id: "+bb.getlotid());
	   		  
	  		String slotavailable = bd.Checkslot(bb);
	   		
           
			  if(slotavailable!=null){
				  bb.setslotid(slotavailable);
				  System.out.println("Booking validated");
				  System.out.println("Availabel slot= "+bb.getslotid());
				  if(bd.InsertBooking(bb)){
					//insert data into booking table  
//					String bookingid = bd.GetBookingID(bb);	
					ArrayList<String> bookingdetails = new ArrayList<String>(); 
					bookingdetails = bd.GetBookingID(bb);
//					bookingdetails.add(bookingid);
					bookingdetails.add(bb.getFname());
					bookingdetails.add(bb.getLname());
					bookingdetails.add(bb.getEmail());
					bookingdetails.add(bb.getindate());
					bookingdetails.add(bb.getintime());
					bookingdetails.add(bb.getoutdate());
					bookingdetails.add(bb.getouttime());
					bookingdetails.add(bb.getslotid());
					bookingdetails.add(bb.getlotid());
					
					request.setAttribute("BookingList",bookingdetails);
					
					  //mail start 
					 String tempBody = "Booking Id=" +bookingdetails.get(0) 
							+ "\n" +"Booking Lot Name=" + bookingdetails.get(2) 
							+ "Booking Cost=" + bookingdetails.get(1) 
							+ "\n" + "Name=" + bookingdetails.get(3) + bookingdetails.get(4)
							+ "\n" + "Parking In-Date" +bookingdetails.get(6) 
					        + "\n" + "Parking In-Time" +bookingdetails.get(7) 
					        + "\n" + "Parking Out-Date" +bookingdetails.get(8) 
					 + "\n" + "Parking Out-Time" +bookingdetails.get(9) 
					 + "\n" + "Parking Slot Id" +bookingdetails.get(10)
					 + "\n" + "Parking Lot Id" +bookingdetails.get(11); 
					  MainClass sendMail = new MainClass();
					  String sub = "Slot Booking Information";
					  String body = tempBody;
					  String from = "asplearning17@gmail.com";
					  String to = "sujeethkumar17@gmail.com";
					  //String to = bookingdetails.get(5);
					 
					  sendMail.SendMail(sub, body, from, to);
					  
					 // mail end
					
					
					  RequestDispatcher rd=request.getRequestDispatcher("/BookingOk.jsp");
					  rd.forward(request,response);
					
				  }else{
					  RequestDispatcher rd=request.getRequestDispatcher("/Home.jsp");
					  rd.include(request, response);
					  out.println("<script> alert('There is no slot available for parking') </script>");
					    
				  }
				
				  
			  }
			  else{
				  RequestDispatcher rd=request.getRequestDispatcher("/Home.jsp");
				  rd.include(request, response);
				  out.println("<script> alert('There is no slot available for parking') </script>");
				  
				  
			  }
		  }
		  catch(Exception e){
			  
			  e.printStackTrace();
		  }
		
	}

}

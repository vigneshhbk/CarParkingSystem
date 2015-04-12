package src.com.handler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.activation.DataHandler;
import javax.mail.BodyPart;
import javax.mail.Multipart;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import src.com.bean.AdressBean;
import src.com.bean.UserBean;
import src.com.dao.UserDAO;
import src.com.util.*;

/**
 * Servlet implementation class Controller
 */
public class UserHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public UserHandler() {
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
		
      String check = request.getParameter("UserOperation");
      if(check!=null){
    	  
    	  if(request.getParameter("UserOperation").equalsIgnoreCase("signup")){
    		  
    		  PrintWriter out=response.getWriter();
    		   UserBean ub=new UserBean();
    		   AdressBean ab=new AdressBean();
    		   
    		  //setting userbean object to pass it.
    		   
    		   ub.setEmail(request.getParameter("email"));
    		   ub.setFname(request.getParameter("fName"));
    		   ub.setLname(request.getParameter("lName"));
    		   ub.setPassword(request.getParameter("password"));
    		   ub.setPhone(request.getParameter("phone"));
    		   ub.setSsn(request.getParameter("ssn"));
    		   ub.setDob(java.sql.Date.valueOf(request.getParameter("dob")));
    		  // ub.setUserid(Integer.ParseInt(request.getParameter(""));
    		  
    		  //setting adress bean
    		   
    		 ab.setcity(request.getParameter("city"));
    		 ab.setCountry(request.getParameter("country"));
    		 ab.setLine1(request.getParameter("addLine1"));
    		 ab.setLine2(request.getParameter("addLine2"));
    		 ab.setState(request.getParameter("state"));
    		 ab.setZip(Integer.parseInt(request.getParameter("zip")));
    		 try{
    			 
    			 UserDAO ud= new UserDAO();
    			 if(!ud.addUserDetails(ub, ab)){
    				 System.out.println("Users sucessfully added");
    			     out.println(" <script type=\"text/javascript\">");
    			     out.println("alert('Registered Successfully');");
    			     out.println("location='Home.jsp';");
    			     out.println("</script>");		 
    			 }
    			 else
    				 System.out.println("problem with dao");
    			 
    		 }
    		 catch(Exception e){
    			 
    			 e.printStackTrace();
    		 }
    	  }
    	  else if(request.getParameter("UserOperation").equalsIgnoreCase("login")){
    		  System.out.print("login entered ");
    		  PrintWriter out=response.getWriter();
    		  try{
    			   String email = request.getParameter("email");
    			   String pwd   = request.getParameter("password");
    			  UserDAO ud=new UserDAO();
    			  
    			  //mail start 
    			 
    			  MainClass sendMail = new MainClass();
    			  String sub = "Test mail";
    			  String body = "Test mail";
    			  String from = "asplearning17@gmail.com";
    			  String to = "sujeethkumar17@gmail.com";
    			  sendMail.SendMail(sub, body, from, to);
    			  
    			 // mail end
    			  
                 
    			  if(ud.validateUser(email, pwd)){
    				  System.out.println("login validated");
    				  
    				  RequestDispatcher rd=request.getRequestDispatcher("/Home.jsp");
    				  rd.forward(request,response);
    				  
    			  }
    			  else{
    				  RequestDispatcher rd=request.getRequestDispatcher("/login.jsp");
    				  rd.include(request, response);
    				  out.println("<script> alert('Enter Valid Credentials') </script>");	  
    			  }
    		  }
    		  catch(Exception e){
    			  
    			  e.printStackTrace();
    		  }
    	  }
      }
			
		}
	}



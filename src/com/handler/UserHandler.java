package src.com.handler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import src.com.bean.AdressBean;
import src.com.bean.UserBean;
import src.com.dao.UserDAO;

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
    		   ub.setFname(request.getParameter("fname"));
    		   ub.setLname(request.getParameter("lname"));
    		   ub.setPassword(request.getParameter("password"));
    		   ub.setPhone(request.getParameter("phone"));
    		   ub.setSsn(request.getParameter("ssn"));
    		   ub.setDob(request.getParameter("dob"));
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
    			 if(ud.addUserDetails(ub, ab))
    				 System.out.println("Users sucessfully added");
    			 else
    				 System.out.println("problem with dao");
    			 
    		 }
    		 catch(Exception e){
    			 
    			 e.printStackTrace();
    		 }
    	  }
      }
			
		}
	}



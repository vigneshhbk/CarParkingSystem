package src.com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import src.com.bean.LoginBean;
import src.com.dao.UserDAO;
import src.com.util.MainClass;

/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
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
		System.out.print("login Controller entered ");
		  PrintWriter out=response.getWriter();
		  try{
//			   String email = request.getParameter("email");
//			   String pwd   = request.getParameter("password");
			  LoginBean ub=new LoginBean();
	   		  
			  //setting login bean to send info
			  ub.setEmail(request.getParameter("email"));
	   		  ub.setPassword(request.getParameter("password"));
	   		   
			  UserDAO ud=new UserDAO();
   		   
   		   
//			  //mail start 
//			 
//			  MainClass sendMail = new MainClass();
//			  String sub = "Test mail";
//			  String body = "Test mail";
//			  String from = "asplearning17@gmail.com";
//			  String to = "sujeethkumar17@gmail.com";
//			  sendMail.SendMail(sub, body, from, to);
//			  
//			 // mail end
			  
           
			  if(ud.validateUser(ub)){
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

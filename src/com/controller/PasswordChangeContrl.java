package src.com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;





import src.com.bean.LoginBean;
import src.com.bean.UserBean;
import src.com.dao.UserDAO;
import src.com.util.MainClass;

/**
 * Servlet implementation class ResetPasswordContrl
 */
//@WebServlet("/ResetPasswordContrlpath")
public class PasswordChangeContrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordChangeContrl() {
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
		System.out.print("PasswordChange Controller ");
		  PrintWriter out=response.getWriter();
		  try{
			   String answer = request.getParameter("answer");
			   String password = request.getParameter("password");
               String email = request.getParameter("email");
			  UserBean ub=new UserBean();
	   		  
			  //setting login bean to send info
//			  ub.setEmail(request.getParameter("email"));
	   		  
	   		   
			  UserDAO ud=new UserDAO();
   		   
			  System.out.println(email);
           
			  if(ud.validateanswer(email, answer, password))
			  {
				  System.out.println("email and answer validated");
				  System.out.println("Password has been changed");
				     out.println(" <script type=\"text/javascript\">");
				     out.println("alert('Password has been changed Successfully');");
				     out.println("location='Home.jsp';");
				     out.println("</script>");
				  //creating session object.
//				   ub = ud.getsq(email);
				  
//				     HttpSession session=request.getSession();
				  
				  //setting session attributes
//				    request.setAttribute("user", ub);
//				    System.out.println(ub.getEmail());
				    
				//String test=(String)session.getAttribute("userId");
				//System.out.println(test);
				    
//					session.setAttribute("Security", ub.getSecurity());
//					System.out.println(ub.getSecurity());
//				  
//				  RequestDispatcher rd=request.getRequestDispatcher("/ResetPassS.jsp");
//				  rd.forward(request,response);
				  
			  }
			  else{
				  RequestDispatcher rd=request.getRequestDispatcher("/login.jsp");
				  rd.include(request, response);
				  out.println("<script> alert('Enter Valid answer') </script>");
				  
				  
			  }
		  }
		  catch(Exception e){
			  
			  e.printStackTrace();
		  }
		
	}

}

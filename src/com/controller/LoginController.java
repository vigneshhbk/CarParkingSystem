package src.com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import src.com.dao.UserDAO;

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
		
		String uname = request.getParameter("");
		String password = request.getParameter(" ");
		UserDAO ud=new UserDAO();
		boolean status = ud.validateUser(uname,password);
		
		if(status){
			//creating session object and placing it in session. 
			HttpSession session=request.getSession();
			session.setAttribute("userId", uname);
			session.setAttribute("pwd", password);
			
		    RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");	
		}
		else{
			
			request.getRequestDispatcher("Login.jsp");
		}
		
	}

}

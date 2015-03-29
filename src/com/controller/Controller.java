package src.com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Controller
 */
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Controller() {
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
		
		PrintWriter out = response.getWriter();
		out.print(request.getParameter("user"));
		
		String operation=request.getParameter("UserOperation");
		out.print(operation);
		System.out.println("operation"+operation);
		
		
	   
		
		response.addHeader("Cache-Control","no-cache");
		HttpSession session=request.getSession(false);
		
		if(request.getParameter("UserOperation")!=null) {
			System.out.print("Deligating request to UserHandler ");
			RequestDispatcher rd = request.getRequestDispatcher("/UserHandler");
			rd.forward(request,response);
		}
	}

}

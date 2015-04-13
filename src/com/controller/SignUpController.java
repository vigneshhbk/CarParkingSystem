package src.com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import src.com.bean.AdressBean;
import src.com.bean.CreditCard;
import src.com.bean.UserBean;
import src.com.dao.UserDAO;

/**
 * Servlet implementation class Controller
 */
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public SignUpController() {
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
		
	//	PrintWriter out = response.getWriter();
	//	out.print(request.getParameter("user"));
		
//		String operation=request.getParameter("UserOperation");
//	//	out.print(operation);
		System.out.println("Signupcontroller");
		
		response.addHeader("Cache-Control","no-cache");
		HttpSession session=request.getSession(false);
	
		PrintWriter out=response.getWriter();
		   
		UserBean ub=new UserBean();
		   AdressBean ab=new AdressBean();
		   CreditCard cc = new CreditCard();
		  //setting userbean object to pass it.
		   
		   ub.setEmail(request.getParameter("email"));
		   ub.setFname(request.getParameter("fName"));
		   ub.setLname(request.getParameter("lName"));
		   ub.setPassword(request.getParameter("password"));
		   ub.setSecurity(request.getParameter("security"));
		   ub.setAnswer(request.getParameter("answer"));
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
		 
		 // credit card bean
		 cc.setCreditCard(BigInteger.valueOf(Long.valueOf(request.getParameter("creditCardNumber"))));
		 cc.setCardName(request.getParameter("cardName"));
		 cc.setCvv(Integer.valueOf(request.getParameter("cvv")));
		 
		 //split the validupto
		 String validity = request.getParameter("validUpto");
		 String[] parts = validity.split("/");
		 String expirationMonth = parts[0]; 
		 String epirationYear = parts[1];
		 
		 cc.setExpirationMonth(Integer.valueOf(expirationMonth));
		 cc.setExpirationYear(Integer.valueOf(epirationYear));
		 cc.setCardType("visa");
		 try{
			 
			 UserDAO ud= new UserDAO();
			 if(ud.addUserDetails(ub, ab,cc)==0){
				 System.out.println("Users sucessfully added");
			     out.println(" <script type=\"text/javascript\">");
			     out.println("alert('Registered Successfully');");
			     out.println("location='Home.jsp';");
			     out.println("</script>");		 
			 }
			 else{
				 System.out.println("problem with dao");
			 out.println(" <script type=\"text/javascript\">");
		     out.println("alert('NOT REGISTERED!!!. Either user exists or error while registration. Re-Enter Information');");
		     out.println("location='Register.jsp';");
		     out.println("</script>");	
		     
		 
		 }
		 }
		 catch(Exception e){
			 
			 e.printStackTrace();
		 }
	}

}

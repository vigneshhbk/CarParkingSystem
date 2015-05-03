package junittest;

import static org.junit.Assert.*;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.mockito.Mockito;

import src.com.controller.LoginController;
import src.com.controller.PasswordChangeContrl;
import src.com.controller.BookingController;

public class LoginMockit extends Mockito {
	
	
    HttpServletRequest request;
    HttpServletResponse response;
    HttpSession session;
    ServletContext context;
    GenericServlet genericServlet;
    RequestDispatcher requestDispatcher;
	
    @Before
    public void setUp() {
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
        session = mock(HttpSession.class);
        context = mock(ServletContext.class);
        genericServlet = mock(GenericServlet.class);
        requestDispatcher = mock(RequestDispatcher.class);
    }
    
    @Test
    public void testLogin() throws Exception {
        when(request.getParameter("email")).thenReturn("skolluru@uncc.edu");
        when(request.getParameter("password")).thenReturn("password");
        when(request.getSession(true)).thenReturn(session);
 when(request.getRequestDispatcher("/Home.jsp")).thenReturn(requestDispatcher);
        System.out.println("doPost : LogIn");
        LoginController instance = new LoginController();
        instance.doPost(request, response);
        verify(requestDispatcher).forward(request,response);
    }

    @Test
    public void testpasswordchange() throws Exception {
        
        when(request.getParameter("answer")).thenReturn("su");
        when(request.getParameter("email")).thenReturn("skolluru@uncc.edu");
        when(request.getParameter("password")).thenReturn("password");
        when(request.getRequestDispatcher("/login.jsp")).thenReturn(requestDispatcher);
        PasswordChangeContrl instance2 = new PasswordChangeContrl();
        instance2.doPost(request, response);
        verify(requestDispatcher).forward(request,response);
    }
    
    @Test
    public void BookingController() throws Exception {
	
    	when(request.getParameter("UserId")).thenReturn("1");  
        when(request.getParameter("FirstName")).thenReturn("sampath");
        when(request.getParameter("LastName")).thenReturn("kolluru");
        when(request.getParameter("Phone")).thenReturn("3244211123");
        when(request.getParameter("CCNum")).thenReturn("2343242342344454");
        when(request.getParameter("email")).thenReturn("skolluru@uncc.edu");
        when(request.getParameter("LotId")).thenReturn("1");
        when(request.getParameter("InDate")).thenReturn("2015-04-29");
        when(request.getParameter("OutDate")).thenReturn("2015-04-29");
        when(request.getParameter("OutTime")).thenReturn("03:12:00");
        when(request.getParameter("InTime")).thenReturn("04:12:00");
       
        when(request.getRequestDispatcher("/BookingOk.jsp")).thenReturn(requestDispatcher);
        BookingController instance3 = new BookingController();
        instance3.doPost(request, response);
        verify(requestDispatcher).forward(request,response);
    }
    

}

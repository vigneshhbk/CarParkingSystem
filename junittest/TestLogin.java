package junittest;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;
import src.com.dao.*;
import src.com.bean.UserBean;

public class TestLogin {
	private UserBean UserIO;
	private UserDAO model;
	
	private void initializeLogin(String email, String password) {
		UserIO = new UserBean();
		model = new UserDAO();
		UserIO.setEmail(email);
		UserIO.setPassword(password);
	}

	@Test
	public final void testValidUserDetails() {
		String userName = "skolluru@uncc.edu";
		String password = "sampath";
		try {
			initializeLogin(userName, password);
			boolean flag = model.validateUser(userName,password);
			System.out.println("Sucess!!");
			assertEquals( "Valid User Details", true, flag );
		} catch (Exception e) {
			fail("Valid user details! But exception thrown! ");
		}
	}
	
	@Test
	public final void testInvalidUserDetails() {
		String userName = "a@uncc.edu";
		String password = "sampath";
		try {
			initializeLogin(userName, password);
			model.validateUser(userName,password);
			fail("Invalid user details! No exception thrown!");
		} catch (Exception e) {
			assertEquals("", e.getMessage());
		}
	}
	
	@Test
	public final void testInvalidPassword() {
		String userName = "skolluru@uncc.edu";
		String password = "xyz";
		try {
			initializeLogin(userName, password);
			model.validateUser(userName,password);
			fail("Invalid user details! No exception thrown!");
		} catch (Exception e) {
			assertEquals("", e.getMessage());
		}
	}

}

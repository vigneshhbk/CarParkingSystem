package src.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.CallableStatement;

import src.com.bean.AdressBean;
import src.com.bean.CreditCard;
import src.com.bean.LoginBean;
import src.com.bean.UserBean;
import src.com.util.DataBaseUtil;


public class UserDAO {
	Connection con=null;

	public boolean validateUser(LoginBean lb){
		try{
			con=DataBaseUtil.getConnectionDAO();
	  System.out.println("CONNECTION ESTABLISHED ");
	  System.out.println(lb.getEmail());
	  System.out.println(lb.getPassword());
	  PreparedStatement ps=con.prepareStatement("select role from users where  email=? and password=?");
	  ps.setString(1, lb.getEmail());
	  ps.setString(2, lb.getPassword());
	  ResultSet rs=ps.executeQuery();
	  if(rs.next()){
		 // System.out.println(rs.getString(1));
		 // System.out.println(rs.getString(2));
		  lb.setRole(rs.getString(1));
		  System.out.println("role id"+rs.getString(1));
		  System.out.println("there is a user in the table");
		  return true;
	  }
		  
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
		
	}
	

	public UserBean GetUserDetails(String userID){
		UserBean user = new UserBean();
		String local_userid = null;
		try{
			con=DataBaseUtil.getConnectionDAO();
			System.out.println("CONNECTION ESTABLISHED ");
			PreparedStatement ps=con.prepareStatement("select * from users where email=?");
			ps.setString(1, userID);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){  
				user.setFname(rs.getString("fname"));
				user.setLname(rs.getString("lname"));
				user.setSsn(rs.getString("ssn"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setUserId(rs.getString("userid"));
				local_userid=rs.getString("userid");
			}
			ps=con.prepareStatement("select creditcard from creditcard where userid=? limit 1");
			ps.setString(1, local_userid);
			rs=ps.executeQuery();
			if(rs.next()){  
				user.setCreditCardNumber(rs.getString("creditcard"));
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return user;		
	}
	
	public  int addUserDetails(UserBean ub, AdressBean ab, CreditCard cc){

		Connection con=null;
		CallableStatement callableStatement = null;
		int userExists=0;
		try{
			String insertStoreProc = "{call USP_SubmitUserRegistration(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
			  con= DataBaseUtil.getConnectionDAO();
			  callableStatement = (CallableStatement) con.prepareCall(insertStoreProc);
			 System.out.println("CONNECTION ESTABLISHED ");
//			 String sql1="insert into users(fname, lname, ssn, email, dob, phone, password)"
//			 		+ " values(?,?,?,?,?,?,?)";
//			 String sql2="insert into address(userid, line1, line2, city, zip, state, country) "
//			 		+ "values(?,?,?,?,?,?,?)";
			 
			 if(con!=null){
				 
				 callableStatement.setString(1,ub.getFname());
				 callableStatement.setString(2,ub.getLname());
				 callableStatement.setString(3,ub.getSsn());
				 callableStatement.setString(4, ub.getEmail());
				 callableStatement.setDate(5,ub.getDob());
				 callableStatement.setString(6,ub.getPhone());
				 callableStatement.setString(7,ub.getPassword());
				 callableStatement.setString(8, ub.getSecurity());
				 callableStatement.setString(9, ub.getAnswer());
				 callableStatement.setString(10,ab.getLine1() );
				 callableStatement.setString(11,ab.getLine2());
				 callableStatement.setString(12,ab.getcity());
				 //callableStatement.setString(6,ab.getState());
				 callableStatement.setLong(13,ab.getZip());
				 callableStatement.setString(14,ab.getState());
				 callableStatement.setString(15,ab.getCountry());
				 //callableStatement.setLong(13,ab.ge);
				 callableStatement.setString(14,ab.getState());
				 callableStatement.setString(15,ab.getCountry());
				 callableStatement.setString(16, String.valueOf(cc.getCreditCard()));
				 callableStatement.setLong(17,cc.getCvv());
				 callableStatement.setLong(18, cc.getExpirationMonth());
				 callableStatement.setLong(19, cc.getExpirationYear());
				 callableStatement.setString(20, cc.getCardName());
				 callableStatement.setString(21, cc.getCardType());
System.out.println(ub.getAnswer());
				 callableStatement.executeUpdate();
				 userExists = callableStatement.getInt(22);
				 return userExists;
				 
//				 System.out.println("connection established");	 
//				 PreparedStatement ps=con.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
//				 ps.setString(1,ub.getFname());
//				 ps.setString(2,ub.getLname());
//				 ps.setString(3,ub.getSsn());
//				 ps.setString(4, ub.getEmail());
//				 ps.setDate(5,ub.getDob());
//				 ps.setString(6,ub.getPhone());
//				 ps.setString(7,ub.getPassword());
//				 boolean flag=ps.execute();
//				 if(!flag){
//					 ResultSet rs = ps.getGeneratedKeys();
//					 int userId = 0;
//					 if(rs.next()) {
//						userId = rs.getInt(1);
//					 }
//
//					 ps=con.prepareStatement(sql2);
//					 ps.setInt(1,userId);
//					 ps.setString(2,ab.getLine1() );
//					 ps.setString(3,ab.getLine2());
//					 ps.setString(4,ab.getcity());
//					 ps.setLong(5,ab.getZip());
//					 ps.setString(6,ab.getState());
//					 ps.setString(7,ab.getCountry());
//					
//					 flag =ps.execute();
//					 return flag;
//					 
//				 }
			 }	
			 
			 
		}
		catch(Exception e){

			e.printStackTrace();
			return 3;
			}
		return userExists;
	}
	
	public boolean validateemail(String email){
		try{
			con=DataBaseUtil.getConnectionDAO();
			System.out.println("CONNECTION ESTABLISHED ");
			PreparedStatement ps=con.prepareStatement("select * from users where  email=?");
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				System.out.println("user in table");
				return true;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	
	public UserBean getsq(String email){
		UserBean user = new UserBean();
		try{
			con=DataBaseUtil.getConnectionDAO();
			System.out.println("CONNECTION ESTABLISHED ");
			PreparedStatement ps=con.prepareStatement("select * from users where  email=?");
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){  
				user.setEmail(email);
				user.setSecurity(rs.getString("Security"));
				
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}	
		return user;
	}
	public boolean validateanswer(String email, String answer, String password){
		try{
			con=DataBaseUtil.getConnectionDAO();
			System.out.println("CONNECTION ESTABLISHED ");
			PreparedStatement ps=con.prepareStatement("select * from users where  email=? and answer=?");
			ps.setString(1, email);
			ps.setString(2, answer);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				System.out.println("user in table");
				PreparedStatement update=con.prepareStatement("update users set password=? where email=?");
				update.setString(1, password);
				update.setString(2, email);
				update.executeUpdate();
				return true;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
}

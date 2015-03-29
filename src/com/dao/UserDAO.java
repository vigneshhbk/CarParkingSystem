package src.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import src.com.bean.AdressBean;
import src.com.bean.UserBean;
import src.com.util.DataBaseUtil;


public class UserDAO {
	Connection con=null;

	public boolean validateUser(String email,String pwd){
		try{
			con=DataBaseUtil.getConnectionDAO();
	  System.out.println("CONNECTION ESTABLISHED ");
	  System.out.println(email);
	  System.out.println(pwd);
	  PreparedStatement ps=con.prepareStatement("select * from users where  email=? and password=?");
	  ps.setString(1, email);
	  ps.setString(2, pwd);
	  ResultSet rs=ps.executeQuery();
	  if(rs.next()){
		 // System.out.println(rs.getString(1));
		 // System.out.println(rs.getString(2));
		  
		  System.out.println("there is a user in the table");
		  return true;
	  }
		  
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
		
	}
	
	public  boolean addUserDetails(UserBean ub,AdressBean ab){
		Connection con=null;
		try{
			
			  con= DataBaseUtil.getConnectionDAO();
			  
			 System.out.println("CONNECTION ESTABLISHED ");
			 String sql1="insert into users(fname, lname, ssn, email, dob, phone, password)"
			 		+ " values(?,?,?,?,?,?,?)";
			 String sql2="insert into address(userid, line1, line2, city, zip, state, country) "
			 		+ "values(?,?,?,?,?,?,?)";
			 if(con!=null){
				 System.out.println("connection established");	 
				 PreparedStatement ps=con.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
				 ps.setString(1,ub.getFname());
				 ps.setString(2,ub.getLname());
				 ps.setString(3,ub.getSsn());
				 ps.setString(4, ub.getEmail());
				 ps.setDate(5,ub.getDob());
				 ps.setString(6,ub.getPhone());
				 ps.setString(7,ub.getPassword());
				 boolean flag=ps.execute();
				 if(!flag){
					 ResultSet rs = ps.getGeneratedKeys();
					 int userId = 0;
					 if(rs.next()) {
						userId = rs.getInt(1);
					 }

					 ps=con.prepareStatement(sql2);
					 ps.setInt(1,userId);
					 ps.setString(2,ab.getLine1() );
					 ps.setString(3,ab.getLine2());
					 ps.setString(4,ab.getcity());
					 ps.setLong(5,ab.getZip());
					 ps.setString(6,ab.getState());
					 ps.setString(7,ab.getCountry());
					
					 flag =ps.execute();
					 return flag;
					 
				 }
			 }
			 
			 
		}
		catch(Exception e){
			e.printStackTrace();
			}
		return false;
		
	}
	
	
	
	
}

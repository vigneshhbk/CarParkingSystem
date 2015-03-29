package src.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	
	public  String addUserDetails(UserBean ub){
		String userId=null;
		String password=null;
		String sql = "insert into FQ_User values(?,?,?,?,?,?,?,?,?,?,?)";
		String sql1 = "select 'u'||bseq.nextval from dual";
		String sql2 = "insert into FQ_Login values(?,?,'user','active')";
		try {
			con = DataBaseUtil.getConnectionDAO();
			PreparedStatement pstmt = con.prepareStatement(sql1);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				userId=rs.getString(1);	
			}
			if(con!=null)
				System.out.println("connection established");
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,userId);
				pstmt.setString(2,ub.getGender());
				pstmt.setDate(3,java.sql.Date.valueOf(ub.getDob()));
				pstmt.setString(4,ub.getAddress());
				pstmt.setInt(5,ub.getAge());
				pstmt.setString(6,ub.getLicenseStatus());
				pstmt.setString(7,ub.getSsn());
				
				pstmt.setString(8,ub.getOccupation());
				pstmt.setInt(9,ub.getAnnualIncome());
				pstmt.setString(10,ub.getEducation());
				pstmt.setString(11,ub.getName());
				int i =pstmt.executeUpdate();
				if(i==1){
					password=passwordGenerator(ub.getName());
					pstmt = con.prepareStatement(sql2);
					pstmt.setString(1,userId);
					pstmt.setString(2,password);
					pstmt.executeUpdate();			 
					return userId+"@"+password;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				con.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	
	
	
}

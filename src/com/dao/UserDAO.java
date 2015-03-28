package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.DataBaseUtil;


public class UserDAO {
	
	public String validateUser(String userid,String pwd){
		Connection con=null;
		try{
			con=DataBaseUtil.getConnectionDAO();
	  System.out.println("CONNECTION ESTABLISHED ");
	  System.out.println(userid);
	  System.out.println(pwd);
	  PreparedStatement ps=con.prepareStatement("select role,status from FQ_LOGIN where  userid=? and password=?");
	  ps.setString(1, userid);
	  ps.setString(2, pwd);
	  ResultSet rs=ps.executeQuery();
	  if(rs.next()){
		  System.out.println(rs.getString(1));
		  System.out.println(rs.getString(2));
		  if(rs.getString(1).equalsIgnoreCase("user")){
			  if(rs.getString(2).equalsIgnoreCase("active")){
	   					return "active";
			  }else{
				  return "inactive";
			  }
		  }
		  else{
	  			return "emp";
	  		}
	  }
	}catch(Exception e){
		e.printStackTrace();
	}
	finally{
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	 return "null";
	}
	
}

package src.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.CallableStatement;

import src.com.bean.BookingBean;
import src.com.util.DataBaseUtil;


public class BookingDAO {
	Connection con=null;

	
	public  boolean InsertBooking(BookingBean bb){
		Connection con=null;
		CallableStatement callableStatement = null;
		try{
			String insertStoreProc = "{call USP_BookingRegistration(?,?,?,?,?,?,?)}";
			  con= DataBaseUtil.getConnectionDAO();
			  callableStatement = (CallableStatement) con.prepareCall(insertStoreProc);
			 System.out.println("CONNECTION ESTABLISHED ");
//			 String sql1="insert into users(fname, lname, ssn, email, dob, phone, password)"
//			 		+ " values(?,?,?,?,?,?,?)";
//			 String sql2="insert into address(userid, line1, line2, city, zip, state, country) "
//			 		+ "values(?,?,?,?,?,?,?)";
			 
			 if(con!=null){
				 
				 callableStatement.setString(1,bb.getlotid());
				 callableStatement.setString(2,bb.getslotid());
				 callableStatement.setString(3,bb.getindate());
				 callableStatement.setString(4,bb.getintime());
				 callableStatement.setString(5,bb.getoutdate());
				 callableStatement.setString(6,bb.getouttime());
				 callableStatement.setString(7,bb.getuserid());
				 
				 callableStatement.executeUpdate();
				 
				 
				 return true;
				 
			 }
			 
		}
		catch(Exception e){

			e.printStackTrace();
			return false;
			}
		return false;

		
	}

	
	
	public String Checkslot(BookingBean bb){
		Connection con=null;
		
		System.out.println(bb.getlotid());
		System.out.println(bb.getindate());
		System.out.println(bb.getoutdate());
		System.out.println(bb.getintime());
		System.out.println(bb.getouttime());
		
		try{
			con=DataBaseUtil.getConnectionDAO();
			  System.out.println("CONNECTION ESTABLISHED ");
			PreparedStatement ps=con.prepareStatement(
"SELECT SlotID FROM slot WHERE lotid = ? AND slotid NOT IN (SELECT SlotID FROM booking WHERE From_Date = ? AND To_Date = ? AND LotID = ? AND (? BETWEEN From_Time AND To_Time OR ? BETWEEN From_Time AND To_Time OR From_Time BETWEEN ? AND ? OR To_Time BETWEEN ? AND ?)) limit 1"
					);
			  
			ps.setString(1, bb.getlotid());
			ps.setString(2, bb.getindate());
			ps.setString(3, bb.getoutdate());
			
			ps.setString(4, bb.getlotid());
			ps.setString(5, bb.getintime());
			ps.setString(6, bb.getouttime());
			
			ps.setString(7, bb.getintime());
			ps.setString(8, bb.getouttime());
			ps.setString(9, bb.getintime());
			ps.setString(10, bb.getouttime());
			
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()){
				  System.out.println("there is a slot available in the table");
				  return rs.getString("SlotID");
			}
		}
		catch(Exception e){

			e.printStackTrace();
			return null;
			}
		return null;

		
	}
	
	public ArrayList<String> GetBookingID(BookingBean bb){
		Connection con=null;
		ArrayList<String> values = new ArrayList<String>();
		
		
		System.out.println(bb.getlotid());
		System.out.println(bb.getindate());
		System.out.println(bb.getoutdate());
		System.out.println(bb.getintime());
		System.out.println(bb.getouttime());
		
		try{
			con=DataBaseUtil.getConnectionDAO();
			  System.out.println("CONNECTION ESTABLISHED ");
//			  SET TempUserId = (SELECT BookingID FROM booking WHERE lotid = LID AND slotid = SID AND 
//						From_Date = FDate AND To_Date = TDate AND From_Time = FTime AND To_Time = TTime AND UserID = UsrID);
//			  System.out.println("Successs Insertion of Booking");
			  PreparedStatement ps=con.prepareStatement(
					"SELECT BookingID,cost FROM booking WHERE lotid = ? AND slotid = ? AND "
					+ "From_Date = ? AND To_Date = ? AND "
					+ "From_Time = ? AND To_Time = ? AND UserID = ?"
					);
			  
			ps.setString(1, bb.getlotid());
			ps.setString(2, bb.getslotid());
			ps.setString(3, bb.getindate());
			ps.setString(4, bb.getoutdate());
			ps.setString(5, bb.getintime());
			ps.setString(6, bb.getouttime());			
			ps.setString(7, bb.getuserid());
			
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()){
				  String bid = rs.getString("BookingID");
					System.out.println("This is Booking ID- "+bid);
				  values.add(bid);
				  values.add(rs.getString("cost"));
			
				  ps=con.prepareStatement(
							"SELECT Name FROM lot where LotID = ?"
							);
					  
					ps.setString(1, bb.getlotid());
					rs=ps.executeQuery();
					
					if(rs.next()){
						values.add(rs.getString("Name"));
						return values;
					}
			}
			
		}
		catch(Exception e){

			e.printStackTrace();
			return null;
			}
		return null;

		
	}	
}

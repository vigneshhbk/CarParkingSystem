package src.com.util;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;

import java.sql.*;

public class DataBaseUtil {
	
	public static String dataBaseType = "1";
		public static Connection getConnectionDAO() throws SQLException{
			Connection con=null;
			try {
				
				
				Class.forName("com.mysql.jdbc.Driver"); 
				if(dataBaseType.equalsIgnoreCase("0"))
				{
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ssdidummy","root","root");
				}
				else
				{
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ssdi","root","root");
				}
				System.out.println("database type is" + con.toString());
          //	con = DriverManager.getConnection("jdbc:oracle:thin:@172.25.192.71:1521:javadb","h97orauser1d","tcshyd");
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return con;
		}
}
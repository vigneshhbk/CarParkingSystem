package src.com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;

public class DataBaseUtil {
		public static Connection getConnectionDAO() throws SQLException{
			Connection con=null;
			try {
				Class.forName("com.mysql.jdbc.Driver");  
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ssdi","root","root");
          //	con = DriverManager.getConnection("jdbc:oracle:thin:@172.25.192.71:1521:javadb","h97orauser1d","tcshyd");
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return con;
		}
}

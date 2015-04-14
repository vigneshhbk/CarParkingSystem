package junittest;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Test;

import src.com.bean.BookingBean;
import src.com.dao.BookingDAO;

public class TestBooking {
	BookingBean bb; 
	BookingDAO bd; 

	
	
     @Test
     public void TestCheckslot() {
//    	 Checkslot(BookingBean bb) lotid, indate, intime, outdate, outtime
    	 bd = new BookingDAO();
    	 bb = new BookingBean();
     	
    	 try{
    		 
    		bb.setlotid("11");
 			bb.setindate("2015-03-03");
 			bb.setoutdate("2015-03-03");
 			bb.setintime("03:12:00");
            bb.setouttime("04:12:00");    		 
    		 
    		 String status = bd.Checkslot(bb);
    		 System.out.println("the status is "+ status);
    		 assertEquals("slot available",true, !status.isEmpty());
    	 }
    	 catch(Exception e){
    		 fail("failed to checkslot properly");
    	 }
 
     }
     
    @Test
    public void TestGetBookingId(){
    	bb = new BookingBean();
    	bd = new BookingDAO();
    	
    	try{
    	
    		ArrayList<String> al = new ArrayList<String>();
    		
    	bb.setlotid("1");
    	bb.setindate("2015-03-15");
    	bb.setoutdate("2015-03-15");
    	bb.setintime("03:12:00");
    	bb.setouttime("04:12:00");
    	bb.setslotid("15");
    	
    	al= bd.GetBookingID(bb);
    	
    	assertEquals("Got bookingId",true,al.isEmpty() );
    	
    	}
    	catch(Exception e){
    		fail("failed to get bookingId ");
    	}
    	
    }
    
   
     
   
    @Test
	public void testinsertbooking() {
		try{

		bb.setintime("03:12:00");
		bb.setlotid("11");
		bb.setoutdate("2015-03-15");
		bb.setindate("2015-03-15");
		bb.setouttime("04:12:00");
        bb.setslotid("15");
        bb.setuserid("5");
		
		boolean flag = bd.InsertBooking(bb);
		System.out.println("inserted data");
	    assertEquals("inserted data",true,flag );
		}
		catch(Exception e){
		
		fail("failed to insert data");
	}
	}

}

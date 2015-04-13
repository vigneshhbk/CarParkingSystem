package junittest;

import static org.junit.Assert.*;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;

import org.junit.Test;

import src.com.bean.BuildingBean;
import src.com.bean.LotBean;
import src.com.dao.BuildingsDAO;

public class TestBuildings {

	@Test
	public void testgetBuildings() {
		BuildingsDAO bdao = new BuildingsDAO();
		ArrayList<BuildingBean> buildings = new ArrayList<BuildingBean>();
		 buildings = bdao.getBuildings();
 	try{
	  		assertEquals( "Setting Building Bean", true, !buildings.isEmpty() );
		 }catch(Exception e){
		fail("Not yet implemented");
	}
	}

	
	@Test
	public void getLots(){
       
		Date fromDate = java.sql.Date.valueOf("2015-06-02");
		Date toDate   =java.sql.Date.valueOf("2015-06-03");
		Time fromTime =java.sql.Time.valueOf("03:00:00");
		Time toTime =java.sql.Time.valueOf("04:00:00");
		int buildingId =11;
		BuildingsDAO bdao=new BuildingsDAO();
		ArrayList<LotBean> lotbean=new ArrayList<LotBean>();
		lotbean = bdao.getLots(fromDate, toDate, fromTime, toTime, buildingId);
		try{
			assertEquals("Fetching Lots", true,!lotbean.isEmpty());
		}
		catch(Exception e){
			fail(" Not implemented properly");
		}
		
		
	}
	
	@Test
	public void invalidlotid(){
		
		Date fromDate = java.sql.Date.valueOf("2015-06-02");
		Date toDate   =java.sql.Date.valueOf("2015-06-03");
		Time fromTime =java.sql.Time.valueOf("03:00:00");
		Time toTime =java.sql.Time.valueOf("04:00:00");
		int buildingId =111;  // invalid lot id
		BuildingsDAO bdao=new BuildingsDAO();
		ArrayList<LotBean> lotbean=new ArrayList<LotBean>();
		lotbean = bdao.getLots(fromDate, toDate, fromTime, toTime, buildingId);
		try{
			assertEquals("Fetching Lots with invalid lotid", true,lotbean.isEmpty());
		}
		catch(Exception e){
			fail(" Not implemented properly");
		}	
		
	}
	
	
}

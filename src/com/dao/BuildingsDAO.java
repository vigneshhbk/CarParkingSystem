package src.com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;

import src.com.bean.BuildingBean;
import src.com.bean.LotBean;
import src.com.util.DataBaseUtil;

import com.mysql.jdbc.CallableStatement;

public class BuildingsDAO {
	Connection con=null;
	public ArrayList<BuildingBean> getBuildings(){
		ArrayList<BuildingBean> buildings = new ArrayList<BuildingBean>();
		try{
			 con=DataBaseUtil.getConnectionDAO();
			 System.out.println("CONNECTION ESTABLISHED ");
			 PreparedStatement ps=con.prepareStatement("select * from Buildings");
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()){
				 BuildingBean building = new BuildingBean();
				 building.setBuildingId(rs.getInt("buildingid"));
				 building.setDescription(rs.getString("desc"));
				 building.setName(rs.getString("name"));
				 building.setLatitude(rs.getDouble("latitude"));
				 building.setLongitude(rs.getDouble("longitude"));
				 buildings.add(building);
			 }
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return buildings;
	}
	
	public ArrayList<LotBean> getLots(Date fromDate, Date toDate, Time fromTime, Time toTime, int buildingId){
		ArrayList<LotBean> lots = new ArrayList<LotBean>();
		CallableStatement callableStatement = null;
		try{
			String getLotsProcedure = "{call GetLots(?,?,?,?,?)}";
			con=DataBaseUtil.getConnectionDAO();
			callableStatement = (CallableStatement) con.prepareCall(getLotsProcedure);
			if(con!=null){
				callableStatement.setDate(1, fromDate);
				callableStatement.setDate(2, toDate);
				callableStatement.setTime(3, fromTime);
				callableStatement.setTime(4, toTime);
				callableStatement.setInt(5, buildingId);
				callableStatement.execute();
			}
			System.out.println("CONNECTION ESTABLISHED ");
			ResultSet rs = callableStatement.getResultSet();
			while(rs.next()){
				LotBean lot = new LotBean();
				lot.setBuildingId(rs.getInt("BuildingID"));
				lot.setLotId(rs.getInt("LotID"));
				lot.setName(rs.getString("Name"));
				lot.setLatitude(rs.getDouble("Latitude"));
				lot.setLongitude(rs.getDouble("Longitude"));
				lot.setSlotID(rs.getInt("SlotID"));
				lots.add(lot);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return lots;
	}
}

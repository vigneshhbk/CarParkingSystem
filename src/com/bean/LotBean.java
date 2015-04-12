package src.com.bean;

public class LotBean {
	private int lotId;
	private int buildingId;
	private String name;
	private double latitude;
	private double longitude;
	private int slotID;
	
	public int getLotId() {
		return lotId;
	}
	
	public void setLotId(int lotId) {
		this.lotId = lotId;
	}
	
	public int getBuildingId() {
		return buildingId;
	}
	
	public void setBuildingId(int buildingId) {
		this.buildingId = buildingId;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public double getLatitude() {
		return latitude;
	}
	
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	
	public double getLongitude() {
		return longitude;
	}
	
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	
	public int getSlotID() {
		return slotID;
	}
	
	public void setSlotID(int slotID) {
		this.slotID = slotID;
	}
}

package src.com.bean;

public class BuildingBean {
	private int buildingId;
	private String name;
	private String description;
	private double latitude;
	private double longitude;
	
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
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
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
}

package src.com.bean;

import java.sql.Date;
import java.sql.Time;

public class BookingBean {
	private int bookingId;
	private int lotId;
	private int slotId;
	private	Date fromDate;
	private Time fromTime;
	private Date toDate;
	private Time toTime;
	private int userId;
	
	public int getBookingId() {
		return bookingId;
	}
	
	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}
	
	public int getLotId() {
		return lotId;
	}
	
	public void setLotId(int lotId) {
		this.lotId = lotId;
	}
	
	public int getSlotId() {
		return slotId;
	}
	
	public void setSlotId(int slotId) {
		this.slotId = slotId;
	}
	
	public Date getFromDate() {
		return fromDate;
	}
	
	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	
	public Time getFromTime() {
		return fromTime;
	}
	
	public void setFromTime(Time fromTime) {
		this.fromTime = fromTime;
	}
	
	public Date getToDate() {
		return toDate;
	}
	
	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
	
	public Time getToTime() {
		return toTime;
	}
	
	public void setToTime(Time toTime) {
		this.toTime = toTime;
	}
	
	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
}

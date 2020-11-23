package com.softdoc.softdoc;

import java.util.List;

public class Pickup_details {
	
	private List<Todaypickup> today_pickup;
	private List<Previouspickup> tomorrow_pickup;
	
	
	 Pickup_details()
	{
	
	
	}
	Pickup_details(List<Todaypickup> today_pickup,List<Previouspickup> tomorrow_pickup)
	{
		this.today_pickup=today_pickup;
		this.tomorrow_pickup=tomorrow_pickup;
	}
	
	
	public List<Todaypickup> getToday_pickup() {
		return today_pickup;
	}
	public void setToday_pickup(List<Todaypickup> today_pickup) {
		this.today_pickup = today_pickup;
	}
	public List<Previouspickup> getTomorrow_pickup() {
		return tomorrow_pickup;
	}
	public void setTomorrow_pickup(List<Previouspickup> tomorrow_pickup) {
		this.tomorrow_pickup = tomorrow_pickup;
	}
	
	
    

}

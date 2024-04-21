package com.bean;

/**
 * Booking class for database model
 * 
 * @author Ganesh Shingre
 * @param bookingId
 * @param userId
 * @param recName
 * @param recAddress
 * @param recPin
 * @param recMobileNumber
 * @param parWeight
 * @param parContents
 * @param parDeliveryType
 * @param parPackingPref
 * @param parPickupTime
 * @param parDropoffTime
 * @param parServiceCost
 * @param parPaymentTime
 * @param parStatus
 */
public class Booking {
	private int bookingId;
	private String userId;
	private String recName;
	private String recAddress;
	private int recPin;
	private String recMobileNumber;
	private int parWeight;
	private String parContents;
	private String parDeliveryType;
	private String parPackingPref;
	private String parPickupTime;
	private String parDropoffTime;
	private int parServiceCost;
	private String parPaymentTime;
	private String parStatus;

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRecName() {
		return recName;
	}

	public void setRecName(String recName) {
		this.recName = recName;
	}

	public String getRecAddress() {
		return recAddress;
	}

	public void setRecAddress(String recAddress) {
		this.recAddress = recAddress;
	}

	public int getRecPin() {
		return recPin;
	}

	public void setRecPin(int recPin) {
		this.recPin = recPin;
	}

	public String getRecMobileNumber() {
		return recMobileNumber;
	}

	public void setRecMobileNumber(String recMobileNumber) {
		this.recMobileNumber = recMobileNumber;
	}

	public int getParWeight() {
		return parWeight;
	}

	public void setParWeight(int parWeight) {
		this.parWeight = parWeight;
	}

	public String getParContents() {
		return parContents;
	}

	public void setParContents(String parContents) {
		this.parContents = parContents;
	}

	public String getParDeliveryType() {
		return parDeliveryType;
	}

	public void setParDeliveryType(String parDeliveryType) {
		this.parDeliveryType = parDeliveryType;
	}

	public String getParPackingPref() {
		return parPackingPref;
	}

	public void setParPackingPref(String parPackingPref) {
		this.parPackingPref = parPackingPref;
	}

	public String getParPickupTime() {
		return parPickupTime;
	}

	public void setParPickupTime(String parPickupTime) {
		this.parPickupTime = parPickupTime;
	}

	public String getParDropoffTime() {
		return parDropoffTime;
	}

	public void setParDropoffTime(String parDropoffTime) {
		this.parDropoffTime = parDropoffTime;
	}

	public int getParServiceCost() {
		return parServiceCost;
	}

	public void setParServiceCost(int parServiceCost) {
		this.parServiceCost = parServiceCost;
	}

	public String getParPaymentTime() {
		return parPaymentTime;
	}

	public void setParPaymentTime(String parPaymentTime) {
		this.parPaymentTime = parPaymentTime;
	}

	public String getParStatus() {
		return parStatus;
	}

	public void setParStatus(String parStatus) {
		this.parStatus = parStatus;
	}

	public Booking(int bookingId, String userId, String recName, String recAddress, int recPin, String recMobileNumber,
			int parWeight, String parContents, String parDeliveryType, String parPackingPref, String parPickupTime,
			String parDropoffTime, int parServiceCost, String parPaymentTime, String parStatus) {
		super();
		this.bookingId = bookingId;
		this.userId = userId;
		this.recName = recName;
		this.recAddress = recAddress;
		this.recPin = recPin;
		this.recMobileNumber = recMobileNumber;
		this.parWeight = parWeight;
		this.parContents = parContents;
		this.parDeliveryType = parDeliveryType;
		this.parPackingPref = parPackingPref;
		this.parPickupTime = parPickupTime;
		this.parDropoffTime = parDropoffTime;
		this.parServiceCost = parServiceCost;
		this.parPaymentTime = parPaymentTime;
		this.parStatus = parStatus;
	}

}

package com.bean;

/**
 * User class for database model
 * 
 * @author Ganesh Shingre
 * @param customerName
 * @param email
 * @param mobileNumber
 * @param address
 * @param userId
 * @param password
 * @param preferences
 * @param role
 */
public class User {
	private String customerName;
	private String email;
	private String mobileNumber;
	private String address;
	private String userId;
	private String password;
	private String preferences;
	private String role;

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPreferences() {
		return preferences;
	}

	public void setPreferences(String preferences) {
		this.preferences = preferences;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public User(String customerName, String email, String mobileNumber, String address, String userId, String password,
			String preferences, String role) {
		super();
		this.customerName = customerName;
		this.email = email;
		this.mobileNumber = mobileNumber;
		this.address = address;
		this.userId = userId;
		this.password = password;
		this.preferences = preferences;
		this.role = role;
	}

}

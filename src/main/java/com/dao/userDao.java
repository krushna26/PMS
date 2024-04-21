package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.util.*;
import com.bean.*;

public class userDao {
	static Connection con = null;
	static PreparedStatement ps = null;
	static Connection con1 = null;
	static PreparedStatement ps1 = null;

	public User Login(String username, String password) throws SQLException, ClassNotFoundException {
		con = util.createConnection();
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("SELECT * FROM USER_GR06 WHERE userId=? and password=?");

			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					String customerName = rs.getString("customerName");
					String email = rs.getString("email");
					String mobileNumber = rs.getString("mobileNumber");
					String address = rs.getString("address");
					String userId = rs.getString("userId");
					String pass = rs.getString("password");
					String preferences = rs.getString("preferences");
					String role = rs.getString("role");
					User u = new User(customerName, email, mobileNumber, address, userId, pass, preferences, role);

					return u;
				}

			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return null;
	}

	// register
	public int Register(User u) throws ClassNotFoundException, SQLException {
		con = util.createConnection();
		ResultSet rs = null;
		int output = 0;
		System.out.println("insde register method");
		try {
			ps = con.prepareStatement("INSERT INTO USER_GR06 VALUES(?,?,?,?,?,?,?,?)");

			ps.setString(1, u.getCustomerName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getMobileNumber());
			ps.setString(4, u.getAddress());
			ps.setString(5, u.getUserId());
			ps.setString(6, u.getPassword());
			ps.setString(7, u.getPreferences());
			ps.setString(8, u.getRole());
			output = ps.executeUpdate();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		util.closeConnection(con, ps, rs);
		return output;

	}

	// Tracking Page - Customer
	public Booking tracking(int FbookingId, String FuserId) throws SQLException, ClassNotFoundException {

		con = util.createConnection();
		con1 = util.createConnection();
		ResultSet rs = null;
		ResultSet rs1 = null;

		try {
			ps = con.prepareStatement("SELECT * FROM BOOKING_GR06 WHERE bookingId = ? AND userId = ?");

			ps.setInt(1, FbookingId);
			ps.setString(2, FuserId);
			rs = ps.executeQuery();

			System.out.println("--DAoDao--" + FuserId + "--DAoDao--" + FbookingId);

			String sql = "SELECT customerName, address FROM USER_GR06 WHERE userId = ?";
			ps1 = con.prepareStatement(sql);
			ps1.setString(1, FuserId);
			rs1 = ps1.executeQuery();

			if (rs != null && rs1 != null) {
				while (rs.next() && rs1.next()) {
					int bookingId = rs.getInt("bookingId");
					String userId = rs.getString("userId");
					String recName = rs.getString("recName");
					String recAddress = rs.getString("recAddress");
					int recPin = rs.getInt("recPin");
					String recMobileNumber = rs.getString("recMobileNumber");

					int parWeight = rs.getInt("parWeight");

					String parContents = rs.getString("parContents");
					String parDeliveryType = rs.getString("parDeliveryType");
					String parPackingPref = rs.getString("parPackingPref");
					String parPickupTime = rs.getString("parPickupTime");
					String parDropoffTime = rs.getString("parDropoffTime");
					int parServiceCost = rs.getInt("parServiceCost");

					String parPaymentTime = rs.getString("parPaymentTime");
					String parStatus = rs.getString("parStatus");

					Booking bookingDetails = new Booking(bookingId, userId, recName, recAddress, recPin,
							recMobileNumber, parWeight, parContents, parDeliveryType, parPackingPref, parPickupTime,
							parDropoffTime, parServiceCost, parPaymentTime, parStatus);

					return bookingDetails;
				}

			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		util.closeConnection(con, ps, rs);

		return null;
	}

	// customer previous booking
	public ArrayList<Booking> previousBooking(String FuserId) throws SQLException, ClassNotFoundException {
		con = util.createConnection();
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("SELECT * FROM BOOKING_GR06 WHERE userId = ? order by parPaymentTime DESC");

			ps.setString(1, FuserId);
			rs = ps.executeQuery();
			ArrayList<Booking> bookingList = new ArrayList<Booking>();
			if (rs != null) {
				while (rs.next()) {
					int bookingId = rs.getInt("bookingId");
					String userId = rs.getString("userId");
					String recName = rs.getString("recName");
					String recAddress = rs.getString("recAddress");
					int recPin = rs.getInt("recPin");
					String recMobileNumber = rs.getString("recMobileNumber");

					int parWeight = rs.getInt("parWeight");

					String parContents = rs.getString("parContents");
					String parDeliveryType = rs.getString("parDeliveryType");
					String parPackingPref = rs.getString("parPackingPref");
					String parPickupTime = rs.getString("parPickupTime");
					String parDropoffTime = rs.getString("parDropoffTime");
					int parServiceCost = rs.getInt("parServiceCost");

					String parPaymentTime = rs.getString("parPaymentTime");
					String parStatus = rs.getString("parStatus");

					Booking bookingDetails = new Booking(bookingId, userId, recName, recAddress, recPin,
							recMobileNumber, parWeight, parContents, parDeliveryType, parPackingPref, parPickupTime,
							parDropoffTime, parServiceCost, parPaymentTime, parStatus);

					bookingList.add(bookingDetails);

				}
				return bookingList;

			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		util.closeConnection(con, ps, rs);

		return null;
	}

	public Booking officerTracking(int FbookingId) throws SQLException, ClassNotFoundException {

		con = util.createConnection();
		con1 = util.createConnection();
		ResultSet rs = null;
		ResultSet rs1 = null;

		try {
			ps = con.prepareStatement("SELECT * FROM BOOKING_GR06 WHERE bookingId = ?");

			ps.setInt(1, FbookingId);

			rs = ps.executeQuery();

			System.out.println("--DAoDao---DAoDao--" + FbookingId);

			if (rs != null) {
				while (rs.next()) {
					int bookingId = rs.getInt("bookingId");
					String userId = rs.getString("userId");
					String recName = rs.getString("recName");
					String recAddress = rs.getString("recAddress");
					int recPin = rs.getInt("recPin");
					String recMobileNumber = rs.getString("recMobileNumber");

					int parWeight = rs.getInt("parWeight");

					String parContents = rs.getString("parContents");
					String parDeliveryType = rs.getString("parDeliveryType");
					String parPackingPref = rs.getString("parPackingPref");
					String parPickupTime = rs.getString("parPickupTime");
					String parDropoffTime = rs.getString("parDropoffTime");
					int parServiceCost = rs.getInt("parServiceCost");

					String parPaymentTime = rs.getString("parPaymentTime");
					String parStatus = rs.getString("parStatus");

					Booking bookingDetails = new Booking(bookingId, userId, recName, recAddress, recPin,
							recMobileNumber, parWeight, parContents, parDeliveryType, parPackingPref, parPickupTime,
							parDropoffTime, parServiceCost, parPaymentTime, parStatus);

					return bookingDetails;
				}

			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		util.closeConnection(con, ps, rs);

		return null;
	}

	public User userDetails(String FuserId) throws SQLException, ClassNotFoundException {

		con = util.createConnection();
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("SELECT * FROM USER_GR06 WHERE userId = ?");

			ps.setString(1, FuserId);

			rs = ps.executeQuery();

			System.out.println("--DAoDao---DAoDao--" + FuserId);

			if (rs != null) {
				while (rs.next()) {
					String userId = rs.getString("userId");
					String customerName = rs.getString("customerName");
					String address = rs.getString("address");
					String mobileNumber = rs.getString("mobileNumber");
					String email = rs.getString("email");
					String password = rs.getString("password");
					String preferences = rs.getString("preferences");
					String role = rs.getString("role");

					User user = new User(customerName, email, mobileNumber, address, userId, password, preferences,
							role);

					return user;
				}

			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		util.closeConnection(con, ps, rs);

		return null;
	}

	public ArrayList<Booking> officerBookingHistory(String FuserId, String parPaymentDate)
			throws SQLException, ClassNotFoundException, ParseException {
		con = util.createConnection();
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("SELECT * FROM BOOKING_GR06 WHERE userId = ? order by parPaymentTime DESC");

			ps.setString(1, FuserId);
			rs = ps.executeQuery();

			ArrayList<Booking> bookingList = new ArrayList<Booking>();

			if (rs != null) {
				while (rs.next()) {
					int bookingId = rs.getInt("bookingId");
					String userId = rs.getString("userId");
					String recName = rs.getString("recName");
					String recAddress = rs.getString("recAddress");
					int recPin = rs.getInt("recPin");
					String recMobileNumber = rs.getString("recMobileNumber");

					int parWeight = rs.getInt("parWeight");

					String parContents = rs.getString("parContents");
					String parDeliveryType = rs.getString("parDeliveryType");
					String parPackingPref = rs.getString("parPackingPref");
					String parPickupTime = rs.getString("parPickupTime");
					String parDropoffTime = rs.getString("parDropoffTime");
					int parServiceCost = rs.getInt("parServiceCost");

					String parPaymentTime = rs.getString("parPaymentTime");
					String parStatus = rs.getString("parStatus");
					Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(parPaymentTime);
					String newDate = new SimpleDateFormat("yyyy-MM-dd").format(date);
					System.out.println(newDate);
					if (newDate.equals(parPaymentDate)) {
						Booking bookingDetails = new Booking(bookingId, userId, recName, recAddress, recPin,
								recMobileNumber, parWeight, parContents, parDeliveryType, parPackingPref, parPickupTime,
								parDropoffTime, parServiceCost, parPaymentTime, parStatus);
						bookingList.add(bookingDetails);
					}

				}
				return bookingList;

			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		util.closeConnection(con, ps, rs);

		return null;
	}

	public Booking pickDropStatusUpdates(int updationId) throws SQLException, ClassNotFoundException {
		con = util.createConnection();
		ResultSet rs = null;

		try {

			String query = "SELECT * FROM BOOKING_GR06 WHERE bookingId=?";
			ps = con.prepareStatement(query);

			ps.setInt(1, updationId);
			rs = ps.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					int bookingId = rs.getInt("bookingId");
					String userId = rs.getString("userId");
					String recName = rs.getString("recName");
					String recAddress = rs.getString("recAddress");
					int recPin = rs.getInt("recPin");
					String recMobileNumber = rs.getString("recMobileNumber");

					int parWeight = rs.getInt("parWeight");

					String parContents = rs.getString("parContents");
					String parDeliveryType = rs.getString("parDeliveryType");
					String parPackingPref = rs.getString("parPackingPref");
					String parPickupTime = rs.getString("parPickupTime");
					String parDropoffTime = rs.getString("parDropoffTime");
					int parServiceCost = rs.getInt("parServiceCost");

					String parPaymentTime = rs.getString("parPaymentTime");
					String parStatus = rs.getString("parStatus");

					Booking bookingDetails = new Booking(bookingId, userId, recName, recAddress, recPin,
							recMobileNumber, parWeight, parContents, parDeliveryType, parPackingPref, parPickupTime,
							parDropoffTime, parServiceCost, parPaymentTime, parStatus);

					return bookingDetails;
				}
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			util.closeConnection(con, ps, rs);
		}
		return null;
	}

}

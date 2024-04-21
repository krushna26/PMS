package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.User;
import com.util.util;
import com.bean.Booking;

public class dao {
	Connection con = null;
	PreparedStatement ps = null;
	public int bookingService(Booking b) throws ClassNotFoundException, SQLException {
		con = util.createConnection();
		PreparedStatement ps = con.prepareStatement(
				"INSERT INTO BOOKING_GR06 ( userId, recName, recAddress, recPin, recMobileNumber, parWeight, parContents, parDeliveryType, parPackingPref, parPickupTime, parDropoffTime, parServiceCost, parPaymentTime, parStatus,bookingId) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1, b.getUserId());
		ps.setString(2, b.getRecName());
		ps.setString(3, b.getRecAddress());
		ps.setInt(4, b.getRecPin());
		ps.setString(5, b.getRecMobileNumber());
		ps.setInt(6, b.getParWeight());
		ps.setString(7, b.getParContents());
		ps.setString(8, b.getParDeliveryType());
		ps.setString(9, b.getParPackingPref());
		ps.setString(10, b.getParPickupTime());
		ps.setString(11, b.getParDropoffTime());
		ps.setInt(12, b.getParServiceCost());
		ps.setString(13, b.getParPaymentTime());
		ps.setString(14, b.getParStatus());
		ps.setInt(15, b.getBookingId());
		int val = ps.executeUpdate();
		util.closeConnection(con, ps, null);
		return val;
	}

	public int updateTime(String pickUp, String dropOff, int bookingId) throws SQLException, ClassNotFoundException {
		con = util.createConnection();
		ResultSet rs = null;
		int val = 0;
		try {
			ps = con.prepareStatement("UPDATE BOOKING_GR06 SET parPickupTime=?, parDropoffTime=? WHERE bookingId=?");
			ps.setString(1, pickUp);
			ps.setString(2, dropOff);
			ps.setInt(3, bookingId);
			val = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		util.closeConnection(con, ps, rs);
		return 0;
	}

	public int updateStatus(String status, int bookingId) throws SQLException, ClassNotFoundException {
		con = util.createConnection();
		ResultSet rs = null;
		int val = 0;
		try {
			ps = con.prepareStatement("UPDATE BOOKING_GR06 SET parStatus=? WHERE bookingId=?");

			ps.setString(1, status);
			ps.setInt(2, bookingId);
			val = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		util.closeConnection(con, ps, rs);
		return 0;
	}
}
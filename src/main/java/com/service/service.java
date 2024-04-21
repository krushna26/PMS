package com.service;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.*;

import com.bean.User;
import com.bean.Booking;

import com.dao.dao;
import com.dao.userDao;

public class service {
	public int bookingService(Booking b) throws ClassNotFoundException, SQLException {
		dao d = new dao();
		return d.bookingService(b);
	}

	public User Login(String username, String password) throws ClassNotFoundException, SQLException {
		userDao udao = new userDao();
		return udao.Login(username, password);
	}

	public Booking tracking(int bookingId, String userId) throws ClassNotFoundException, SQLException {
		userDao d = new userDao();
		return d.tracking(bookingId, userId);
	}

	public int Register(User u) throws ClassNotFoundException, SQLException {
		userDao udao = new userDao();
		return udao.Register(u);
	}

	public ArrayList<Booking> previousBooking(String username) throws ClassNotFoundException, SQLException {
		userDao d = new userDao();
		return d.previousBooking(username);
	}

	public Booking officerTracking(int bookingId) throws ClassNotFoundException, SQLException {
		userDao d = new userDao();
		return d.officerTracking(bookingId);
	}

	public User userDetails(String username) throws ClassNotFoundException, SQLException {
		userDao d = new userDao();
		return d.userDetails(username);
	}

	public ArrayList<Booking> officerBookingHistory(String username, String parPaymentDate)
			throws ClassNotFoundException, SQLException, ParseException {
		userDao d = new userDao();
		return d.officerBookingHistory(username, parPaymentDate);
	}

	public Booking pickDropStatusUpdates(int bookingId) throws ClassNotFoundException, SQLException {
		userDao d = new userDao();
		return d.pickDropStatusUpdates(bookingId);
	}

	public int updateTime(String pickUp, String dropOff, int bookingId) throws ClassNotFoundException, SQLException {
		dao d = new dao();
		return d.updateTime(pickUp, dropOff, bookingId);
	}

	public int updateStatus(String status, int bookingId) throws ClassNotFoundException, SQLException {
		dao d = new dao();
		return d.updateStatus(status, bookingId);
	}
}

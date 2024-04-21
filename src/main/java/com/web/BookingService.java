package com.web;

import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;
import java.sql.SQLException;
import java.text.ParseException;
import java.lang.Math;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Booking;
import com.bean.User;
import com.security.PasswordHasher;
import com.service.*;

/**
 * Servlet implementation class BookingService
 * This servlet handles various services related to bookings and user actions.
 * 
 * @author Ganesh Shingre
 * @version 1.0
 * @since 1.0
 */
@WebServlet("/BookingService")
public class BookingService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookingService() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * Handles GET requests for various actions related to bookings and user interactions.
	 * 
	 * @param request  the HttpServletRequest object
	 * @param response the HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		HttpSession session = request.getSession();
		RequestDispatcher rd = null;
		service s = new service();
		Booking b = null;
		String action = request.getParameter("action");
		System.out.println(action);

		if ("logout".equals(action)) {
			System.out.println("----- inside logout -------");
			if (session != null) {
				session.invalidate();
				rd = request.getRequestDispatcher("login.jsp");
			}
		}

		else if ("bookingService".equals(action)) {
			System.out.println("----- inside bookingService -------");
			String recName = String.valueOf(request.getParameter("recName"));
			String recAddress = String.valueOf(request.getParameter("recAddress"));
			int recPin = Integer.parseInt(request.getParameter("recPin"));
			String recMobileNumber = String.valueOf(request.getParameter("recMobileNumber"));
			int parWeight = Integer.parseInt(request.getParameter("parWeight"));
			String parContents = String.valueOf(request.getParameter("parContents"));
			String parDeliveryType = String.valueOf(request.getParameter("parDeliveryType"));
			String parPackingPref = String.valueOf(request.getParameter("parPackingPref"));
			String parPickupTime = String.valueOf(request.getParameter("parPickupTime"));
			String parDropoffTime = String.valueOf(request.getParameter("parDropoffTime"));
			int parServiceCost = Integer.parseInt(request.getParameter("parServiceCost"));
			System.out.println(parServiceCost);
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			String parPaymentTime = dtf.format(now);

			Random rand = new Random();
			int randNum = rand.nextInt(1000);
			int hash = Math.abs(parPaymentTime.hashCode());
			int bookingId = hash / randNum;

			String parStatus = "Pending";

			User u = (User) session.getAttribute("USER");
			String userId = u.getUserId();
			Booking booking = new Booking(bookingId, userId, recName, recAddress, recPin, recMobileNumber, parWeight,
					parContents, parDeliveryType, parPackingPref, parPickupTime, parDropoffTime, parServiceCost,
					parPaymentTime, parStatus);

			int val = 0;
			try {
				System.out.print("inside the try catch of booking");
				System.out.print(booking);
				val = s.bookingService(booking);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if (val > 0) {
				System.out.println("Booking Success");
				session.setAttribute("LAST_BOOKING", booking);
				rd = request.getRequestDispatcher("Success.jsp");

			} else {
				System.out.println("Booking Not Successful");
			}
		}
		if ("previousBooking".equals(action)) {
			User u = (User) session.getAttribute("USER");
			String username = u.getUserId(); // request.getParameter("password");
			ArrayList<Booking> bookingList;
			System.out.println(username);
			try {
				bookingList = s.previousBooking(username);
				System.out.println("======>" + bookingList.get(0));

				if (bookingList != null) {
					request.setAttribute("previousBooking", bookingList);
					rd = request.getRequestDispatcher("/previousBooking.jsp");
				} else {
					rd = request.getRequestDispatcher("customerTracking.jsp");
					request.setAttribute("msg", "Details mismatch. Please check again.");
				}

			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				System.out.println("===>exception");
				rd = request.getRequestDispatcher("/error.jsp");
				request.setAttribute("msg", "No Previous Booking Details Found!");
			}
		}
		if ("officerBookingHistory".equals(action)) {

			String username = request.getParameter("userId");
			String parPaymentDate = request.getParameter("parPaymentDate");
			request.setAttribute("userId", username);
			ArrayList<Booking> officerbookingList;
			System.out.println("===>" + parPaymentDate);
			try {
				officerbookingList = s.officerBookingHistory(username, parPaymentDate);
				if (officerbookingList != null) {
					request.setAttribute("officerBookingHistory", officerbookingList);
					request.setAttribute("searchedUserID", username);
					rd = request.getRequestDispatcher("/officerBookingHistory.jsp");
				} else {
					rd = request.getRequestDispatcher("customerTracking.jsp");
					request.setAttribute("msg", "Details mismatch. Please check again.");
				}

			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				System.out.println("===>exception");
				rd = request.getRequestDispatcher("/error.jsp");
			}
		}

		// pickup scheduling
		if ("UpdateByOfficer".equals(action)) {
			String bId = request.getParameter("updationId");
			int bookingId = Integer.parseInt(bId);

			Booking bookingDetails;
			try {
				bookingDetails = s.pickDropStatusUpdates(bookingId);

				System.out.println(bookingDetails);

				if (bookingDetails != null) {
					request.setAttribute("bookingDetails", bookingDetails);
					User searchedUser = s.userDetails(bookingDetails.getUserId());
					request.setAttribute("searchedUser", searchedUser);
					rd = request.getRequestDispatcher("/pickupSchedulingDisplay.jsp");
				} else {
					rd = request.getRequestDispatcher("/pickupScheduling.jsp");
					request.setAttribute("msg", "Details mismatch. Please check again.");
				}

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				System.out.println("===>exception");
				rd = request.getRequestDispatcher("/error.jsp");
			}
		}

		if ("UpdateByOfficerStat".equals(action)) {
			String bId = request.getParameter("updationStatId");
			int bookingId = Integer.parseInt(bId);

			Booking bookingDetails;
			User searchedUser = null;
			try {
				bookingDetails = s.pickDropStatusUpdates(bookingId);
				if (bookingDetails != null) {
					searchedUser = (User) s.userDetails(bookingDetails.getUserId());
				}

				System.out.println(bookingDetails);

				if (bookingDetails != null) {
					request.setAttribute("bookingDetails", bookingDetails);
					request.setAttribute("searchedUser", searchedUser);
					rd = request.getRequestDispatcher("/deliveryStatus.jsp");
				} else {
					rd = request.getRequestDispatcher("/deliveryStatusUpdate.jsp");
					request.setAttribute("msg", "Details mismatch. Please check again.");
				}

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				System.out.println("===>exception");
				rd = request.getRequestDispatcher("/error.jsp");
			}
		}

		if (session != null) {
			rd.forward(request, response);
		}

		//
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = null;
		String action = request.getParameter("action");
		service s = new service();
		HttpSession session = request.getSession();

		if ("Login".equals(action)) {
			String id = request.getParameter("username");
			String pass = PasswordHasher.hashPassword(request.getParameter("password"));
			System.out.println("Inside Login");
			User u;
			try {
				u = s.Login(id, pass);

				session.setAttribute("USER", u);
				if (u != null) {
					rd = request.getRequestDispatcher("homepage.jsp");
				} else {
					rd = request.getRequestDispatcher("login.jsp");
					request.setAttribute("msg", "Invalid Credentials");
					session.invalidate();
				}

			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				System.out.println("===>exception");
				rd = request.getRequestDispatcher("/error.jsp");
			}

		}

		if ("Register".equals(action)) {

			String customerName = request.getParameter("customerName");
			String email = request.getParameter("email");
//			String countryCode = String.valueOf(request.getParameter("countryCode"));
			String mobileNumber = String.valueOf(request.getParameter("countryCode"))
					+ String.valueOf(request.getParameter("mobileNumber"));
			String address = request.getParameter("address");
			String userId = request.getParameter("userId");
			String password = PasswordHasher.hashPassword(request.getParameter("password"));
//			String password =request.getParameter("password");
			String preferences = request.getParameter("preferences");
			String role = "USER";

			User u = new User(customerName, email, mobileNumber, address, userId, password, preferences, role);

			int output = 0;
			try {
				output = s.Register(u);
				if (output > 0) {
//					System.out.println(u);
					System.out.println("Registration Successfull");
					rd = request.getRequestDispatcher("login.jsp");
				} else {
					rd = request.getRequestDispatcher("register.jsp");
					request.setAttribute("msg", "Details mismatch. Please check again.");

				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				System.out.println("===>exception");
				rd = request.getRequestDispatcher("/error.jsp");
			}

		}

		Booking b = null;

		if ("Tracking".equals(action)) {
			String bId = request.getParameter("bookingId");
			int bookingId = Integer.parseInt(bId);
			User u = (User) session.getAttribute("USER");
			String userId = u.getUserId();// request.getParameter("password");
			System.out.println("--------" + bookingId + userId);
			Booking bookingDetails;
			try {

				bookingDetails = s.tracking(bookingId, userId);
				System.out.println(bookingDetails);

				if (bookingDetails != null) {
					request.setAttribute("bookingId", bookingId);
					request.setAttribute("userId", userId);
					request.setAttribute("bookingDetails", bookingDetails);
					rd = request.getRequestDispatcher("/bookingDetails.jsp");
//					if(u.getRole().equalsIgnoreCase("ADMIN")) {
//						rd=request.getRequestDispatcher("adminMenu.jsp");
//					}else {
//						rd=request.getRequestDispatcher("customerMenu.jsp");
//					}
				} else {
					rd = request.getRequestDispatcher("customerTracking.jsp");
					request.setAttribute("msg", "Invalid booking ID. Please check again.");
					// session.invalidate();
				}

			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				rd = request.getRequestDispatcher("customerTracking.jsp");
				request.setAttribute("msg", "Invalid booking ID. Please check again.");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				rd = request.getRequestDispatcher("customerTracking.jsp");
				request.setAttribute("msg", "Invalid booking ID. Please check again.");
			} catch (Exception e) {
				System.out.println("===>exception");
				rd = request.getRequestDispatcher("customerTracking.jsp");
				request.setAttribute("msg", "Invalid booking ID. Please check again.");
			}

		}
		if ("officerTracking".equals(action)) {
			String bId = request.getParameter("bookingId");
			int bookingId = Integer.parseInt(bId);
			// User u =(User) session.getAttribute("USER");
			// String role = u.getRole();
			Booking bookingDetails;
			User user;
			try {

				bookingDetails = s.officerTracking(bookingId);
				if (bookingDetails != null) {
					user = s.userDetails(bookingDetails.getUserId());
				} else {
					user = null;
				}

				System.out.println(bookingDetails);

				if (bookingDetails != null) {
					request.setAttribute("bookingDetails", bookingDetails);
					request.setAttribute("user", user);
					rd = request.getRequestDispatcher("/bookingDetails.jsp");
				} else {
					rd = request.getRequestDispatcher("officerTracking.jsp");
					request.setAttribute("msg", "Invalid booking ID. Please check again.");
				}

			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("===>classerror");
				rd = request.getRequestDispatcher("/error.jsp");
			} catch (NumberFormatException e) {
				System.out.println("===>exception");
				rd = request.getRequestDispatcher("officerTracking.jsp");
				request.setAttribute("msg", "Invalid booking ID. Please check again.");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("===>sqlerror");
				rd = request.getRequestDispatcher("/error.jsp");
//				rd=request.getRequestDispatcher("officerTracking.jsp");
//				request.setAttribute("msg","Invalid booking ID. Please check again.");
			} catch (Exception e) {
				System.out.println("===>exception");
				rd = request.getRequestDispatcher("officerTracking.jsp");
				request.setAttribute("msg", "Invalid booking ID. Please check again.");
			}
		}

		if ("updateTime".equals(action)) {
			String pickUp = request.getParameter("updatePickup");
			String dropOff = request.getParameter("updateDropoff");
			String bId = request.getParameter("bookingIdUpdate");
			int bookingId = Integer.parseInt(bId);

			try {
				int value = s.updateTime(pickUp, dropOff, bookingId);

				if (value == 1) {
					rd = request.getRequestDispatcher("homepage.jsp");
				} else {
					rd = request.getRequestDispatcher("homepage.jsp");
				}

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				System.out.println("===>exception");
				rd = request.getRequestDispatcher("/error.jsp");
			}

		}

		if ("updateStatus".equals(action)) {
			String status = request.getParameter("parcelStatus");
			String bId = request.getParameter("bookingIdUpdateStat");
			int bookingId = Integer.parseInt(bId);

			try {
				int value = s.updateStatus(status, bookingId);

				if (value == 1) {
					rd = request.getRequestDispatcher("homepage.jsp");
				} else {
					rd = request.getRequestDispatcher("homepage.jsp");
				}

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		rd.forward(request, response);

	}

}

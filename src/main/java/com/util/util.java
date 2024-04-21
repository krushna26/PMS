package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class util {
	public static Connection createConnection() throws SQLException, ClassNotFoundException {
		Connection con = null;
		System.out.println("Co");
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Connection ");
		con = DriverManager.getConnection("jdbc:mysql://sql6.freemysqlhosting.net:3306/sql6686945", "sql6686945",
				"khgnIKCRn6");
		System.out.println("Connection Success");
		return con;
	}

	public static void closeConnection(Connection con, PreparedStatement ps, ResultSet rs) throws SQLException {

		if (rs != null) {
			rs.close();
		}

		if (ps != null) {
			ps.close();
		}
		if (con != null) {
			con.close();
		}
	}

}

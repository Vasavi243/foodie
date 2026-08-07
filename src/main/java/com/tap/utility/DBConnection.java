package com.tap.utility;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
		private static String URL="jdbc:mysql://localhost:3306/tap_food";
		private static String USERNAME="root";
		private static String PASSWORD="Oracle_2";
		static Connection con;
		public static Connection getConnection(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		   con=DriverManager.getConnection(URL,USERNAME,PASSWORD);
			
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
}

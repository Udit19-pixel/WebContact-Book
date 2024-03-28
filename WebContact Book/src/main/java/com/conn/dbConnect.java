package com.conn;

import java.sql.*;
import java.sql.DriverManager;

public class dbConnect
{
	private static Connection conn;
	public static Connection getConn()
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ContactBase","root","Skull2@Crusher");
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return conn;
	}
}
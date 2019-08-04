package helper;

import java.sql.*;


public class Database {

	private static final String URL = "jdbc:mysql://localhost:3306/maktaba?serverTimezone=CET&allowMultiQueries=true";
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String LOGIN = "root";
	private static final String PASSWORD = "";
	
	public static Connection getConnection()
	{
		Connection connection = null;
		try {
			Class.forName(DRIVER);
			connection = DriverManager.getConnection(URL, LOGIN, PASSWORD);
			}
		catch(SQLException | ClassNotFoundException e)
			{
			e.printStackTrace();
			}
		
		return connection;
	}
	public static void CleanUp(Connection connection, Statement statement, ResultSet resultSet)
	{
		if(connection != null)
		{
			try {
				connection.close();
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
					
		}
	}
}
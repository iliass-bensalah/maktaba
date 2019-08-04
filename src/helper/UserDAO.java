package helper;

import java.sql.*;

import account.User;
import bookstore.BookItem;

public class UserDAO {

	public static boolean authenticate(User user) {

		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Connection connection = null;
		boolean done = false;

		try {
			connection = Database.getConnection();
			preparedStatement = connection.prepareStatement(
					"SELECT * FROM USERS WHERE email = ?  AND password = ?");
			preparedStatement.setString(1, user.getEmail());
			preparedStatement.setString(2, user.getPassword());
			resultSet = preparedStatement.executeQuery();


			if (resultSet.next()) 
			{
				int id = resultSet.getInt("uid");
				boolean isAdmin = resultSet.getBoolean("is_admin");
				user.setId(id);
				user.setIsAdmin(isAdmin);
				done = true;
			}
		}catch(Exception e) {
			System.err.println(e);
		}finally {
			Database.CleanUp(connection, preparedStatement, resultSet);
		}
		return done;
	}


	public static boolean saveUser(User user) throws SQLIntegrityConstraintViolationException, SQLException {

		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Connection connection = null;
		boolean done = false;

		try {
			connection = Database.getConnection();
			preparedStatement = connection.prepareStatement(
					"INSERT INTO USERS (`uid`, `email`, `password`, `is_admin`)"
					+ " VALUES (NULL, ?, ?, 0)");
			preparedStatement.setString(1, user.getEmail());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.executeUpdate();
			done = true;

		}catch(Exception e) {
			System.err.println(e);
		}
		finally {
			Database.CleanUp(connection, preparedStatement, resultSet);
		}

		return done;
	}
}

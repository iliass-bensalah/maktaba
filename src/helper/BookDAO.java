package helper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

import bookstore.Book;
import bookstore.BookItem;

/**
 * @author Iliass
 *
 */
public class BookDAO {
	
	
	public static Boolean isBookItemAvailable(int id) {

		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Connection connection = null;
		Boolean available = false;

		try {
			connection = Database.getConnection();
			preparedStatement = connection.prepareStatement(
					"SELECT * FROM bookitem "
					+" WHERE bookitem.biid = ? ");
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();
			

			if (resultSet.next()) 
			{
				available = resultSet.getBoolean("available");
			}
		}catch(Exception e) {
			System.err.println(e);
		}finally {
			Database.CleanUp(connection, preparedStatement, resultSet);
		}
		return available;
	}

	public static Book searchById(int id) {

		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Connection connection = null;
		Book book = new Book();

		try {
			connection = Database.getConnection();
			preparedStatement = connection.prepareStatement(
					"SELECT * FROM books join bookitem on books.id = bookitem.book_id"
					+" WHERE books.id = ? ORDER BY `available` DESC LIMIT 1");
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();
			

			if (resultSet.next()) 
			{
				String title = resultSet.getString("title");
				String author = resultSet.getString("author");
				String isbn = resultSet.getString("ISBN");
				boolean available = resultSet.getBoolean("available");
				book.setTitle(title);
				book.setAuthor(author);
				book.setISBN(isbn);
				book.setId(id);
				book.setAvailable(available);
			}
		}catch(Exception e) {
			System.err.println(e);
		}finally {
			Database.CleanUp(connection, preparedStatement, resultSet);
		}
		return book;
	}
	
	public static ArrayList<Book> search(String keyword) {

		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Connection connection = null;
		ArrayList<Book> list = new ArrayList<Book>();

		try {
			connection = Database.getConnection();
			preparedStatement = connection.prepareStatement(
					"SELECT * FROM `books` JOIN "
					+ "( SELECT bookitem.*, MAX(bookitem.available) "
					+ "FROM bookitem GROUP BY bookitem.book_id ) "
					+ "as t ON `books`.id = t.book_id "
					+ "where books.ISBN LIKE ? OR books.title LIKE ? OR books.author LIKE ? ");
			preparedStatement.setString(1, keyword);
			preparedStatement.setString(2, keyword);
			preparedStatement.setString(3, keyword);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) 
			{
				int id = resultSet.getInt("id");
				String title = resultSet.getString("title");
				String author = resultSet.getString("author");
				String isbn = resultSet.getString("ISBN");
				boolean available = resultSet.getBoolean("MAX(bookitem.available)");
				
				Book book = new Book(title, author, isbn);
				book.setId(id);
				book.setAvailable(available);
				list.add(book);
				
			}
		}catch(Exception e) {
			System.err.println(e);
		}finally {
			Database.CleanUp(connection, preparedStatement, resultSet);
		}
		return list;
	}
	
	public static ArrayList<Book> searchByISBN(String keyword) {

		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Connection connection = null;
		ArrayList<Book> list = new ArrayList<Book>();

		try {
			connection = Database.getConnection();
			preparedStatement = connection.prepareStatement(
					"SELECT * FROM `books` JOIN "
					+ "( SELECT bookitem.*, MAX(bookitem.available) "
					+ "FROM bookitem GROUP BY bookitem.book_id ) "
					+ "as t ON `books`.id = t.book_id "
					+ "where books.ISBN LIKE ? ");
			preparedStatement.setString(1, keyword);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) 
			{
				int id = resultSet.getInt("id");
				String title = resultSet.getString("title");
				String author = resultSet.getString("author");
				String isbn = resultSet.getString("ISBN");
				boolean available = resultSet.getBoolean("MAX(bookitem.available)");
				
				Book book = new Book(title, author, isbn);
				book.setId(id);
				book.setAvailable(available);
				list.add(book);
				
			}
		}catch(Exception e) {
			System.err.println(e);
		}finally {
			Database.CleanUp(connection, preparedStatement, resultSet);
		}
		return list;
	}
	
	
	public static ArrayList<Book> searchByAuthor(String keyword) {

		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Connection connection = null;
		ArrayList<Book> list = new ArrayList<Book>();

		try {
			connection = Database.getConnection();
			preparedStatement = connection.prepareStatement(
					"SELECT * FROM `books` JOIN "
							+ "( SELECT bookitem.*, MAX(bookitem.available) "
							+ "FROM bookitem GROUP BY bookitem.book_id ) "
							+ "as t ON `books`.id = t.book_id "
							+ "where books.author LIKE ? ");
			preparedStatement.setString(1, keyword);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) 
			{
				int id = resultSet.getInt("id");
				String title = resultSet.getString("title");
				String author = resultSet.getString("author");
				String isbn = resultSet.getString("ISBN");
				Boolean available = resultSet.getBoolean("MAX(bookitem.available)");
				
				Book book = new Book(title, author, isbn);
				book.setId(id);
				book.setAvailable(available);
				list.add(book);
				
			}
		}catch(Exception e) {
			System.err.println(e);
		}finally {
			Database.CleanUp(connection, preparedStatement, resultSet);
		}
		return list;
	}
	
	/**
	 * @param String
	 * @return
	 */
	public static ArrayList<Book> searchByTitle(String keyword) {

		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Connection connection = null;
		ArrayList<Book> list = new ArrayList<Book>();

		try {
			connection = Database.getConnection();
			preparedStatement = connection.prepareStatement(
					"SELECT * FROM `books` JOIN "
							+ "( SELECT bookitem.*, MAX(bookitem.available) "
							+ "FROM bookitem GROUP BY bookitem.book_id ) "
							+ "as t ON `books`.id = t.book_id "
							+ "where books.title LIKE ? ");
			preparedStatement.setString(1, keyword);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) 
			{
				int id = resultSet.getInt("id");
				String title = resultSet.getString("title");
				String author = resultSet.getString("author");
				String isbn = resultSet.getString("ISBN");
				Boolean available = resultSet.getBoolean("MAX(bookitem.available)");
				
				Book book = new Book(title, author, isbn);
				book.setId(id);
				book.setAvailable(available);
				list.add(book);
			}
		}catch(Exception e) {
			System.err.println(e);
		}finally {
			Database.CleanUp(connection, preparedStatement, resultSet);
		}
		return list;
	}
	
	public static ArrayList<BookItem> fetchBookitemByUser(int uid) {

		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Connection connection = null;
		ArrayList<BookItem> list = new ArrayList<BookItem>();

		try {
			connection = Database.getConnection();
			preparedStatement = connection.prepareStatement(
					"SELECT * FROM `borrowings` "
					+ "JOIN `bookitem` ON bookitem.biid = borrowings.biid "
					+ "JOIN `users` ON users.uid = borrowings.uid JOIN"
					+ " `books` ON books.id = bookitem.book_id "
					+ "WHERE borrowings.uid = ? AND borrowings.archived = 0"); 
			preparedStatement.setInt(1, uid);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) 
			{
				int bid = resultSet.getInt("book_id");
				int biid = resultSet.getInt("biid");
				String title = resultSet.getString("title");
				String author = resultSet.getString("author");
				String isbn = resultSet.getString("ISBN");
				String brdate = resultSet.getString("brdate");
				
				BookItem bookitem = new BookItem(title, author, isbn);
				bookitem.setId(bid);
				bookitem.setBookItemId(biid);
				bookitem.setBorrowDate(brdate);
				list.add(bookitem);
			}
		}catch(Exception e) {
			System.err.println(e);
		}finally {
			Database.CleanUp(connection, preparedStatement, resultSet);
		}
		return list;
	}

	public static boolean saveBookItem(Book book,int copies) throws SQLIntegrityConstraintViolationException, SQLException {

		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Connection connection = null;
		boolean done = false;

		try {
			connection = Database.getConnection();
			
			/* 
			 * insertbooks(string title, string author, string isbn, int copies) 
			 */
			preparedStatement = connection.prepareStatement("CALL insertbooks(?, ?, ?, ?)");
			
			preparedStatement.setString(1, book.getTitle());
			preparedStatement.setString(2, book.getAuthor());
			preparedStatement.setString(3, book.getISBN());
			preparedStatement.setInt(4, copies);
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
	
	public static boolean BorrowBook(String email, int biid) throws SQLIntegrityConstraintViolationException, SQLException {

		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Connection connection = null;
		boolean done = false;

		try {
			connection = Database.getConnection();
			preparedStatement = connection.prepareStatement(
					"UPDATE `bookitem` SET `available` = '0'"
					+ " WHERE `bookitem`.`biid` = ?;"
					+" INSERT INTO borrowings (`uid`, `biid`) VALUES ("
					+ "(SELECT uid FROM users WHERE email = ?), ?)");
			preparedStatement.setInt(1, biid);
			preparedStatement.setString(2, email);
			preparedStatement.setInt(3, biid);
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
	
	
	public static boolean ReturnBook(int biid) throws SQLIntegrityConstraintViolationException, SQLException {

		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Connection connection = null;
		boolean done = false;

		try {
			connection = Database.getConnection();
			preparedStatement = connection.prepareStatement(
					"UPDATE `bookitem` SET `available` = '1'"
					+" WHERE `bookitem`.`biid` = ?;"
					+" UPDATE `borrowings` SET `archived` = 1"
					+" WHERE biid = ? and archived = 0");
			preparedStatement.setInt(1, biid);
			preparedStatement.setInt(2, biid);
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

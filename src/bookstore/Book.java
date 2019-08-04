/**
 * Represents a book as a non physical entity
 * A Book is available when at least one of its 
 * physical copies (BookItem) is available
 */

package bookstore;

public class Book{
	
	protected int id;
	protected String title;
	protected String author;
	protected String ISBN;
	protected Boolean available; 

	/**
	 * Constructors
	 */
	
	public Book()
	{
		id = 0;
		title = "";
		author = "";
		ISBN = "";
		available = false;
	}
	
	public Book(String title, String author, String ISBN)
	{
		id = 0;
		this.title = title;
		this.author = author;
		this.ISBN = ISBN;
		available = true;
	}
	
	/**
	 * Getters
	 */
	
	public int getId() {
		return id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public String getAuthor() {
		return author;
	}
	
	public String getISBN() {
		return ISBN;
	}
	
	public Boolean getAvailable() {
		return available;
	}
	
	/**
	 * Setters
	 */
	public void setId(int id) {
		this.id = id;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public void setISBN(String ISBN) {
		this.ISBN = ISBN;
	}
	
	public void setAvailable(Boolean available)
	{
		this.available = available;
	}
}

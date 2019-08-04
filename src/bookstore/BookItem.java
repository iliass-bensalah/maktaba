/**
 * A BookItem is the physical copy of a Book
 * it inherits all the properties and methods of Book,
 * and extends them whith a bookItemId and a borrowDate
 **/
package bookstore;


public class BookItem extends Book{
	private int bookItemId;
	private String borrowDate;
	
	/**
	 * Constructors
	 */
	public BookItem()
	{
		title = "";
		author = "";
		ISBN = "";
		bookItemId = 0;
		available = false;
		borrowDate = "";
	}
	
	public BookItem(String title, String author, String ISBN)
	{
		this.title = title;
		this.author = author;
		this.ISBN = ISBN;
		this.bookItemId = 0;
		this.borrowDate = "";
	}

	/**
	 * Getters
	 */
	public int getBookItemId() {
		return bookItemId;
	}
	
	public String getBorrowDate()
	{
		return borrowDate;
	}
	
	/**
	 * Setters
	 */

	public void setBookItemId(int bookItemId) {
		this.bookItemId = bookItemId;
	}
	
	public void setBorrowDate(String borrowDate) {
		this.borrowDate = borrowDate;
	}
	
}

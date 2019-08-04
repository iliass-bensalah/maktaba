/**
 * 
 */
package bookstore;

/**
 * @author Iliass
 *
 */
public class BookItem extends Book{
	private int bookItemId;
	private String borrowDate;
	
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

	public int getBookItemId() {
		return bookItemId;
	}
	
	public String getBorrowDate()
	{
		return borrowDate;
	}

	public void setBookItemId(int bookItemId) {
		this.bookItemId = bookItemId;
	}
	
	public void setBorrowDate(String borrowDate) {
		this.borrowDate = borrowDate;
	}
	
}

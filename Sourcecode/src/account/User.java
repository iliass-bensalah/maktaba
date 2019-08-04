/**
 * Represents a user of the library.
 * A user can also be an admin
 */

package account;

public class User{
	private int id;
	private String email;
	private String password;
	private boolean isAdmin;   // is set to one if the user is an admin
	
	
	/**
	 * Constructors
	 */
	
	public User() {
		this.id = 0;
		this.email= "";
		this.password = "";
		this.isAdmin = false;
		
	}
	
	public User(int id, String email, String password, boolean isAdmin) {
		this.id = id;
		this.email= email;
		this.password = password;
		this.isAdmin = isAdmin;
	}
	
	/**
	 * Getters
	 */
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}
	
	public boolean getIsAdmin() {
		return isAdmin;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}
	
	/**
	 * Setters
	 */

	public void setPassword(String password) {
		this.password = password;
	}
	
	public void setIsAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
}

package account;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import helper.UserDAO;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/0signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password1");
		
		
		User user = new User(0, email, password, false);
		//LoginDAO dao = new LoginDAO();
		boolean SignupState = false;
		try {
			SignupState = UserDAO.saveUser(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		}
		if (SignupState) {
			response.sendRedirect("/OpenLibrary/index.html");
		}
		else {
			//response.sendRedirect("/OpenLibrary/error.html");
			PrintWriter out = response.getWriter();
			out.println("<!DOCTYPE html>\r\n" + 
					"<html>\r\n" + 
					"<head>\r\n" + 
					"<meta charset=\"ISO-8859-1\">\r\n" + 
					"<title>Open Library - Error</title>\r\n" + 
					"</head>\r\n" + 
					"<body>\r\n" + 
					"<h2> Error: the email address is already in use </h2>\r\n" + 
					"\r\n" + 
					"<a href=\"/OpenLibrary/signup.html\">back</a>\r\n" + 
					"</body>\r\n" + 
					"</html>");
			}
			
		
	}
}

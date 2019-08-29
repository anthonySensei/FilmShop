

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypackage.DB;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public RegistrationServlet() {
        super();
       
    }



	
    @SuppressWarnings("deprecation")
	public void service(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException, ServletException
        {
		
		
		DB db = new DB();
		
		String login = request.getParameter("login");
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String phone = request.getParameter("phoneNumber");
		String email = request.getParameter("email");
		String password1 = request.getParameter("password");
		String password2 = request.getParameter("password2");
		
		
	    try {
			ResultSet result = db.statement.executeQuery("select * from usr where login = '"+login+"'");
			if(result.next()) {
				System.out.println("user exist in table 'usr'");
				response.sendRedirect(response.encodeRedirectUrl(
						"/FilmWebShop/registration.jsp"));
			}else{
				if(password1.equals(password2)) {
					try {
						int z = db.statement.executeUpdate("insert into usr(name, surname, phone, email, password, login)"
								+ "values('"+name+"', '"+surname+"','"+phone+"','"+email+"', '"+password1+"', '"+login+"')");
						if(z>0) {
							System.out.println("added to table 'usr'");
							response.sendRedirect(response.encodeRedirectUrl(
									"/FilmWebShop/index.html"));
						}else {//if there is error  redirect user to error.jsp and display this error 
							System.out.println("problem with inserting to table 'usr'");
							RequestDispatcher dd = request.getRequestDispatcher("Error.jsp");
							HttpSession session = request.getSession(false);
					        session.setAttribute("error", "problem with inserting to table 'usr'");
							dd.forward(request, response);
						}
					} catch (SQLException e) {//if there is error  redirect user to error.jsp and display this error 
						
						e.printStackTrace();
						RequestDispatcher dd = request.getRequestDispatcher("Error.jsp");
						HttpSession session = request.getSession(false);
				        session.setAttribute("error", e.toString());
						dd.forward(request, response);
						
					}
				}
			
				
			}
		} catch (SQLException e1) {//if there is error  redirect user to error.jsp and display this error 
			e1.printStackTrace();
			RequestDispatcher dd = request.getRequestDispatcher("Error.jsp");
			HttpSession session = request.getSession(false);
	        session.setAttribute("error", e1.toString());
			dd.forward(request, response);
		}
		
		
	}

}

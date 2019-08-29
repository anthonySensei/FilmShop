

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


@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateProfileServlet() {
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
		
		
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("userid");
		
		
		
	    try {
			
			ResultSet result = db.statement.executeQuery("select * from usr where id = "+id+"");
	
		     if(result.next()) {
				String dblogin = result.getString("login");
				if(dblogin.equals(login)) {    //checks if a user with such name exists
					
					try {
						int z = db.statement.executeUpdate("update usr set "
								+ "login='"+login+"', name = '"+name+"', surname='"+surname+"', phone='"+phone+"', email='"+email+"' where id = "+id+"");
						if(z>0) {
							System.out.println("update table 'usr'");
							response.sendRedirect(response.encodeRedirectUrl(
									"/FilmWebShop/profile.jsp"));
						}else {//if there is error  redirect user to error.jsp and display this error 
							System.out.println("problem with updating  table 'usr'");
							RequestDispatcher dd = request.getRequestDispatcher("Error.jsp");
					        session.setAttribute("error", "problem with updating  table 'usr'");
							dd.forward(request, response);
						}
					} catch (SQLException e) {//if there is error  redirect user to error.jsp and display this error 
						
						e.printStackTrace();
						RequestDispatcher dd = request.getRequestDispatcher("Error.jsp");
				        session.setAttribute("error", e.toString());
						dd.forward(request, response);
						
					}
					
					
				}else {
					
					
					result = db.statement.executeQuery("select * from usr where login = '"+login+"'");
					if(result.next()) {//if there is error  redirect user to error.jsp and display this error 
						System.out.println("user exist in table 'usr'");
						RequestDispatcher dd = request.getRequestDispatcher("Error.jsp");
				        session.setAttribute("error", "user exist in table 'usr'");
						dd.forward(request, response);
					}else {
						
						
						try {
							int z = db.statement.executeUpdate("update usr set "
									+ "login='"+login+"', name = '"+name+"', surname='"+surname+"', phone='"+phone+"', email='"+email+"' where id = "+id+"");
							if(z>0) {
								System.out.println("update table 'usr'");
								response.sendRedirect(response.encodeRedirectUrl(
										"/FilmWebShop/profile.jsp"));
							}else {//if there is error  redirect user to error.jsp and display this error 
								System.out.println("problem with updating  table 'usr'");
								RequestDispatcher dd = request.getRequestDispatcher("Error.jsp");
						        session.setAttribute("error", "problem with updating  table 'usr'");
								dd.forward(request, response);
							}
						} catch (SQLException e) {//if there is error  redirect user to error.jsp and display this error 
							
							e.printStackTrace();
							RequestDispatcher dd = request.getRequestDispatcher("Error.jsp");
					        session.setAttribute("error", e.toString());
							dd.forward(request, response);
							
						}
						
						
					}
					
					
				}
					
					
		
				
		     }
				
	
            
 
            }catch (SQLException e1) {
            	e1.printStackTrace();
					RequestDispatcher dd = request.getRequestDispatcher("Error.jsp");
			        session.setAttribute("error", e1.toString());
					dd.forward(request, response);
    		}
		
		
	}
}

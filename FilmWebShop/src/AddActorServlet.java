

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypackage.DB;


@WebServlet("/AddActorServlet")
public class AddActorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	@SuppressWarnings("deprecation")
	public void service(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException, ServletException
        {
		
		
		DB db = new DB();
		
		String name = request.getParameter("name");
		//String surname = request.getParameter("surname");
		String bday = request.getParameter("bday");
		
		
	  
			
					try {
						
						int z = db.statement.executeUpdate("insert into actor(aname, date_of_birth)"
								+ "values('"+name+"', '"+bday+"')");
						if(z>0) {
							System.out.println("added to table 'actor'");
							response.sendRedirect(response.encodeRedirectUrl(
									"/FilmWebShop/ChooseAddOption.jsp"));
						}else {//if there is error  redirect user to error.jsp and display this error 
							System.out.println("problem with inserting to table 'actor'");
							RequestDispatcher dd = request.getRequestDispatcher("Error.jsp");
							 HttpSession session = request.getSession(false);
						        session.setAttribute("error", "problem with inserting to table 'actor'");
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

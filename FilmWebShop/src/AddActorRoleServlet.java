

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


@WebServlet("/AddActorRoleServlet")
public class AddActorRoleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AddActorRoleServlet() {
        super();
      
    }


	@SuppressWarnings("deprecation")
	public void service(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException, ServletException
        {
		
		
		DB db = new DB();
		
		String aname = request.getParameter("aname");
		String hname = request.getParameter("hname");
		String fname = request.getParameter("fname");
		
		
	  
			
					try {
						int z = db.statement.executeUpdate("insert into actor_role(hero_name, actor_id, film_id)"
								+ "values"
	+ "('"+hname+"', (select id from actor where aname='"+aname+"'),(select id from film where name='"+fname+"'))");
						if(z>0) {
							System.out.println("added to table 'actor_role'");
							response.sendRedirect(response.encodeRedirectUrl(
									"/FilmWebShop/ChooseAddOption.jsp"));
						}else {  //if there is error  redirect user to error.jsp and display this error 
							System.out.println("problem with inserting to table 'actor_role'");               
							RequestDispatcher dd = request.getRequestDispatcher("Error.jsp");                      
							 HttpSession session = request.getSession(false);                                 
						        session.setAttribute("error", "problem with inserting to table 'actor_role'");
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



import java.io.IOException;
import java.net.URLEncoder;
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


@WebServlet("/EditFilmsServlet")
public class EditFilmsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EditFilmsServlet() {
        super();
    }


    @SuppressWarnings("deprecation")
  	public void service(HttpServletRequest request,
              HttpServletResponse response)
              throws IOException, ServletException
          {
  		
  		
  		DB db = new DB();
  		
  		String name = request.getParameter("name");
  		String year = request.getParameter("year");
  		String genre = request.getParameter("genre");
  		String description = request.getParameter("description");
  		String duration = request.getParameter("duration");
  		String image = request.getParameter("image");
  		String price = request.getParameter("price");
  		String productCode = request.getParameter("productCode");
  	
  	
  		
  	   
  			
  					try {
  						
  						int z = db.statement.executeUpdate("update film set name = '"+name+"', genre  = '"+genre+"', price = "+price+", description = '"+description+"', year_ = "+year+", duration = '"+duration+"', image = '"+image+"' where id = "+productCode+"");
  						if(z>0) {
  							System.out.println("updated  table 'film'");
  							response.sendRedirect(response.encodeRedirectUrl(
  									"/FilmWebShop/main.jsp"));
  						}else {//if there is error  redirect user to error.jsp and display this error 
  							RequestDispatcher dd = request.getRequestDispatcher("Error.jsp");
  							HttpSession session = request.getSession(false);
   					        session.setAttribute("error", "problem with updating  table 'film'");
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

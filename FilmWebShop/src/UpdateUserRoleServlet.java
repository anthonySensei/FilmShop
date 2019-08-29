

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

@WebServlet("/UpdateUserRoleServlet")
public class UpdateUserRoleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateUserRoleServlet() {
        super();
    }

    @SuppressWarnings("deprecation")
   	public void service(HttpServletRequest request,
               HttpServletResponse response)
               throws IOException, ServletException
           {
   		
   		
   		DB db = new DB();
   		
   		String userId = request.getParameter("userId");
   		String role = request.getParameter("role");
   		
   		HttpSession session = request.getSession(false);
   		
   		
   		
   	    try {
   			
   			ResultSet result = db.statement.executeQuery("select * from user_role where user_id = "+userId+"");
   	
   		     if(result.next()) {
   				
   					
   					try {
   						int z = db.statement.executeUpdate("update user_role set "
   								+ "rolename='"  + role + "'where user_id=" + userId);
   						if(z>0) {
   							System.out.println("update table 'user_role'");
   							response.sendRedirect(response.encodeRedirectUrl(
   									"/FilmWebShop/userList.jsp"));
   						}else {//if there is error  redirect user to error.jsp and display this error
   							System.out.println("problem with updating  table 'user_role'");
   							RequestDispatcher dd = request.getRequestDispatcher("Error.jsp");
   					        session.setAttribute("error", "problem with updating  table 'user_role'");
   							dd.forward(request, response);
   						}
   					} catch (SQLException e) {//if there is error  redirect user to error.jsp and display this error
   						
   						e.printStackTrace();
   						RequestDispatcher dd = request.getRequestDispatcher("Error.jsp");
   				        session.setAttribute("error", e.toString());
   						dd.forward(request, response);
   						
   					}
   						
   				
   				
   					
   				}	
               
    
               }catch (SQLException e1) {//if there is error  redirect user to error.jsp and display this error
            	   e1.printStackTrace();
						RequestDispatcher dd = request.getRequestDispatcher("Error.jsp");
				        session.setAttribute("error", e1.toString());
						dd.forward(request, response);
       		}
   		
   		
   	}

}

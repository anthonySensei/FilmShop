

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





@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ChangePasswordServlet() {
        super();
     
    }

    @SuppressWarnings("deprecation")
   	public void service(HttpServletRequest request,
               HttpServletResponse response)
               throws IOException, ServletException
           {
   		
   		
   		DB db = new DB();
   		
   	
   		String oldPassword = request.getParameter("oldpassword");
   		String password1 = request.getParameter("password");
   		String password2 = request.getParameter("password2");
   		
   		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("userid");
   		
   		
   	    try {
   			ResultSet result = db.statement.executeQuery("select * from usr where id = '"+id+"'");
   			
   			
   			
   			if(result.next()) {
   		    String dbPassword = result.getString("password");
   			if(!oldPassword.equals(dbPassword)) {//if there is error  redirect user to error.jsp and display this error 
   				System.out.println("Wrong old password");
				RequestDispatcher dd = request.getRequestDispatcher("Error.jsp");
				  
			        session.setAttribute("error", "Wrong old password");
					dd.forward(request, response);
   			}else{
   				if(password1.equals(password2)) {
   					try {
   						int z = db.statement.executeUpdate("update usr set password = '"+password1+"' where id = "+id+"");
   						if(z>0) {
   							System.out.println("update table 'usr'");
   							response.sendRedirect(response.encodeRedirectUrl(
   									"/FilmWebShop/ChooseProfileOption.jsp"));
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
   				}else {//if there is error  redirect user to error.jsp and display this error 
   					System.out.println("Passwords are different");
   					RequestDispatcher dd = request.getRequestDispatcher("Error.jsp");
						  
				        session.setAttribute("error", "Passwords are different");
						dd.forward(request, response);
   				}
   			
   				
   			}
   			}
   		} catch (SQLException e1) {//if there is error  redirect user to error.jsp and display this error 
   			// TODO Auto-generated catch block
   			e1.printStackTrace();
				RequestDispatcher dd = request.getRequestDispatcher("Error.jsp");
				  
		        session.setAttribute("error", e1.toString());
				dd.forward(request, response);
   		}
   		
   		
   	}

}

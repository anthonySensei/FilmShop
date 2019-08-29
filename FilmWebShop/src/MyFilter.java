import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypackage.DB;

public class MyFilter implements Filter {

	public void init(FilterConfig arg0) throws ServletException {}
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		PrintWriter out=resp.getWriter();
        DB db = new DB();
		String login = req.getParameter("login");
		String password=req.getParameter("password");
		
		
		try {
	        ResultSet result = db.statement.executeQuery("select id, rolename from user_role  as r inner join usr as u on r.user_id=u.id where u.login = '"+login+"' and u.password = '"+password+"'");
	        if(result.next()){
	         	String role = result.getString("rolename");
	         	
	        	 String id = Integer.toString(result.getInt("id"));
	        	HttpSession session = ((HttpServletRequest) req).getSession();
	        	 session.setAttribute("userid", id);
	        	 
	        	 if(role.equals("Admin")) { //checks whether the user is an admin
	         		 session.setAttribute("navbar", "adminNavbar");
	         	}else {
	         		 session.setAttribute("navbar", "navbar");
	         	}
	    		chain.doFilter(req, resp);//sends request to next resource
	    		}
	    		else{//if there is error  redirect user to error.jsp and display this error 
	    		
	    		RequestDispatcher dd = req.getRequestDispatcher("Error.jsp");
				HttpSession session = ((HttpServletRequest) req).getSession(false);
		        session.setAttribute("error", "username or password error!");
				dd.forward(req, resp);
	    		}
		} catch (SQLException e) {//if there is error  redirect user to error.jsp and display this error 
			e.printStackTrace();
			RequestDispatcher dd = req.getRequestDispatcher("Error.jsp");
			HttpSession session = ((HttpServletRequest) req).getSession(false);
	        session.setAttribute("error", e.toString());
			dd.forward(req, resp);
			
		}
        
        
        
		
	}
	
	public void destroy() {}
	

}

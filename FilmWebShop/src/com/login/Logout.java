package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Logout() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		//if user logout, this servlet removes session parameters
		
		HttpSession session = request.getSession();
		session.removeAttribute("userid");
		session.removeAttribute("name");
		session.removeAttribute("surname");
		session.removeAttribute("phone");
		session.removeAttribute("email");
		session.removeAttribute("login");
		session.invalidate();
		response.sendRedirect("index.html");
		
		
		
	}

}

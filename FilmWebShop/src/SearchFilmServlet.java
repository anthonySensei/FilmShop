

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypackage.DB;


@WebServlet("/SearchFilmServlet")
public class SearchFilmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SearchFilmServlet() {
        super();
      
    }


	@SuppressWarnings("deprecation")
	public void service(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException, ServletException
        {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		DB db = new DB();
		String parametr = request.getParameter("parametr");
		String searchOption = request.getParameter("searchOption");
		
		HttpSession session = request.getSession(false);
		String navbar = (String)session.getAttribute("navbar");
		out.print("<!DOCTYPE html>\r\n" + 
				"<html>\r\n" + 
				"<head>\r\n" + 
				"<meta charset=\"ISO-8859-1\">\r\n" + 
				"<title>FilmShop</title>\r\n" + 
				"\r\n" + 
				"    <!--For better view-->\r\n" + 
				"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\r\n" + 
				"    <!-- Bootstrap CSS -->\r\n" + 
				"    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\" integrity=\"sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO\" crossorigin=\"anonymous\">\r\n" + 
				"    <!-- -->\r\n" + 
				"    <style>\r\n" + 
				"body {\r\n" + 
				"            font-family: Verdana,sans-serif;\r\n" + 
				"            font-size: 0.9em;\r\n" + 
				"            background-image: url(\"https://cdn-images-1.medium.com/max/2400/1*FkxzhJ98LhBjEMUokVzWyg.jpeg\");\r\n" + 
				"            color:white;\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"        }\r\n" + 
				"nav{\r\n" + 
				"         background-image: url('https://www.theitem.com/uploads/original/20180823-184600-tickets.jpg')\r\n" + 
				"   }\r\n" + 
				"   .jumbotron{\r\n" + 
				"          margin-top: 20px;\r\n" + 
				"          width: 1260px;\r\n" + 
				"          background-image: url(\"https://www.theitem.com/uploads/original/20180823-184600-tickets.jpg\");\r\n" + 
				"          margin-left: 100px;}\r\n" + 
				"         td{\r\n" + 
				"         border: 1px solid #ff7733;background-color: white; padding: 10px;\r\n" + 
				"  text-align: left;\r\n" + 
				"         }\r\n" + 
				"         th{\r\n" + 
				"         border: 1px solid black;background-color: #ff7733;\r\n" + 
				"   padding: 10px;\r\n" + 
				"  text-align: left;width: 200px;\r\n" + 
				"         }\r\n" + 
				"         \r\n" +
				"input[type=text] {\r\n" + 
				"            height: 45px;\r\n" + 
				"            padding: 6px 10px;\r\n" + 
				"            box-sizing: border-box;\r\n" + 
				"            border: 3px solid #ccc;\r\n" + 
				"            -webkit-transition: 0.5s;\r\n" + 
				"            transition: 0.5s;\r\n" + 
				"            outline: none;\r\n" + 
				"            border-radius: 4px;\r\n" + 
				"        }\r\n" + 
				"       \r\n" + 
				"\r\n" + 
				"        select {\r\n" + 
				"         \r\n" + 
				"            box-sizing: border-box;\r\n" + 
				"            border: 3px solid #ccc;\r\n" + 
				"            -webkit-transition: 0.5s;\r\n" + 
				"            transition: 0.5s;\r\n" + 
				"            outline: none;\r\n" + 
				"            border-radius: 4px;\r\n" + 
				"        }\r\n" + 
				"        input[type=text]:focus {\r\n" + 
				"            border: 3px solid #ff7733;\r\n" + 
				"        }\r\n" + 
				"         select:focus {\r\n" + 
				"            border: 3px solid #ff7733;\r\n" + 
				"        }\r\n" + 
				"         input[type=submit]{\r\n" + 
				"        background-color: white;\r\n" + 
				"        color: black;\r\n" + 
				"        border: 3px solid #ccc;\r\n" + 
				"        border-radius: 4px;\r\n" + 
				"      \r\n" + 
				"       height: 45px;\r\n" + 
				"        }\r\n" + 
				"         input[type=submit]:hover{\r\n" + 
				"          border: 3px solid #ff7733;\r\n" + 
				"         }"+
				"    </style>\r\n" + 
				"</head>\r\n" + 
				"<body>");
		if(navbar.equals("adminNavbar")) {
	        out.print("<nav class=\"navbar navbar-expand-lg navbar-light bg-light\">\r\n" + 
	        		"<a class=\"navbar-brand\" href=\"#\"><font style=\"color: white\">FilmShop</font></a>\r\n" + 
	        		"<button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\r\n" + 
	        		"    <span class=\"navbar-toggler-icon\"></span>\r\n" + 
	        		"</button>\r\n" + 
	        		"<div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\r\n" + 
	        		"    <ul class=\"navbar-nav mr-auto\">\r\n" + 
	        		"        <li class=\"nav-item \">\r\n" + 
	        		"            <a class=\"nav-link\" href=\"#\"><font style=\"color: white\">Home</font></a>\r\n" + 
	        		"        </li>\r\n" + 
	        		"        </ul>\r\n" + 
	        		"</div> \r\n" + 
	        		"<div style=\"margin-right:1500px\" class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\r\n" + 
	        		"    	<ul class=\"navbar-nav mr-auto\">\r\n" + 
	        		"        <li class=\"nav-item \">\r\n" + 
	        		"            <a class=\"nav-link\" href=\"/FilmWebShop/main.jsp\"><font style=\"color: white\">Films</font></a>\r\n" + 
	        		"        </li>\r\n" + 
	        		"        </ul>\r\n" + 
	        		"         <ul class=\"navbar-nav mr-auto\">\r\n" + 
	        		"        <li class=\"nav-item \">\r\n" + 
	        		"            <a class=\"nav-link\" href=\"/FilmWebShop/ChooseProfileOption.jsp\"><font style=\"color: white\">Profile</font></a>\r\n" + 
	        		"        </li> \r\n" + 
	        		"        </ul>\r\n" + 
	        		"        <ul class=\"navbar-nav mr-auto\">\r\n" + 
	        		"        <li class=\"nav-item \">\r\n" + 
	        		"            <a class=\"nav-link\" href=\"/FilmWebShop/ChooseAddOption.jsp\"><font style=\"color: white\">Add</font></a>\r\n" + 
	        		"        </li>\r\n" + 
	        		"        </ul>\r\n" + 
	        		"        <div class=\"navbar-text\" style=\"margin-left:985px\">\r\n" + 
	        		"       <a class=\"nav-link\" href=\"/FilmWebShop/ChooseSearchOption.jsp\"><img src=\"https://cdn1.iconfinder.com/data/icons/hawcons/32/698956-icon-111-search-128.png\" style=\"width: 40px; height: 40px\"></a>\r\n" + 
	        		"        </div>\r\n" + 
	        		"        <form action=\"/FilmWebShop/Logout\"> \r\n" + 
	        		"   <input type=\"image\" style=\"width: 40px; height: 40px\" src=\"https://cdn1.iconfinder.com/data/icons/materia-arrows-symbols-vol-3/24/018_128_arrow_exit_logout-512.png\" alt=\"Submit\"> \r\n" + 
	        		"</form>\r\n" + 
	        		"</div> \r\n" + 
	        		"</nav>");
			
	}else {
		     out.print("<nav class=\"navbar navbar-expand-lg navbar-light bg-light\">\r\n" + 
		     		"<a class=\"navbar-brand\" href=\"#\"><font style=\"color: white\">FilmShop</font></a>\r\n" + 
		     		"<button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\r\n" + 
		     		"    <span class=\"navbar-toggler-icon\"></span>\r\n" + 
		     		"</button>\r\n" + 
		     		"<div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\r\n" + 
		     		"    <ul class=\"navbar-nav mr-auto\">\r\n" + 
		     		"        <li class=\"nav-item \">\r\n" + 
		     		"            <a class=\"nav-link\" href=\"#\"><font style=\"color: white\">Home</font></a>\r\n" + 
		     		"        </li>\r\n" + 
		     		"        </ul>\r\n" + 
		     		"</div> \r\n" + 
		     		"<div style=\"margin-right:1500px\" class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\r\n" + 
		     		"    	<ul class=\"navbar-nav mr-auto\">\r\n" + 
		     		"        <li class=\"nav-item \">\r\n" + 
		     		"            <a class=\"nav-link\" href=\"/FilmWebShop/main.jsp\"><font style=\"color: white\">Films</font></a>\r\n" + 
		     		"        </li>\r\n" + 
		     		"        </ul>\r\n" + 
		     		"        <ul class=\"navbar-nav mr-auto\">\r\n" + 
		     		"        <li class=\"nav-item \">\r\n" + 
		     		"            <a class=\"nav-link\" href=\"/FilmWebShop/ChooseProfileOption.jsp\"><font style=\"color: white\">Profile</font></a>\r\n" + 
		     		"        </li> \r\n" + 
		     		"        </ul>\r\n" + 
		     		"        <div class=\"navbar-text\" style=\"margin-left:1030px\">\r\n" + 
		     		"       <a class=\"nav-link\" href=\"/FilmWebShop/ChooseSearchOption.jsp\"><img src=\"https://cdn1.iconfinder.com/data/icons/hawcons/32/698956-icon-111-search-128.png\" style=\"width: 40px; height: 40px\"></a>\r\n" + 
		     		"        </div>\r\n" + 
		     		"        <div class=\"navbar-text\">\r\n" + 
		     		"       <a class=\"nav-link\" href=\"/FilmWebShop/DisplayShoppingCart.jsp\"><img src=\"http://calesan.cl/themes/images/shoppingcart.png\" style=\"width: 40px; height: 40px\"></a>\r\n" + 
		     		"        </div>\r\n" + 
		     		"        <form action=\"/FilmWebShop/Logout\"> \r\n" + 
		     		"   <input type=\"image\" style=\"width: 40px; height: 40px\" src=\"https://cdn1.iconfinder.com/data/icons/materia-arrows-symbols-vol-3/24/018_128_arrow_exit_logout-512.png\" alt=\"Submit\"> \r\n" + 
		     		"</form>\r\n" + 
		     		"</div> \r\n" + 
		     		"</nav>");
	}
		       out.print("<div class=\"jumbotron\" style=\"margin-left:140px\"> "+
		    		   "<form action=\"SearchFilmServlet\" method=\"post\">\r\n" + 
		       		"\r\n" + 
		       		"<div class=\"container\" style=\"margin-top: 10px; margin-left: 80px\">\r\n" + 
		       		"\r\n" + 
		       		"			<div class=\"row ml-2\">\r\n" + 
		       		"                    <div class=\"col-sm\">\r\n" + 
		       		"						<select name=\"searchOption\" style=\"padding: 5px; height: 45px; margin-left: -100px\">\r\n" + 
		       		"                        <option>Film name</option>\r\n" + 
		       		"                        <option>Film genre</option>\r\n" + 
		       		"                        <option>Film year</option>\r\n" + 
		       		"                        <option>Actor name</option>\r\n" + 
		       		"                         <option>Hero name</option>\r\n" + 
		       		"      					</select>\r\n" + 
		       		"                    </div>\r\n" + 
		       		"                    <div class=\"col-sm ml-2\">\r\n" + 
		       		"   						<input type=\"text\" name=\"parametr\"  style=\"margin-left: -350px\"      \r\n" + 
		       		"                               placeholder=\"Text\"\r\n" + 
		       		"                               data-toggle=\"tooltip\"\r\n" + 
		       		"                                    title=\" input some info at this field\"\r\n" + 
		       		"                        />\r\n" + 
		       		"                    </div>\r\n" + 
		       		"                    \r\n" + 
		       		"                     <div class=\"col-sm ml-2\">\r\n" + 
		       		"                     \r\n" + 
		       		"                      <input type=\"submit\" value=\"Search\" style=\"margin-left: -500px\"/>\r\n" + 
		       		"                      \r\n" + 
		       		"                     </div>\r\n" + 
		       		"                   \r\n" + 
		       		"              </div>\r\n" + 
		       		"			\r\n" + 
		       		"</div>  \r\n" + 
		       		"</form>");
		
				out.print("<tr>"+
				"<p>\r\n" + 
				"<h1 style='margin-left: 15px'>Result:</h1>\r\n");
		
	
			
					try {
						ResultSet resultSet=db.statement.executeQuery("select * from film");
						//checks which filter to apply
						if(searchOption.equals("Film name")) {
							resultSet = db.statement.executeQuery("select * from film where name='"+parametr+"'");
						}else if(searchOption.equals("Film genre")){
							resultSet = db.statement.executeQuery("select * from film where genre='"+parametr+"'");
						}else if(searchOption.equals("Film year")){
							resultSet = db.statement.executeQuery("select * from film where year_='"+parametr+"'");
						}else if(searchOption.equals("Actor name")){
							resultSet = db.statement.executeQuery("select * from film f, actor_role r, actor a where f.id=r.film_id and r.actor_id=a.id and a.aname='"+parametr+"'");
						}else if(searchOption.equals("Hero name")){
							resultSet = db.statement.executeQuery("select * from actor_role ar inner join film f on ar.film_id=f.id where hero_name='"+parametr+"'");
							}

						out.print("<div>");
					    while(resultSet.next()) 
					    {

					// Create the URL for adding the item to the shopping cart.
					    	String addItemURL =
					                "/FilmWebShop/AddToShoppingCartServlet?"+
					                "productCode="+URLEncoder.encode(""+resultSet.getInt("id"))+
					                "&description="+URLEncoder.encode(resultSet.getString("description"))+
					                "&year="+URLEncoder.encode(""+resultSet.getInt("year_"))+
					                "&price="+URLEncoder.encode(""+resultSet.getInt("price"))+
					                "&genre="+URLEncoder.encode(resultSet.getString("genre"))+
					                "&name="+URLEncoder.encode(resultSet.getString("name"))+
					                "&duration="+URLEncoder.encode(resultSet.getString("duration"));
					    	// Create the URL for change film information.
					        String changeItemURL =
					                "/FilmWebShop/EditFilm.jsp?"+
					                "productCode="+URLEncoder.encode(""+resultSet.getInt("id"))+
					                "&description="+URLEncoder.encode(resultSet.getString("description"))+
					                "&year="+URLEncoder.encode(""+resultSet.getInt("year_"))+
					                "&price="+URLEncoder.encode(""+resultSet.getInt("price"))+
					                "&genre="+URLEncoder.encode(resultSet.getString("genre"))+
					                "&name="+URLEncoder.encode(resultSet.getString("name"))+
					                "&duration="+URLEncoder.encode(resultSet.getString("duration"))+
					                "&image="+URLEncoder.encode(resultSet.getString("image"));
					     // Create the URL for see all film information.
					        String itemInforationURL =
					                "/FilmWebShop/FilmInformation.jsp?"+
					                "productCode="+URLEncoder.encode(""+resultSet.getInt("id"))+
					                "&description="+URLEncoder.encode(resultSet.getString("description"))+
					                "&year="+URLEncoder.encode(""+resultSet.getInt("year_"))+
					                "&price="+URLEncoder.encode(""+resultSet.getInt("price"))+
					                "&genre="+URLEncoder.encode(resultSet.getString("genre"))+
					                "&name="+URLEncoder.encode(resultSet.getString("name"))+
					                "&duration="+URLEncoder.encode(resultSet.getString("duration"))+
					                "&image="+URLEncoder.encode(resultSet.getString("image"));
					          
							out.print("<div class='card mx-3' style=\"width:20%; margin-top: 5px\">\r\n" + 
									"    <a href='"+itemInforationURL+"'><img class='card-img-top' style='width : 100%;height: 400px' src='"+resultSet.getString("image")+"' alt='Card image cap'></a>\r\n" + 
									"    <div class='card-body'>\r\n" + 
									"      <h5 class='card-title text-dark'><"+resultSet.getString("name")+"</h5>"
											+ "<p class='card-text text-muted'>"+resultSet.getString("genre")+", "+resultSet.getString("year_")+"</p>");
							
							if(navbar.equals("adminNavbar")) {
						        out.print("  <a href='"+changeItemURL+"'>Edit </a>");
								
						}else {
							     out.print("<a href='"+addItemURL+"'>Add to Shopping Cart("+resultSet.getString("price")+"$)</a>");
						}
							out.print(" </div>\r\n" + 
									"  </div>");
						
							
							
					
					    }
					    
					    
					    
					
					} catch (SQLException e) {//if there is error  redirect user to error.jsp and display this error 
						
						e.printStackTrace();
						RequestDispatcher dd = request.getRequestDispatcher("Error.jsp");
					        session.setAttribute("error", e.toString());
							dd.forward(request, response);
					}
					String login = request.getParameter("login");
					 session.setAttribute("ulogin", login);
	
					 
					out.print("</div>"+
							"</body>\r\n" + 
							"</html>");
					
					
					
					
					out.close();
	}

}

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- connect jstl --> 
<%@ page language="java" import="cart.*,java.net.*,java.text.*,java.sql.ResultSet,java.sql.SQLException" %>
<%@ page import="mypackage.DB" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FilmShop</title>
    <!--For better view-->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!-- -->
    <style>
body {
            font-family: Verdana,sans-serif;
            font-size: 0.9em;
            background-image: url("https://cdn-images-1.medium.com/max/2400/1*FkxzhJ98LhBjEMUokVzWyg.jpeg");
            color:white;


        }
nav{
         background-image: url('https://www.theitem.com/uploads/original/20180823-184600-tickets.jpg')
   }
   .jumbotron{
          margin-top: 20px;
          width: 1260px;
          background-image: url("https://www.theitem.com/uploads/original/20180823-184600-tickets.jpg");
          margin-left: 100px;}

         
    </style>
</head>
<body>
<%
			if(session.getAttribute("userid")==null){//check if the user logged in // if not redirect user to login page
				RequestDispatcher dd = request.getRequestDispatcher("index.html");
				dd.forward(request, response);
			}

%>

  
 
<c:set var="vnavbar" value="${navbar}"/><!-- check which navbar should include -->
<c:choose>
 <c:when test="${vnavbar == 'adminNavbar'}">
    <jsp:include page="adminNavbar.jsp" flush="true"/>
 </c:when>
 <c:otherwise>
     <jsp:include page="navbar.jsp" flush="true"/>
 </c:otherwise>
</c:choose>
<div class="jumbotron" style="margin-left:140px"> 


 <%!DB db = new DB();%>
 <%
            try {
             %>  


<h1 style="margin-left: 15px;">Available Films</h1>
 <div class="card-group">


<%ResultSet resultSet = db.statement.executeQuery("select * from film");

// Get a currency formatter for showing the price.
   // NumberFormat currency = NumberFormat.getCurrencyInstance();

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
    
%>



 
  <div class="card mx-3" style="width:20%">
    <a href="<%=itemInforationURL%>"><img class="card-img-top" style="width : 100%; height:400px;" src="<%=resultSet.getString("image")%>" alt="Card image cap"></a>
    <div class="card-body">
      <h5 class="card-title text-dark"><%=resultSet.getString("name")%></h5>
      <p class="card-text text-muted"><%=resultSet.getString("genre")%>, <%=resultSet.getString("year_")%></p>
      <c:set var="vnavbar" value="${navbar}"/>
<c:choose>
 <c:when test="${vnavbar == 'adminNavbar'}">
    <a href="<%=changeItemURL%>">Edit </a>
 </c:when>
 <c:otherwise>
     <a href="<%=addItemURL%>">Add to Shopping Cart(<%=resultSet.getString("price")%>$)</a>
 </c:otherwise>
</c:choose>
    </div>
  </div>




<%
    }
    }catch (SQLException e) {
        e.printStackTrace();
        RequestDispatcher dd = request.getRequestDispatcher("error.jsp");
        session.setAttribute("error", e);
		dd.forward(request, response);
    }catch (IllegalArgumentException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		 RequestDispatcher dd = request.getRequestDispatcher("error.jsp");
	        session.setAttribute("error", e);
			dd.forward(request, response);
	} catch (SecurityException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		 RequestDispatcher dd = request.getRequestDispatcher("error.jsp");
	        session.setAttribute("error", e);
			dd.forward(request, response);
	} finally {
        if(out != null)
            out.close();
    }
 String login = request.getParameter("login");
 session.setAttribute("ulogin", login);
%>
</div>

</div>
</body>
</html>
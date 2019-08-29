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
<div class="jumbotron" style=" width: 1260px;margin-left:140px"> 


<%
	String productCode = request.getParameter("productCode"); %>
 <%!DB db = new DB();%>
 <%
            try {
             %>  


<h1 style="margin-left: 5px;">Film information</h1>

<div class="container ml-2">
	<div class="row">
		<div class = "column">
			<div><img src="<%=request.getParameter("image")%>" alt="image" style="width: 300px; height: 450px"></div>
		</div>
		<div class = "column ml-2">
			<div class="container">
				<div class="row">
					<div class = "column">
						<h4>Name: <%=request.getParameter("name")%></h4>
					</div>
				</div>
				<div class="row">
					<div class = "column">
			 			<h4>Genre: <%=request.getParameter("genre")%></h4>
					</div>
				</div>
				<div class="row">
					<div class = "column">
						<h4>Duration: <%=request.getParameter("duration")%></h4>
					</div>
				</div>
				<div class="row">
					<div class = "column">
			 			<h4>Year: <%=request.getParameter("year")%></h4> 
					</div>
				</div>
				<div class="row">
					<div class = "column">
					 <div class="jumbotron" style="width: 810px; height: 285px; margin-left: 20px"> 
					 <div style="margin-left: 310px">
			 			<h4 >Actors </h4> 
				    </div>
			


<%



ResultSet resultSet = db.statement.executeQuery("select aname from actor_role as r inner join film as f on f.id=r.film_id inner join actor as a on a.id=r.actor_id where f.id = "+productCode+";");


    while(resultSet.next()) 
    {

    	String aname = resultSet.getString("aname"); 
        
    
%>

      <h4 style="font-size: 16px"> - <%=aname%> </h4> 
     

<%
    }
    String addItemURL =
            "/FilmWebShop/AddToShoppingCartServlet?"+
            "productCode="+URLEncoder.encode(request.getParameter("productCode"))+
            "&description="+URLEncoder.encode(request.getParameter("description"))+
            "&year="+URLEncoder.encode(request.getParameter("year"))+
            "&price="+URLEncoder.encode(request.getParameter("price"))+
            "&genre="+URLEncoder.encode(request.getParameter("genre"))+
            "&name="+URLEncoder.encode(request.getParameter("name"))+
            "&duration="+URLEncoder.encode(request.getParameter("duration"));
    String changeItemURL =
            "/FilmWebShop/EditFilm.jsp?"+
           		 "productCode="+URLEncoder.encode(request.getParameter("productCode"))+
                    "&description="+URLEncoder.encode(request.getParameter("description"))+
                    "&year="+URLEncoder.encode(request.getParameter("year"))+
                    "&price="+URLEncoder.encode(request.getParameter("price"))+
                    "&genre="+URLEncoder.encode(request.getParameter("genre"))+
                    "&name="+URLEncoder.encode(request.getParameter("name"))+
                    "&duration="+URLEncoder.encode(request.getParameter("duration"))+
            		 "&image="+URLEncoder.encode(request.getParameter("image"));
    
    %>
    
    	</div>
				</div>
</div>
</div>
		</div>
	</div>
	 <div class="jumbotron"> 
<div class="row">
		<div class = "column" style="margin-left: 350px">
		<h2>Description</h2>
		</div>
	</div>
	<div class="row">
		<div class = "column" style="font-size: 20px;">
		<%=request.getParameter("description")%>
		</div>
	</div>
	
	<div class="row" style="margin-left: 400px">
		<div class = "column">
		 <c:set var="vnavbar" value="${navbar}"/>
<c:choose>
 <c:when test="${vnavbar == 'adminNavbar'}">
   <div  style="margin-left: 550px; margin-top: 20px">
    <a href="<%=changeItemURL%>"><h3><font color="#ff7733" style="margin-left: -550px">Edit</font></h3> </a>
    </div>
 </c:when>
 <c:otherwise>
 <div  style="margin-top: 20px;margin-left: -170px">
     <a href="<%=addItemURL%>"><h3 ><font color="#ff7733">Add to Shopping Cart(<%=request.getParameter("price")%>$)</font></h3></a>
     </div>
 </c:otherwise>
</c:choose>
</div>
		</div>
	</div>
    <%
    }catch (SQLException e) {
        e.printStackTrace();
    }catch (IllegalArgumentException e) {
		e.printStackTrace();
	} catch (SecurityException e) {
		e.printStackTrace();
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
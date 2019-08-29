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
          width: 450px;
          background-image: url("https://www.theitem.com/uploads/original/20180823-184600-tickets.jpg");
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

<h3 style="font-size: 20px;">


Hello, User! In our site you have a list of available films and you can place film to shopping cart or see all information about it on a separate page. Also, you can search film by film name, genre, year, actor name or hero name in the film. Also, you can change your personal information or password. When the book is added, you can check which films you added to the cart and can remove it from shopping cart. If you have placed all the films, you can make payment.


</h3>
 

</div>
</body>
</html>
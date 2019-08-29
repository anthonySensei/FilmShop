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
            th{
         border: 1px solid black;background-color: #ff7733;
   padding: 10px;
  text-align: left;width: 200px;
         }
          td{
         border: 1px solid #ff7733;background-color: white; padding: 10px;
  text-align: left;
         }
         
    </style>
</head>
<body>
<%
			if(session.getAttribute("userid")==null){//check if the user logged in // if not redirect user to login page
			
				RequestDispatcher dd = request.getRequestDispatcher("index.html");
				dd.forward(request, response);
			}

%> 

    <jsp:include page="adminNavbar.jsp" flush="true"/>

<div class="jumbotron" style=" width: 480px;margin-left:500px"> 
<h1 style="margin-left: 25px;">User information</h1>
<br>
<div class="container">
<div class="row">
<div class="column ml-3">
<table border="1">

<%
	String userId = request.getParameter("userid"); %>
	
<tr>
<th>Login</th>
<td><font style='color: black'><%=request.getParameter("login") %></font></td>
<tr>
<tr>
<th>Name</th>
<td><font style='color: black'><%=request.getParameter("name") %></font></td>
</tr>
<tr>
<th>Surname</th>
<td><font style='color: black'><%=request.getParameter("surname") %></font></td>
</tr>
<tr>
<th>Phone</th>
<td><font style='color: black'><%=request.getParameter("phone") %></font></td>
</tr>
<tr>
<th>Email</th>
<td><font style='color: black'><%=request.getParameter("email") %></font></td>
</tr>
<tr>
<th>Role</th>
<td><font style='color: black'><%=request.getParameter("role") %></font></td>
</tr>
 <%

 
 String login = request.getParameter("login");
 session.setAttribute("ulogin", login);

%>


</table>
</div>
</div>
<div class="row mt-1">
<div class="column ml-3">
<form action="/FilmWebShop/UpdateUserRoleServlet" method="post">
<input type="hidden" name="userId" value="<%=userId%>">

   <h3 style="font-size: 15">  <font>Choose new role of user: </font> </h3>
            <br>
            <h3 style="font-size: 15; margin-left: 60px"> 
            <input type="radio" name="role" value="User" checked /> User
            <input type="radio" name="role" value="Admin" checked /> Admin
           </h3>
      <br>
<button class="btn btn-primary" type="submit" style="margin-left: 100px" >Update role</button>

</form>
</div>



</div>
</div>
</div>
</body>
</html>
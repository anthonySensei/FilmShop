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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
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
          width: 1400px;
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
<div class="jumbotron" style="margin-left:80px"> 


<%!DB db = new DB();%>
 <%
            try {
             %>  

<h3>User list</h3>

<br>
<table border="1">
<tr>

<th>Login</th>
<th>Name</th>
<th>Surname</th>
<th>Phone</th>
<th>email</th>
<th>role</th>
</tr>
<%
   
ResultSet resultSet = db.statement.executeQuery("select * from usr inner join user_role on usr.id = user_role.user_id ");

while(resultSet.next()) 
{

//Create the URL for see user information.
    String UserInforationURL =
            "/FilmWebShop/UserRole.jsp?"+
            "userid="+URLEncoder.encode(""+resultSet.getInt("id"))+
            "&login="+URLEncoder.encode(resultSet.getString("login"))+
            "&name="+URLEncoder.encode(resultSet.getString("name"))+
            "&surname="+URLEncoder.encode(resultSet.getString("surname"))+
            "&phone="+URLEncoder.encode(resultSet.getString("phone"))+
            "&email="+URLEncoder.encode(resultSet.getString("email"))+
            "&role="+URLEncoder.encode(resultSet.getString("rolename"));

%>



<tr>

<td><font style='color: black'><%=resultSet.getString("login")%></font></td>

<td><font style='color: black'><%=resultSet.getString("name")%></font></td>

<td><font style='color: black'><%=resultSet.getString("surname")%></font></td>

<td><font style='color: black'><%=resultSet.getString("phone")%></font></td>

<td><font style='color: black'><%=resultSet.getString("email")%></font></td>

<td><font style='color: black'><%=resultSet.getString("rolename")%></font></td>

<td><a href="<%=UserInforationURL%>">Choose</a></td>

</tr>





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
</table>


<!--  <script src="https://www.paypal.com/sdk/js?client-id=sb"></script>
<script>paypal.Buttons().render('body');</script>-->
<br>

</div>
</body>
</html>
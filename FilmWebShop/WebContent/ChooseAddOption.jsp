<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  <!-- connect jstl -->  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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

         .jumbotron{
         margin-top:150px;
          background-image: url("https://www.theitem.com/uploads/original/20180823-184600-tickets.jpg");
          width: 700px;
         }
         nav{
         background-image: url('https://www.theitem.com/uploads/original/20180823-184600-tickets.jpg')
         }
         
    </style>
</head>
<body>
<%
			if(session.getAttribute("userid")==null){ //check if the user logged in // if not redirect user to login page
			
			
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

<div class="jumbotron" style="margin-left:450px">
<p>
<h2 style="margin-left: 90px">Choose add option: </h2>
<p>
<div class="container" style="margin-top: 10px; margin-left: 80px">
                <div class="row">
                    <div class="col-sm">
						<a href="/FilmWebShop/addFilms.jsp"><font color="#ff7733">Add film</font></a>
				   </div>
				</div>
				<div class="row">
                    <div class="col-sm">
						<a href="/FilmWebShop/addActor.jsp"><font color="#ff7733">Add actor</font></a>
 					</div>
				</div>
				<div class="row">
                    <div class="col-sm">
						<a href="/FilmWebShop/addActor_role.jsp"><font color="#ff7733">Add role of the actor</font></a>
      				</div>
				</div>
      </div>  
</div>

</body>
</html>
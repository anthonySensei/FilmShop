<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    <!-- connect jstl -->        
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

input[type=text] {
            height: 45px;
            padding: 6px 10px;
            box-sizing: border-box;
            border: 3px solid #ccc;
            -webkit-transition: 0.5s;
            transition: 0.5s;
            outline: none;
            border-radius: 4px;
        }
       

        input[type=text]:focus {
            border: 3px solid #ff7733;
        }
        input[type=submit]{
        background-color: white;
        color: black;
        border: 3px solid #ccc;
        border-radius: 4px;
        width: 65px;
         height: 35px;
        }
         input[type=submit]:hover{
         border: 3px solid #ff7733;
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
			if(session.getAttribute("userid")==null){    //check if the user logged in // if not redirect user to login page
			
			
				RequestDispatcher dd = request.getRequestDispatcher("index.html");  

				dd.forward(request, response);
			
			}

%>
<c:set var="vnavbar" value="${navbar}"/>    <!-- check which navbar should include -->
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
<h2 style="margin-left: 80px">Please enter information about actor role</h2>
<p>
        <form action="AddActorRoleServlet" method="post">

               <!--Actor name -->
            <div class="container" style="margin-top: 10px; margin-left: 80px">
                <div class="row">
                    <div class="col-sm">
                        <input type="text" name="aname" style="width:430px"
                               placeholder="Actor full name"   
                               data-toggle="tooltip"
                                    title="Input actor name"
                        />
                    </div>
                </div>

     			<!-- Hero name -->

                    
                        <div class="row mt-2">
                    <div class="col-sm">
                        <input type="text" name="hname"
                               style="width: 430px; "
                               placeholder="Hero name"   data-toggle="tooltip"
                               title="input  hero name at this field"/>
                    </div>
                    </div>


                    <!--film name -->
                    <div class="row  mt-2">
                        <div class="col-sm">
                            <input type="text" name="fname"
                                
                                   placeholder="Film name"  data-toggle="tooltip"
                                   style="width: 430px; "
                                   title="input film name at this field"/>
                         
                        </div>
                    </div>

                      
                     
                    <!-- Add actor role -->

                    <div class="row mt-2">
                        <div class="col-sm">
                            <button class="btn btn-primary" type="submit">Add actor role</button>
                        </div>
                    </div>
                </div>
        </form>
    </div>




</body>
</html>
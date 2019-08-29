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

input[type=text] {
            height: 45px;
            width: 350px
            padding: 6px 10px;
            box-sizing: border-box;
            border: 3px solid #ccc;
            -webkit-transition: 0.5s;
            transition: 0.5s;
            outline: none;
            border-radius: 4px;
        }

        input[type=password]:focus {
            border: 3px solid #ff7733;
        }
        input[type=password] {
            height: 45px;
            width: 350px
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
			if(session.getAttribute("userid")==null){  //check if the user logged in // if not redirect user to login page
			
			
				RequestDispatcher dd = request.getRequestDispatcher("index.html");

				dd.forward(request, response);
			
			}

%>
<c:set var="vnavbar" value="${navbar}"/> <!-- check which navbar should include -->
<c:choose>
 <c:when test="${vnavbar == 'adminNavbar'}">
    <jsp:include page="adminNavbar.jsp" flush="true"/>
 </c:when>
 <c:otherwise>
     <jsp:include page="navbar.jsp" flush="true"/>
 </c:otherwise>
</c:choose>



<div class="jumbotron" style="margin-left:450px">
        <form action="/FilmWebShop/ChangePasswordServlet" method="post">

          
            <div class="container" style="margin-left: 100px; margin-top: 10px">
                  <!-- Old password -->
                 <div class="row  mt-2">
                    <div class="col-sm">
                        <input type="password" name="oldpassword"
                               
                               placeholder="Previous password"
                               style="width: 410px"
                               data-toggle="tooltip"

                                    pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,}"
                                    required
                                   
                                    title="Create password(4 or more characters that are of at least one number, and one uppercase and lowercase letter)
                                 and input at this field"
                        />
                    
                        </div>
                       </div>

                <!-- Password -->
                <div class="row  mt-2">
                    <div class="col-sm">
                        <input type="password" name="password"
                               
                               placeholder="New password"
                               style="width: 200px"
                               data-toggle="tooltip"

                                    pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,}"
                                    required
                                   
                                    title="Create password(4 or more characters that are of at least one number, and one uppercase and lowercase letter)
                                 and input at this field"
                        />
                    
                        </div>


                        <!-- Password2 -->

                        <div class="col-sm">
                            <input type="password" name="password2"
                                   style="width: 200px;margin-left: -110px"
                                   placeholder="Retype password"
                                 
                                   data-toggle="tooltip"
                                   title="At this field you have to retype your password"
                            />
                           
                        </div>
                    </div>



                   
                    <!-- Registration/Back -->

                    <div class="row mt-2" style="margin-left: 73px">
                        <div class="col-sm  mt-2">
                            <a href="/FilmWebShop/ChooseProfileOption.jsp" class="mr-2" style="margin-left: -85px" >Back</a>
                        </div>
                        <div class="col-sm">
                            <button class="btn btn-primary" type="submit" style="margin-left: -315px" >Change password</button>
                        </div>
                    </div>
                </div>
        </form>
    </div>





</body>
</html>
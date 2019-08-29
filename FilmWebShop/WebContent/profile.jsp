<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- connect jstl --> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="mypackage.DB,java.sql.ResultSet,java.sql.SQLException" %>
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
        
        input[type=tel]:focus {
            border: 3px solid #ff7733;
        }
        input[type=tel] {
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
        input[type=email]:focus {
            border: 3px solid #ff7733;
        }
        input[type=email] {
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
			if(session.getAttribute("userid")==null){//check if the user logged in // if not redirect user to login page
			
			
				RequestDispatcher dd = request.getRequestDispatcher("index.html");

				dd.forward(request, response);
			
			}

%>
<%

        DB db = new DB();

		
		String id = (String) session.getAttribute("userid");
try {
	    
		ResultSet result = db.statement.executeQuery("select * from usr where id = '"+id+"'");
		
		
		if(result.next()){
			
			
			
			    String name = result.getString("name");
			    String surname = result.getString("surname");
			    String phone = result.getString("phone");
			    String email = result.getString("email");
			    String login = result.getString("login");
				
			    
		   	    session.setAttribute("name", name);
		   	    session.setAttribute("surname", surname);
		   		session.setAttribute("phone", phone);
		   		session.setAttribute("email", email);
		   		session.setAttribute("login", login);
			
			
			
		}
			
		
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
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
<h2 style="margin-left: 85px">Please enter your information</h2>
<p>
        <form action="/FilmWebShop/UpdateProfileServlet" method="post">

            <!--Login -->
            <div class="container" style="margin-left: 100px; margin-top: 10px">
                <div class="row">
                    <div class="col-sm">
                        <input type="text" name="login"
                               style="width: 410px;"
                               placeholder="Login"   
                               data-toggle="tooltip"
                                    title="Create your login and input at this field"
                                    value="${login}"
                        />
                    </div>
                </div>

                <!-- Name -->
                <div class="row mt-2">
                    <div class="col-sm">
                        <input type="text" name="name"
                               style="width: 200px"
                               placeholder="Name"   data-toggle="tooltip"
                               title="input your name at this field"
                               value="${name}"/>
                    </div>

                    <!-- Surname -->
                    <div class="col-sm">
                        <input type="text" name="surname"
                               placeholder="Surname"  data-toggle="tooltip"
                             
                               style="width: 200px;margin-left: -110px"
                               title="input your surname at this field"
                               value="${surname}"
                               />
                       
                    </div>
                </div>

                <!-- Phone number -->

                    <div class="row  mt-2">
                        <div class="col-sm">
                            <input type="tel" name="phoneNumber"
                               
                                   style="width: 410px; "    
                                   placeholder="XXX-XXX-XXXX"
                                   value="${phone}"
                                   pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
                                   required data-toggle="tooltip"
                                   title="Input your phone number(XXX-XXX-XXXX) at this field."
                            />
                           
                        </div>
                    </div>


                    <!--Email -->
                    <div class="row  mt-2">
                        <div class="col-sm">
                            <input type="email" name="email"
                                   value="${email}"
                                   placeholder="some@some.com"  data-toggle="tooltip"
                                   style="width: 410px;"
                                   title="input your email(some@.some) at this field"/>
                         
                        </div>
                    </div>

    

                   
                    <!--Update -->

                     <div class="row mt-2" style="margin-left: 73px">
                        <div class="col-sm  mt-2">
                            <a href="/FilmWebShop/ChooseProfileOption.jsp" class="mr-2" style="margin-left: -85px" >Back</a>
                        </div>
                        <div class="col-sm">
                            <button class="btn btn-primary" type="submit" style="margin-left: -315px" >Update account</button>
                        </div>
                    </div>
                </div>
        </form>
    </div>





</body>
</html>
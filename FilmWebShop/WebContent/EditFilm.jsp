<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- connect jstl --> 
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

<div class="jumbotron" style="margin-left:450px">


<p>
<h2 style="margin-left: 80px">Please enter film information</h2>
<p>
        <form action="/FilmWebShop/EditFilmsServlet" method="post">


         <input type="hidden" name="productCode" value="<%=request.getParameter("productCode")%>"/> 


            <!--Name -->
            <div class="container" style="margin-top: 10px; margin-left: 80px">
                <div class="row">
                    <div class="col-sm">
                        <input type="text" name="name" style="width:200px"
                               placeholder="Film name"   
                               data-toggle="tooltip"
                                    title="Input film name"
                                    value="<%=request.getParameter("name")%>"
                        />
                    </div>
                    
                       <!-- Year -->
                
                    <div class="col-sm" style="margin-left: -220px;width:200px">
                        <input type="text" name="year"
                               
                               placeholder="Year"
                               data-toggle="tooltip"

                                    pattern="[1-2]{1}[0-9]{3}"
                                    required
                                    title=" input year of the film at this field"
                                    value="<%=request.getParameter("year")%>"
                        />
                    
                        </div>
                </div>

     			<!-- Genre -->

                    
                        <div class="row mt-2">
                    <div class="col-sm">
                        <input type="text" name="genre"
                               style="width: 430px; "
                               placeholder="Genre"   data-toggle="tooltip"
                               title="input  genre at this field"
                               value="<%=request.getParameter("genre")%>"
                               
                               />
                                
                    </div>
                    </div>


                    <!--Description -->
                    <div class="row  mt-2">
                        <div class="col-sm">
                            <input type="text" name="description"
                                
                                   placeholder="Description"  data-toggle="tooltip"
                                   style="width: 430px; "
                                   title="input description of the film at this field"
                                   value="<%=request.getParameter("description")%>"
                                   />
                         
                        </div>
                    </div>


                <!-- Duration -->
                <div class="row  mt-2">
                        <div class="col-sm">
                            <input type="text" name="duration"
                                   style="width:200px"
                                   placeholder="Duration(hh:mm:ss)"
                                 
                                   pattern="[0-9]{2}:[0-9]{2}:[0-9]{2}"
                                   required data-toggle="tooltip"
                                   title="Input  duration of the film(hh:mm:ss) at this field."
                                   value="<%=request.getParameter("duration")%>"
                            />
                        </div>

                    <!-- Price -->
                    <div class="col-sm">
                        <input type="text" name="price" style="margin-left:-110px;width:220px"
                               placeholder="Price"
                               pattern="[0-9]{1,}"
                               required
                                 data-toggle="tooltip"
                               value="<%=request.getParameter("price")%>"
                               title="input  price at this field" />
                       
                    </div>
                </div>

           <!--Image -->
                    <div class="row  mt-2">
                        <div class="col-sm">
                            <input type="text" name="image"
                                
                                   placeholder="URL"  data-toggle="tooltip"
                                   style="width: 430px; "
                                   title="input image url at this field"
                                    value="<%=request.getParameter("image")%>"
                                   />
                         
                        </div>
                    </div>
             

                     
                    <!-- Edit film -->

                    <div class="row mt-2">
                        <div class="col-sm">
                            <button class="btn btn-primary" type="submit">Edit film</button>
                        </div>
                    </div>
                </div>
        </form>
    </div>




</body>
</html>
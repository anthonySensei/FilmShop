<%@ page language="java"%>


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
   .jumbotron{
          margin-top: 20px;
          width: 1260px;
          background-image: url("https://www.theitem.com/uploads/original/20180823-184600-tickets.jpg");
          margin-left: 100px;}
        
         
    </style>
</head>
<body>

  
 
<div class="jumbotron" style="margin-left:140px"> 

<h3>Error:</h3>

<%String error  = (String)session.getAttribute("error"); %> <!-- Display certain error -->
<font color="red"><%=error%></font>
<%session.removeAttribute("error"); %>
</div>
</body>
</html>
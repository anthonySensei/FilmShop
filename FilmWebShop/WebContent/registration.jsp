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
<nav class="navbar navbar-expand-lg navbar-light bg-light">
<a class="navbar-brand" href="#"  ><font style="color: white">FilmShop</font></a>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
        <li class="nav-item ">
            <a class="nav-link" href="#"><font style="color: white">Home</font></a>
        </li>
        </ul>
        <ul class="navbar-nav">
        <li class="nav-item ">
            <a class="nav-link" href="/FilmWebShop/index.html"><font style="color: white">Login</font></a>
        </li>
        </ul>
</div> 
</nav>



<div class="jumbotron" style="margin-left:450px">
<p>
<h2 style="margin-left: 85px">Please enter your information</h2>
<p>
        <form action="/FilmWebShop/RegistrationServlet" method="post">

            <!--Login -->
            <div class="container" style="margin-left: 100px; margin-top: 10px">
                <div class="row">
                    <div class="col-sm">
                        <input type="text" name="login"
                               style="width: 410px; "
                               placeholder="Login"   
                               data-toggle="tooltip"
                                    title="Create your login and input at this field"
                        />
                    </div>
                </div>

                <!-- Name -->
                <div class="row mt-2">
                    <div class="col-sm">
                        <input type="text" name="name"
                               style="width: 200px"
                               placeholder="Name"   data-toggle="tooltip"
                               title="input your name at this field"/>
                    </div>

                    <!-- Surname -->
                    <div class="col-sm">
                        <input type="text" name="surname"
                               placeholder="Surname"  data-toggle="tooltip"
                             
                               style="width: 200px;margin-left: -110px"
                               title="input your surname at this field"/>
                       
                    </div>
                </div>

                <!-- Phone number -->

                    <div class="row  mt-2">
                        <div class="col-sm">
                            <input type="tel" name="phoneNumber"
                               
                                   style="width: 410px; "    
                                   placeholder="XXX-XXX-XXXX"
                                 
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
                                
                                   placeholder="some@some.com"  data-toggle="tooltip"
                                   style="width: 410px;"
                                   title="input your email(some@.some) at this field"/>
                         
                        </div>
                    </div>

                <!-- Password -->
                <div class="row  mt-2">
                    <div class="col-sm">
                        <input type="password" name="password"
                               
                               placeholder="Password"
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
                            <a href="/FilmWebShop/index.html" class="mr-2" style="margin-left: -85px" ><font color="#ff7733">Back</font></a>
                        </div>
                        <div class="col-sm">
                            <button class="btn btn-primary" type="submit" style="margin-left: -315px" >Create account</button>
                        </div>
                    </div>
                </div>
        </form>
    </div>





</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- connect jstl -->  
<%@ page language="java" import="cart.*,java.util.*,java.text.*" %>

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
          width: 100%;
          background-image: url("https://www.theitem.com/uploads/original/20180823-184600-tickets.jpg");
          margin-left: 100px;}
        
         th{
         border: 1px solid black;background-color: #ff7733;
   padding: 10px;
  text-align: left;width: 200px;
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
<div class="jumbotron" style="margin-left:0px">

<table border="0">
<tr><td><img src="http://calesan.cl/themes/images/shoppingcart.png" style="width: 64px; height:64px"><td><h1>Shopping Cart</h1>
</table>

<%
// Get the current shopping cart from the user's session.
    ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");

// If the user doesn't have a shopping cart yet, create one.
    if (cart == null)
    {
        cart = new ShoppingCart();
        session.setAttribute("ShoppingCart", cart);
    }

// Get the items from the cart.
    Vector items = cart.getItems();

// If there are no items, tell the user that the cart is empty.
    if (items.size() == 0)
    {
        out.println("<h3>Your shopping cart is empty.</h3>");
    }
    else
    {
    	
%>
<%-- Display the header for the shopping cart table --%>
<br>
<table>
<tr>

<th>Name</th>
<th>Genre</th>
<th style="width: 500px">Description</th>
<th>Year</th>
<th>Price</th>

</tr>
<%! double price = 0; %>
<%
   
	int numItems = items.size();

// Get a formatter to write out currency values.
        NumberFormat currency = NumberFormat.getCurrencyInstance();

        price=0;
        for (int i=0; i < numItems; i++)
        {
            Item item = (Item) items.elementAt(i);
            

// Print the table row for the item.
            out.print("<tr><td style='border: 1px solid #ff7733;background-color: white; padding: 10px; text-align: left;'><font style='color: black'>");
            out.print(item.name);
            out.print("</font></td><td style='border: 1px solid #ff7733;background-color: white; padding: 10px; text-align: left;'><font style='color: black'>");
            out.print(item.genre);
            out.print("</font></td><td style='border: 1px solid #ff7733;background-color: white; padding: 10px; text-align: left;'><font style='color: black'>");
            out.print(item.description);
            out.print("</font></td><td style='border: 1px solid #ff7733;background-color: white; padding: 10px; text-align: left;'><font style='color: black'>");
            out.print(item.year);
            out.print("</font></td><td style='border: 1px solid #ff7733;background-color: white; padding: 10px; text-align: left;'><font style='color: black'>");
            out.print(item.price + "$"); 

            price = price + item.price;
// Print out a link that allows the user to delete an item from the cart.
            out.println("</font></td><td style='border: 1px solid #ff7733;background-color: white; padding: 10px; text-align: left; width: 80px;'>"+
                "<a href=\"/FilmWebShop/RemoveItemServlet?item="+
                i+"\"><font color='#ff7733'>Remove</font></a></td></tr>");
        }
    
%>

<div>
<script src="https://www.paypal.com/sdk/js?client-id=sb"></script>
<script>paypal.Buttons({
    createOrder: function(data, actions) {
        return actions.order.create({
          purchase_units: [{
            amount: {
              value: '<%=price%>'
            }
          }]
        });
      },
      onApprove: function(data, actions) {
        // Capture the funds from the transaction
        return actions.order.capture().then(function(details) {
          // Show a success message to your buyer
          alert('Transaction completed by ' + details.payer.name.given_name);
        });
      }
    }).render('body');</script>
  
</div>




<%} %>
</table>


<br>

</div>
</body>
</html>
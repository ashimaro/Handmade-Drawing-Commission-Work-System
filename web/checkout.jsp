<%-- 
    Document   : checkout
    Created on : Jan 5, 2022, 4:47:54 AM
    Author     : Ashi
--%>

<%@page import="dao.OrderDAO"%>
<%@page import="model.Order"%>
<%@page import="dao.UserDAO"%>
<%@page import ="model.User"%>

<%@page import ="model.DrawingDetails"%>

<%@page import ="model.commissionWork"%>
<%@page import ="model.DrawingDetails"%>
<%@page import ="dao.CommissionDAO"%>
<%@page import ="dao.DrawingDetailsDAO"%>
<%@page import ="java.util.List"%>
<%@page import = "java.text.NumberFormat" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
        ustora by freshdesignweb.com
        Twitter: https://twitter.com/freshdesignweb
        URL: https://www.freshdesignweb.com/ustora/
-->
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>HDCW - Checkout</title>

        <!-- Google Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">

        <%@page import = "java.text.NumberFormat" %>
        <%

            User user = (User) request.getSession().getAttribute("user");
            int userId = user.getUserId();


        %>
        <%  NumberFormat nf = NumberFormat.getInstance();
            nf.setMaximumFractionDigits(2);
            nf.setMinimumFractionDigits(2);
        %>

    </head>
    <body style="background-color:powderblue;">

    </div> <!-- End header area -->

    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="logo">
                        <h1></h1>
                        <center><img src="img/HDCWLogo.png" class="centerImage" alt="Logo" height="80" width="80" href="dashboard.jsp"></center>
                        <center><h1>Handmade Drawing Commission Work</h1></center>
                    </div>
                </div>

            </div>
        </div>
    </div> <!-- End site branding area -->


    <div class="mainmenu-area">
        <div class="container">
            <div class="row">

                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="dashboard.jsp">Order a portrait</a></li>
                        <li><a href="addcommission.jsp">Be an artist</a></li>
                        <li><a href="order.jsp">My Orders</a></li>
                        <li class="active"><a href="checkout.jsp">Cart</a></li>
                        <li><a href="purchase.jsp">Purchase History</a></li>
                        <li><a href="account.jsp?userId=<%=user.getUserId()%>">My Account</a></li>
                        <li><a href="<%=request.getContextPath()%>/UserController?action=signout">Logout</a></li>

                    </ul>
                </div>  
            </div>
        </div>
    </div> <!-- End mainmenu area -->
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Cart</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="product-content-right">
        <div class="m-10 flex justify-center">


        </div>
        <%
            CommissionDAO commissionDAO = new CommissionDAO();
            commissionWork commissionWork = new commissionWork();
            UserDAO userDAO = new UserDAO();
            DrawingDetailsDAO DDDao = new DrawingDetailsDAO();

            List<DrawingDetails> listDD = DDDao.retrieveAllDetailsByUserId(userId);

            for (DrawingDetails DD : listDD) {
                commissionWork = commissionDAO.retrievecommissionWorkById(DD.getCommissionId());
                user = userDAO.retrieveUserByUserId(commissionWork.getArtistId());

        %>
    </div><!-- comment -->
    <div class="max-w-7xl mx-auto my-2">


        <div class="border-r border-b border-l border-gray-400 lg:border-l-0 lg:border-t lg:border-gray-400 bg-white rounded-3xl p-4 flex justify-between leading-normal">

            <div class="bg-gray-100 rounded-3xl overflow-hidden shadow-lg">
                <img class="w-auto h-56 mr-4" class="lazy" src="image.jsp?id=<%=DD.getCommissionId()%>" alt="Image Broken">


            </div>
            <div class="max-w-7xl mx-auto">
                <br>

                <h1><strong><%=commissionWork.getCommissionName()%> By <%=user.getName()%></strong></h1>
                <br>
                <h2><strong>Price : </strong>RM <%=nf.format(commissionWork.getCommissionPrice())%> </h2>
                <br>
                <h2><strong>Description : </strong><%=commissionWork.getCommissionDesc()%> </h2>
                <br>
                <h2><strong>Number of Drawing per Sheet : </strong><%=DD.getFigureNo()%> </h2> 
                <br>
                <h2><strong>Background Price is included : </strong>RM <%=nf.format(DD.getBgPrice())%> </h2> 
                <br>
                <h2><strong>Total Price (Including shipping fee RM 10): </strong>RM <%=nf.format(commissionWork.getCommissionPrice()* DD.getFigureNo() +DD.getBgPrice()+10)%></h2> 


                <br>

                <div class="pr-8 flex ">
                    <form action="<%=request.getContextPath()%>/DrawingControlller">
                        <button type="submit" name="action" value="delete" class="btn btn-primary" onclick="return confirm('Are you sure you want to Delete this?');"> Remove Item</button>

                        &nbsp;
                        <input name="figureNo" type="hidden" value="<%=DD.getFigureNo()%>">
                        <input name="bgPrice" type="hidden" value="<%=DD.getBgPrice() %>">
                        <input name="drawingDetailsId" type="hidden" value="<%=DD.getDrawingDetailsId()%>">
                        <input type="hidden" name="userId" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" value="<%=user.getUserId()%>">
                        <input type="hidden" name="commissionId" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" value="<%=commissionWork.getCommissionId()%>">
                    
                    </form>
                    
                    
                    <form action="<%=request.getContextPath()%>/OrderController">
                        <button type="submit" name='action' value="placeOrder" class="btn btn-primary" onclick="return confirm('Are you sure you want to place this order?');">Place Order Now</button>
                        <input name="figureNo" type="hidden" value="<%=DD.getFigureNo()%>">
                        <input name="drawingDetailsId" type="hidden" value="<%=DD.getDrawingDetailsId()%>">
                        <input type="hidden" name="status" value="CHECKOUT">

                        <input type="hidden" name="userId" value="<%=DD.getUserId()%>">
                        <input type="hidden" name="commissionId" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" value="<%=DD.getCommissionId()%>">

                        <input type="hidden" name="artistId" value="<%=commissionWork.getArtistId()%>">
                    </form>

                </div>

                
            </div>

<%;}%>
        </div>
    </div>
</div>


</div>

<!--  
 <script>                            
     var totalMorgage = document.getElementById('total');
     var quantity = document.getElementsByClassName('commissionPrice');
     var sumMorgage = 0;
     for( var i = 0; i < quantity.length; i++ ){
     sumMorgage += Number(quantity[i].value);
         }
     //display the total of inputs
     totalMorgage.innerHTML = "Total: RM" + sumMorgage;
     </script>
   --!>  
     
<!-- Latest jQuery form server -->
<script src="https://code.jquery.com/jquery.min.js"></script>

<!-- Bootstrap JS form CDN -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!-- jQuery sticky menu -->
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.sticky.js"></script>

<!-- jQuery easing -->
<script src="js/jquery.easing.1.3.min.js"></script>

<!-- Main Script -->
<script src="js/main.js"></script>
</body>
</html>
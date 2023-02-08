<%-- 
    Document   : addcommission
    Created on : Jan 2, 2022, 3:12:41 AM
    Author     : Ashi
--%>

<%@page import="dao.UserDAO"%>
<%@page import="model.commissionWork"%>
<%@page import="java.util.List"%>
<%@page import="dao.CommissionDAO"%>
<%@page import="dao.FeedbackDAO"%>
<%@page import="model.User"%>
<%@page import="model.Feedback"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import = "java.text.NumberFormat" %>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Feedback</title>
        <%
            int commissionId = Integer.parseInt(request.getParameter("id"));

            CommissionDAO CommissionDAO = new CommissionDAO();
            commissionWork commissionWork = CommissionDAO.retrievecommissionWorkById(commissionId);

            FeedbackDAO feedbackDAO = new FeedbackDAO();
            List<Feedback> listFeedback = feedbackDAO.retrieveAllFeedbackByCommissionId(commissionId);

        %>
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


        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><!-- comment -->
        <style>
            .checked {
                color: orange;
            }
        </style><!-- comment -->
    </head>
    <body style="background-color:powderblue;">
        <%        User user = (User) request.getSession().getAttribute("user");
        %>
        <%
            NumberFormat nf = NumberFormat.getInstance();
            nf.setMaximumFractionDigits(2);
            nf.setMinimumFractionDigits(2);
        %>  
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
                        <li class="active"><a href="dashboard.jsp">Order a portrait</a></li>
                        <li><a href="addcommission.jsp">Be an artist</a></li>
                        <li><a href="order.jsp">My Orders</a></li>
                        <li><a href="checkout.jsp">Checkout</a></li>
                        <li><a href="purchase.jsp">My Purchase</a></li>
                        <li><a href="account.jsp?userId=<%=user.getUserId()%>">My Account</a></li>
                        <li><a href="<%=request.getContextPath()%>/UserController?action=signout">Logout</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div> 



    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Feedback(s)</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="p-10 grid grid-cols-10 sm:grid-cols-10 md:grid-cols-1 lg:grid-cols-3 xl:grid-cols-6 gap-5">

    </div><!-- comment -->
    <div class="max-w-7xl mx-auto my-2">
        <div class="border-r border-b border-l border-gray-400 lg:border-l-0 lg:border-t lg:border-gray-400 bg-white rounded-3xl p-4 flex justify-between leading-normal">
            <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script><!-- comment -->


            <table class="table align-middle mb-0 bg-white">
                <thead class="bg-light">
                    <tr>

                        <th>User</th>
                        <th>Feedback</th>
                        <th>Star Rate</th>

                    </tr>
                </thead>
                <tbody>
                    <%      UserDAO userDAO = new UserDAO();
                        for (Feedback feedback : listFeedback) {
                            User userFeedback = userDAO.retrieveUserByUserId(feedback.getUserId());
                    %>
                    <tr>

                        <td>
                            <p class="fw-bold mb-1" ><%=userFeedback.getName()%></p>

                        </td>
                        <td>
                            <p class="fw-normal mb-1"><%=feedback.getFeedback()%></p>
                        </td>
                        <td>
                            <p class="fw-normal mb-1">

                                <% if (feedback.getFeedbackStar() == 1) {%>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star "></span>
                                <span class="fa fa-star "></span>
                                <span class="fa fa-star "></span>
                                <span class="fa fa-star "></span><!-- comment --></p> 

                            <% } else if (feedback.getFeedbackStar() == 0) {%>

                            <span class="fa fa-star "></span>
                            <span class="fa fa-star "></span>
                            <span class="fa fa-star "></span>
                            <span class="fa fa-star "></span> 
                            <span class="fa fa-star "></span>

                            <% } else if (feedback.getFeedbackStar() == 2) {%>

                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star "></span>
                            <span class="fa fa-star "></span> 
                            <span class="fa fa-star "></span>


                            <% } else if (feedback.getFeedbackStar() == 3) {%>

                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star "></span>
                            <span class="fa fa-star "></span> 


                            <% } else if (feedback.getFeedbackStar() == 4) {%>

                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span> 
                            <span class="fa fa-star "></span>


                            <% } else if (feedback.getFeedbackStar() == 5) {%>

                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span> 
                            <span class="fa fa-star checked"></span>
                            <% } %>

                           
                        </td>


                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>


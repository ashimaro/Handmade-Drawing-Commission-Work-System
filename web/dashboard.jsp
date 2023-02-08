<%@page import="dao.UserDAO"%>
<%@page import="dao.FeedbackDAO"%>

<%@page import="model.User"%>
<%@page import="model.commissionWork"%>
<%@page import="java.util.List"%>
<%@page import="dao.CommissionDAO"%>

<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>HDCW - Dashboard</title>

        <!-- Google Fonts -->
        <link href='pluginscss/titilium.css' rel='stylesheet' type='text/css'>
        <link href='pluginscss/roboto.css' rel='stylesheet' type='text/css'>
        <link href='pluginscss/raleway.css' rel='stylesheet' type='text/css'>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">

        <link rel="stylesheet" href="pluginscss/font-awesome.min.css">
        <link rel="stylesheet" href="pluginscss/tailwind.min.css" >
        <link rel="stylesheet" href="pluginscss/font-awesome.min.css">

        <%@page import = "java.text.NumberFormat" %>
        
    </head>
    <body style="background-color:powderblue;">
        <%
            User user = (User) request.getSession().getAttribute("user");
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
                        <center><h1><b> Handmade Drawing Commission Work </b></h1></center>
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
                        <li><a href="checkout.jsp">Cart</a></li>
                        <li><a href="purchase.jsp">Purchase History</a></li>
                        <li><a href="account.jsp?userId=<%=user.getUserId()%>">My Account</a></li>
                        <li><a href="<%=request.getContextPath()%>/UserController?action=signout">Logout</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div> 

    <!-- End mainmenu area -->
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Order A Handmade Drawing Now</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div >
        <div>
            <div class="p-12 grid grid-cols-12 sm:grid-cols-12 md:grid-cols-1 lg:grid-cols-3 xl:grid-cols-6 gap-6">
                <%
                    commissionWork CW = new commissionWork();
                    int userId = user.getUserId();
                    UserDAO userDAO = new UserDAO();

                    FeedbackDAO feedbackDAO = new FeedbackDAO();

                    CommissionDAO commissionDAO = new CommissionDAO();
                    List<commissionWork> listcommissionwork = commissionDAO.getAllcommissionWork();
                    for (commissionWork commissionWork : listcommissionwork) {
                       user = userDAO.retrieveUserByUserId(commissionWork.getArtistId());
                       User activeUser = (User) request.getSession().getAttribute("user");
                       
                       
                %>

                <div class="bg-gray-100 rounded-3xl overflow-hidden shadow-lg">
                    <div class="px-6 py-4 text-center w-full">
                        <img class="w-full h-auto object-fit object-center" src="image.jsp?id=<%=commissionWork.getCommissionId()%>" width="500" height="333" alt="commissionImage">
                    </div>

                    <center>
                              <% if (activeUser.getUserId() == commissionWork.getArtistId() ) {%>
                        <a href="viewFeedback.jsp?id=<%=commissionWork.getCommissionId()%>" class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2 hover:bg-gray-400">

                            <%=feedbackDAO.countFeedback(commissionWork.getCommissionId())%> Feedback(s)


                        </a> 
                             <% } %> 
                    </center>
                    <div class="px-6 py-4">

                        <div class="font-bold text-xl mb-2">   
                            <h2><%=commissionWork.getCommissionName()%> By <%=user.getName()%></h2> 
                        </div>


                        <div class="product-carousel-price">
                            <ins>RM <%=nf.format(commissionWork.getCommissionPrice())%></ins>
                        </div>  

                        <div class="product-option-shop">
                          <% if (activeUser.getUserId() != commissionWork.getArtistId() ) {%>
                                  <a class="add_to_cart_button"  href="viewcommission.jsp?id=<%=commissionWork.getCommissionId()%>">Load More</a>
                        <% } %> 
                           
                        </div>                       
                    </div>
                </div>
                <%;
                    }
                %>
            </div>


        </div>
    </div> <!-- End main content area -->



    <!-- Latest jQuery form server -->
    <script src="pluginsjs/jquery.min.js"></script>

    <!-- Bootstrap JS form CDN -->
    <script src="pluginsjs/bootstrap.min.js"></script>

    <!-- jQuery sticky menu -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>

    <!-- jQuery easing -->
    <script src="js/jquery.easing.1.3.min.js"></script>

    <!-- Main Script -->
    <script src="js/main.js"></script>

    <!-- Slider -->
    <script type="text/javascript" src="js/bxslider.min.js"></script>
    <script type="text/javascript" src="js/script.slider.js"></script>

</body>
</html>
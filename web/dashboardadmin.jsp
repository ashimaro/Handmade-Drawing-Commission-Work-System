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
        <title>HDCW - Dashboard [ADMIN]</title>

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

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


        <%@page import = "java.text.NumberFormat" %>


        <style>


            .navbar {
                overflow: hidden;
                background-color: #333; 
            }

            .navbar a {
                float: left;
                font-size: 16px;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

            .subnav {
                float: left;
                overflow: hidden;
            }

            .subnav .subnavbtn {
                font-size: 16px;  
                border: none;
                outline: none;
                color: white;
                padding: 14px 16px;
                background-color: inherit;
                font-family: inherit;
                margin: 0;
            }

            .navbar a:hover, .subnav:hover .subnavbtn {
                background-color: red;
            }

            .subnav-content {
                display: none;
                position: absolute;
                left: 0;
                background-color: red;
                width: 100%;
                z-index: 1;
            }

            .subnav-content a {
                float: left;
                color: white;
                text-decoration: none;
            }

            .subnav-content a:hover {
                background-color: #eee;
                color: black;
            }

            .subnav:hover .subnav-content {
                display: block;
            }
        </style>
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
                        <li class="active"><a href="dashboardadmin.jsp">Dashboard</a></li>
                        <li><a href="uaccadmin.jsp">User Managements</a></li>
                        <li ><a href="adminreport.jsp?artistId=0">Report</a></li>
                        <li><a href="accadmin.jsp?userId=<%=user.getUserId()%>">My Account</a></li>
                        <li><a href="<%=request.getContextPath()%>/UserController?action=signout">Logout</a></li>
                        
                 <!--        <div class="navbar">
                            <a href="#home">Home</a>
                            <div class="subnav">
                                <button class="subnavbtn">About <i class="fa fa-caret-down"></i></button>
                                <div class="subnav-content">
                                    <a href="#company">Company</a>
                                    <a href="#team">Team</a>
                                    <a href="#careers">Careers</a>
                                </div>
                            </div> 
 -->



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
                %>

                <div class="bg-gray-100 rounded-3xl overflow-hidden shadow-lg">
                    <div class="px-6 py-4 text-center w-full">
                        <img class="w-full h-auto object-fit object-center" src="image.jsp?id=<%=commissionWork.getCommissionId()%>" width="500" height="333" alt="commissionImage">
                    </div>

                    <center> <a href="viewFeedback.jsp?id=<%=commissionWork.getCommissionId()%>" class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2 hover:bg-gray-400">

                            <%=feedbackDAO.countFeedback(commissionWork.getCommissionId())%> Feedback(s)


                        </a> </center>
                    <div class="px-6 py-4">

                        <div class="font-bold text-xl mb-2">   
                            <h2><%=commissionWork.getCommissionName()%> By <%=user.getName()%></h2> 
                        </div>


                        <div class="product-carousel-price">
                            <ins>RM <%=nf.format(commissionWork.getCommissionPrice())%></ins>
                        </div>  
                   
                    </div> 
                </div>
                <%;
                    }
                %>
            </div>


        </div>
    </div> <!-- End main content area 



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
<%@page import="model.Order"%>
<%@page import="dao.OrderDAO"%>
<%@page import="dao.CommissionDAO"%>
<%@page import="model.commissionWork"%>
<%@page import="model.commissionWork"%>
<%@page import="dao.FeedbackDAO"%>

<%@page import="dao.UserDAO"%>
<%@page import="model.User"%>
<%@page import="model.Admin"%>
<%@page import="java.util.List"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>HDCW - Users Management [ADMIN]</title>

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
        <%@ page import="java.util.*" %>

    </head>
    <body style="background-color:powderblue;">
        <%

            int searchId = Integer.parseInt(request.getParameter("artistId"));

            //OrderDAO orderDAO1 = new OrderDAO();
            //List<Order> SearchorderList = orderDAO1.searcheAllOrdersByArtistId(searchId);
            User user = (User) request.getSession().getAttribute("user");
            User userlist = (User) request.getSession().getAttribute("user");
            int artistId = user.getUserId();
            //int artistId = user.getartistId();
            //Admin admin = (Admin) request.getSession().getAttribute("admin");

            //OrderDAO orderDAO = new OrderDAO();
            //List<Order> listFeedback = orderDAO.getAllOrder(artistId);
        %>
        <%            NumberFormat nf = NumberFormat.getInstance();
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
                        <li><a href="dashboardadmin.jsp">Dashboard</a></li>
                        <li><a href="uaccadmin.jsp">User Managements</a></li>
                        <li class="active"><a href="adminreport.jsp?artistId=0">Report</a></li>
                        <li><a href="accadmin.jsp?userId=<%=user.getUserId()%>">My Account</a></li>
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
                        <h2>Report</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div >
        <div>
            <div class="p-12 grid grid-cols-12 sm:grid-cols-12 md:grid-cols-12 lg:grid-cols-1 xl:grid-cols-1 gap-1">


                <div style = "background-color: #FFFFFF" class="bg-gray-100 rounded-3xl overflow-hidden shadow-lg ">

                    <div class="row">

                        <div class="col-md-12">
                            <div class="p-3 py-6">                   

                                <label> Artist Name</label>
                                <form class="mt-8 space-y-6" action="adminreport.jsp?artistId=" method="GET" >  


                                    <select class="form-control"  id = "artistId" name = "artistId" >

                                        <option id = "artistId" name = "artistId" value="0">ALL</option>

                                        <%
                                            commissionWork cw = new commissionWork();
                                            CommissionDAO CWDAO = new CommissionDAO();
                                            OrderDAO orderDAO = new OrderDAO();
                                            UserDAO userDAO = new UserDAO();

                                            List<User> artistlist = userDAO.retrieveAll();
                                            for (User artistdata : artistlist) {

                                                //List<User> listuser = userDAO.retrieveAll();
                                                //List<Order> OrderList = orderDAO.getAllOrder();
                                                //for (Order orderdata : OrderList) {
                                                // cw = CWDAO.retrievecommissionWorkById(artistdata.getUserId());
                                                user = userDAO.retrieveUserByUserId(artistdata.getUserId());

                                        %>
                                        <option id = "artistId" name = "artistId" value="<%=user.getUserId()%>">
                                            <%=user.getName()%>
                                        </option>  

                                        <% }%>    
                                    </select>
                            </div>


                            <div class="p-3 py-6">   

                                <button type="submit" class="btn btn-link btn-sm btn-rounded">
                                    Search
                                </button>


                            </div>
                            </form>
                            <p>
                            </p>
                        </div> 

                    </div>
                </div>
            </div>

        </div>
    </div>
</div> <!-- End main content area -->

<div >
    <div>
        <div class="p-12 grid grid-cols-12 sm:grid-cols-12 md:grid-cols-12 lg:grid-cols-1 xl:grid-cols-1 gap-1">


            <div style = "background-color: #FFFFFF" class="bg-gray-100 rounded-3xl overflow-hidden shadow-lg ">

                <div class="row">

                    <div class="col-md-12">
                        <div class="p-3 py-6">
                            <table class="table align-middle mb-0 bg-white">
                                <thead class="bg-light">
                                    <tr>

                                        <th>Order ID</th>
                                        <th align="center">Artist Name</th>
                                        <th align="center">Commission Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Background Price</th>
                                        <th>Total Price</th>

                                        <th>Status</th>


                                    </tr>
                                </thead>
                                <tbody>
                                    <%

                                        // commissionWork cw = new commissionWork();
                                        // CommissionDAO CWDAO = new CommissionDAO();
                                        // OrderDAO orderDAO = new OrderDAO();
                                        //List<Order> OrderList = orderDAO.getAllOrder(artistId);
                                        int tmpid = Integer.parseInt(request.getParameter("artistId"));
                                        List<Order> OrderList = orderDAO.searcheAllOrdersByArtistId(tmpid);
                                        //List<Order> OrderList = orderDAO.retrieveAllOrdersByArtistId(userId);
                                        for (Order orderdata : OrderList) {

                                            cw = CWDAO.retrievecommissionWorkById(orderdata.getCommissionId());
                                            user = userDAO.retrieveUserByUserId(cw.getArtistId());
                                            double total = orderdata.getFigureNo() * cw.getCommissionPrice() + cw.getCommissionBackground();
                                            //user = userDAO.retrieveUserByUserId(cw.getArtistId());

                                            //UserDAO userDAO = new UserDAO();
                                            //  List<User> listuser = userDAO.retrieveAll();
                                            //for (User userdata : listuser) {
                                    %>
                                    <tr>

                                        <td>
                                            <p class="fw-bold mb-1" ><%=orderdata.getOrderId()%></p>

                                        </td>
                                        <td>
                                            <p class="fw-normal mb-1"><%=user.getName()%></p>
                                        </td>
                                        <td>
                                            <p class="fw-normal mb-1"><%=cw.getCommissionName()%></p>
                                        </td>
                                        <td>
                                            <p class="fw-normal mb-1">RM <%=nf.format(cw.getCommissionPrice())%></p>
                                        </td>
                                        <td>
                                            <p class="fw-bold mb-1" ><%=orderdata.getFigureNo()%>  </p>

                                        </td>

                                        <td>
                                            <p class="fw-bold mb-1" >RM <%=nf.format(cw.getCommissionBackground())%></p>

                                        </td>

                                        <td>
                                            <p class="fw-bold mb-1" >RM <%=nf.format((total))%></p>

                                        </td>

                                        <td>
                                            <p class="fw-bold mb-1" ><%=orderdata.getStatus()%> </p>

                                        </td>


                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>     

            </div>

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
<script>
    // Get the modal

    var rowId = document.getElementById("rowid");

    var modal = document.getElementById("myModal37");
    //alert("Hello! I am an alert box!" + myModal);
    //var modal = modal1.concat(rowId);


    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal 
    btn.onclick = function () {
        modal.style.display = "block";
    };

    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        modal.style.display = "none";
    };

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
        ;
    };


</script>

<script>
    function getDate() {
        var today = new Date();

        document.getElementById("date").value = today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);


    }
</script>   
</body>
</html>
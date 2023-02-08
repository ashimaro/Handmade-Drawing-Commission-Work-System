<%-- 
    Document   : purchase
    Created on : Jan 5, 2022, 8:32:55 AM
    Author     : User
--%>
<%@page import="model.Feedback"%>
<%@page import="dao.FeedbackDAO"%>
<%@page import="model.commissionWork"%>
<%@page import="dao.CommissionDAO"%>
<%-- 
    Document   : adminDashboard
    Created on : Jan 4, 2022, 1:24:04 AM
    Author     : Ashwini
--%>
<%@page import="dao.UserDAO"%>
<%@page import="model.User"%>
<%@page import="model.Admin"%>
<%@page import="java.util.List"%>

<%@page import="dao.OrderDAO"%>
<%@page import="model.Order"%>



<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>HDCW - My Purchase</title>

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

        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    </head>
    <body style="background-color:powderblue;">
        <%
            User user = (User) request.getSession().getAttribute("user");
           // User userlist = (User) request.getSession().getAttribute("user");
            int userId = user.getUserId();

            //Order order = (Order) request.getSession().getAttribute("user");
            //Order order = (Order) request.getSession().getAttribute("user");
            //Order orderList = (Order) request.getSession().getAttribute("user");

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
                        <li><a href="dashboard.jsp">Order a portrait</a></li>
                        <li><a href="addcommission.jsp">Be an artist</a></li>
                        <li><a href="order.jsp">My Orders</a></li>
                            <li><a href="checkout.jsp">Cart</a></li>
                       
                        <li class="active"><a href="purchase.jsp">Purchase History</a></li>
                        <li><a href="account.jsp?userId=<%=user.getUserId()%>">My Account</a></li>
                        <li><a href="<%=request.getContextPath()%>/UserController?action=signout">Logout</a></li>

                    </ul>
                </div>  
            </div>
        </div>
    </div> <!-- End mainmenu area -->


    <!-- End mainmenu area -->
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Thank you for purchasing</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div >
        <div>



            <div class="p-10 grid grid-cols-10 sm:grid-cols-10 md:grid-cols-1 lg:grid-cols-3 xl:grid-cols-6 gap-5">

            </div>
            <div class="max-w-7xl mx-auto my-2">
                <div class="border-r border-b border-l border-gray-400 lg:border-l-0 lg:border-t lg:border-gray-400 bg-white rounded-3xl p-4 flex justify-between leading-normal">


                    <table class="table align-middle mb-0 bg-white" width="300" border="1">
                        <thead class="bg-light">
                            <tr>
                                <th align="center">Order ID</th>
                                <th align="center">Artist Name</th>
                                <th align="center">Commission Name</th>
                                <th align="center">Quantity</th>
                                <th align="center">Date & Time</th>
                                <th align="center">Status</th>
                                <th align="center">Upload Receipt</th>


                            </tr>
                        </thead>
                        <tbody>
                            <%
                                //UserDAO userDAO = new UserDAO();
                                // List<User> listuser = userDAO.retrieveAll();
                                // for (User userdata : listuser)
                                //{
                                commissionWork cw = new commissionWork();
                                CommissionDAO CWDAO = new CommissionDAO();
                                OrderDAO orderDAO = new OrderDAO();
                                UserDAO userDAO = new UserDAO();
                                //List<User> listuser = userDAO.retrieveAll();
                                //List<Order> OrderList = orderDAO.retrieveAllOrders();
                                List<Order> OrderList = orderDAO.retrieveAllOrdersByUserId(userId);
                                for (Order orderdata : OrderList) {
                                    cw = CWDAO.retrievecommissionWorkById(orderdata.getCommissionId());
                                    user = userDAO.retrieveUserByUserId(cw.getArtistId());

                            %>
                            <tr>
                                <td>
                                    <p align="center" class="fw-bold mb-1" ><%=orderdata.getOrderId()%></p>

                                </td>
                                <td>
                                    <p align="center" class="fw-bold mb-1" ><%=user.getName()%> </p>

                                </td>

                                <td>
                                    <p align="center" class="fw-normal mb-1"><%=cw.getCommissionName()%> </p>
                                </td>
                                <td>
                                    <p align="center" class="fw-normal mb-1"><%=orderdata.getFigureNo()%> </p>
                                </td>
                                
                                 <td>
                                    <p align="center" class="fw-normal mb-1"><%=orderdata.getTransdatetime() %> </p>
                                </td>

                                <td>
                                    <p align="center" class="fw-normal mb-1"><%=orderdata.getStatus()%> </p>
                                    <br>
                                    <p align="center" class="fw-normal mb-1">Remarks : <%=orderdata.getRemarks()%> </p>
                               <br>
                                <p align="center" class="fw-normal mb-1">Tracking Number: <%=orderdata.getTrackingNumber() %> </p>
                                </td>

                                <td>
                                    <% if (orderdata.getStatus().equals("APPROVED")) {%>
                                  <!-- <button type = "button" id = "myBtn" class="btn btn-primary" data-bs-target="#myModal<%=orderdata.getOrderId()%>"><%=orderdata.getStatus()%></button>
                                    The Modal -->

                                    <div id="myModal<%=orderdata.getOrderId()%>"  role="dialog">
                                        <!-- Modal content -->
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <label align="center">Update Status</label>
                                                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div><!-- comment -->
                                                <form class="mt-8 space-y-6" action="OrderController" method="POST" enctype="multipart/form-data">
                                                    <div class="modal-body">
                                                        <div class="col-md-2"></div>
                                                        <div class="col-md-12">
                                                            <div class="form-group">

                                                            </div>
                                                            <div class="form-group">
                                                                <label>Upload Receipt</label>
                                                                <input type="file" name="paymentFile">
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div style="clear:both;"></div>
                                                    <div class="modal-footer">
                                                        <input type="hidden" name="orderId" value="<%=orderdata.getOrderId()%>">
                                                        <button type="submit" name="action" value="upfile"  class="mr-3 group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-red-900 hover:bg-red-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                                            Upload
                                                        </button>
                                                    </div>
                                                </form> 

                                            </div>
                                        </div>
                                    </div>
                                    <% } %> 
                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div></div></div></div>
</div>
</div>
</div>
</div> <!-- End main content area -->



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

<!-- Slider -->
<script type="text/javascript" src="js/bxslider.min.js"></script>
<script type="text/javascript" src="js/script.slider.js"></script>

</body>
</html>
<%-- 
    Document   : order.jsp
    Created on : Jan 5, 2022, 5:40:54 AM
    Author     : ASHI
--%>

<%@page import="dao.DrawingDetailsDAO"%>
<%@page import="model.DrawingDetails"%>
<%@page import="model.Order"%>
<%@page import="model.Feedback"%>
<%@page import="dao.FeedbackDAO"%>
<%@page import="model.commissionWork"%>
<%@page import="dao.CommissionDAO"%>
<%@page import="dao.UserDAO"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>

<%@page import="dao.OrderDAO"%>


<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>HDCW - My Orders</title>

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
        <link rel="stylesheet" href="css/orderButton.css">

        <link rel="stylesheet" href="css/responsive.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    </head>
    <body style="background-color:powderblue;">
        <%
            User user = (User) request.getSession().getAttribute("user");
            int userId = user.getUserId();
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
                        <li  class="active"><a href="order.jsp">My Orders</a></li>
                        <li><a href="checkout.jsp">Cart</a></li>
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
                        <h2>My Order(s)</h2>
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

                    <table class="table align-middle mb-0 bg-white">
                        <thead class="bg-light">
                            <tr>
                                <th align="center">Order ID</th>
                                <th align="center">Customer Name</th>
                                <th align="center">Address</th>
                                <th align="center">Phone Number</th>
                                <th align="center">Your Commission Name</th>
                                <th align="center">Order Image</th> 
                                <th align="center">Status</th>
                                <th align="center">Customer's Payment</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%
                                //UserDAO userDAO = new UserDAO();
                                // List<User> listuser = userDAO.retrieveAll();
                                // for (User userdata : listuser)
                                //{
                                commissionWork cw = new commissionWork();
                                CommissionDAO commissionDAO = new CommissionDAO();
                                OrderDAO orderDAO = new OrderDAO();
                                UserDAO userDAO = new UserDAO();

                                DrawingDetails drawingDetails = new DrawingDetails();
                                DrawingDetailsDAO drawingDetailsDAO = new DrawingDetailsDAO();

                                //List<User> listuser = userDAO.retrieveAll();
                                //List<Order> OrderList = orderDAO.retrieveAllOrders();
                                //<tr data-toggle="modal" data-target="#myModal" >
                                List<Order> OrderList = orderDAO.retrieveAllOrdersByArtistId(userId);
                                for (Order orderdata : OrderList) {
                                    cw = commissionDAO.retrievecommissionWorkById(orderdata.getCommissionId());
                                    drawingDetails = drawingDetailsDAO.retrieveDrawingDetailsById(orderdata.getDrawingDetailsId());
                                    user = userDAO.retrieveUserByUserId(orderdata.getUserId());

                            %>
                            <tr>
                                <td>
                                    <p align="center" class="fw-bold mb-1" ><%=orderdata.getOrderId()%></p>
                                </td>
                                <td>
                                    <p align="center" class="fw-bold mb-1" ><%=user.getName()%></p>
                                </td>

                                <td>
                                    <p  class="fw-bold mb-1" ><%=user.getAddress()%></p>
                                    <p  class="fw-bold mb-1" ><%=user.getPostcode()%></p>
                                    <p  class="fw-bold mb-1" ><%=user.getCity()%></p>
                                    <p  class="fw-bold mb-1" ><%=user.getState()%></p>
                                </td>

                                <td>
                                    <p align="center" class="fw-bold mb-1" ><%=user.getPhoneNo()%></p>
                                </td>


                                <td>
                                    <p align="center" class="fw-normal mb-1"><%=cw.getCommissionName()%> </p>
                                </td>
                                <td>
                                    <p align="center" class="fw-normal mb-1">Click Image to Download</p>
                                    <a href="orderImage.jsp?orderId=<%=drawingDetails.getDrawingDetailsId()%>" download="orderImage">
                                        <img class="w-full h-auto object-fit object-center" name="orderImage" src="orderImage.jsp?orderId=<%=drawingDetails.getDrawingDetailsId()%>" width="80" height="80" alt="Order Image">
                                    </a>
                                      
                                     <a href="orderImage1.jsp?orderId=<%=drawingDetails.getDrawingDetailsId()%>" download="orderImage1">
                                        <img class="w-full h-auto object-fit object-center" name="orderImage1" src="orderImage1.jsp?orderId=<%=drawingDetails.getDrawingDetailsId()%>" width="80" height="80" alt="Order Image1">
                                    </a>
                                    
                                    <a href="orderImage2.jsp?orderId=<%=drawingDetails.getDrawingDetailsId()%>" name="orderImage" download="orderImage2">
                                        <img class="w-full h-auto object-fit object-center" name="orderImage2" src="orderImage2.jsp?orderId=<%=drawingDetails.getDrawingDetailsId()%>" width="80" height="80" alt="Order Image2">
                                    </a>
                                    
                                    <a href="orderImage3.jsp?orderId=<%=drawingDetails.getDrawingDetailsId()%>" download="orderImage3">
                                        <img class="w-full h-auto object-fit object-center" src="orderImage3.jsp?orderId=<%=drawingDetails.getDrawingDetailsId()%>" width="80" height="80" alt="Order Image3">
                                    </a>
                                    
                                    <a href="orderImage4.jsp?orderId=<%=drawingDetails.getDrawingDetailsId()%>" download="orderImage4">
                                        <img class="w-full h-auto object-fit object-center" src="orderImage4.jsp?orderId=<%=drawingDetails.getDrawingDetailsId()%>" width="80" height="80" alt="Order Image4">
                                    </a>
                                    
                                    <a href="backgroundImage.jsp?orderId=<%=drawingDetails.getDrawingDetailsId()%>" download="backgroundImage">
                                        <img class="w-full h-auto object-fit object-center" src="backgroundImage.jsp?orderId=<%=drawingDetails.getDrawingDetailsId()%>" width="80" height="80" alt="Background Image">
                                    </a>
                                     
                                </td>

                                <td>
                                    <button type = "button" id = "myBtn" class="btn btn-primary" data-bs-target="#myModal<%=orderdata.getOrderId()%>"><%=orderdata.getStatus()%></button>
                                    <!-- The Modal -->

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
                                                <form class="mt-8 space-y-6" action="OrderController" method="POST" >
                                                    <div class="modal-body">
                                                        <div class="col-md-2"></div>
                                                        <div class="col-md-12">
                                                            <div class="form-group">

                                                            </div>
                                                            <div class="form-group">
                                                                <label>Status</label>
                                                                <select class="form-control"  id = "e_status" name = "e_status">
                                                                    <option id = "e_status" name = "e_status" disabled value="" selected></option>  
                                                                    <option id = "e_status" name =
                                                                            "e_status" value="NEW">NEW</option>
                                                                    <option id = "e_status" name = "e_status" value="APPROVED">APPROVED</option>
                                                                    <option id = "e_status" name = "e_status" value="DECLINE">DECLINE</option>
                                                                    <option id = "e_status" name = "e_status" value="INPROGRESS">IN-PROGRESS</option>
                                                                    <option id = "e_status" name = "e_status" value="READY">READY</option>
                                                                    <option id = "e_status" name = "e_status" value="POSTED">POSTED</option>
                                                                    
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Remarks</label>
                                                                <input type="text" class="form-control" id = "remarks" name ="remarks"  >
                                                            </div>


                                                            <div class="form-group">
                                                                <label>Tracking Number</label>
                                                                <input type="text" class="form-control" id = "trackingNumber" name ="trackingNumber">
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div style="clear:both;"></div>
                                                    <div class="modal-footer">
                                                        <input type="hidden" name="orderId" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" value="<%=orderdata.getOrderId()%>">
                                                        <button type="submit" class="btn btn-primary" name = "action" value="updateStatus" onclick="return confirm('Are you sure you want to update this status?');" >UPDATE</button>
                                                    </div>
                                                </form> 

                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td>

                                    <p align="center" class="fw-normal mb-1">Click Image to Download</p>
                                    <a href="paymentImage.jsp?Id=<%=orderdata.getOrderId()%>" download="paymentImage">
                                        <img class="w-full h-auto object-fit object-center" src="paymentImage.jsp?Id=<%=orderdata.getOrderId()%>" width="80" height="80" alt="Payment Image">
                                    </a>
                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
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

</body>
</html>
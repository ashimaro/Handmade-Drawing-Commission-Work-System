<%-- 
    Document   : addcommission
    Created on : Jan 2, 2022, 3:12:41 AM
    Author     : Ashi
--%>
<%@page import="model.commissionWork"%>
<%@page import="java.util.List"%>
<%@page import="dao.CommissionDAO"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>HDCW - Artist</title>

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
    </div>

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
                        <li class="active"><a href="addcommission.jsp">Be an artist</a></li>
                        <li><a href="order.jsp">My Orders</a></li>
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
                        <h2>Let's become HDCW Artist</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>

        <div class="container">
            <br>
            <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
            <div class="flex justify-center mr-3 text-center">
                <a href="addDrawing2.jsp" class="btn btn-primary" ><i class="fa fa-paint-brush"> Add Commission Work</i></a>
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
                                <th align="center">Commission Image</th>
                                <th align="center">Commission Name</th>
                                <th align="center">Price </th>
                                <th align="center">Background Price</th>
                                <th align="center">Commission Description</th>
                                <th align="center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int userId = user.getUserId();
                                CommissionDAO CommissionDAO = new CommissionDAO();
                                List<commissionWork> listcommissionWork = CommissionDAO.retrieveAllcommissionwWorkById(userId);
                                for (commissionWork commissionWork : listcommissionWork) {

                            %>
                            <tr>
                                <td>
                                    <img class="w-full h-auto object-fit object-center" src="image.jsp?id=<%=commissionWork.getCommissionId()%>" width="80" height="80" alt="Order Image">

                                </td>
                                <td>
                                    <p align="center" class="fw-bold mb-1" ><%=commissionWork.getCommissionName()%> </p>

                                </td>

                                <td>
                                    <p align="center" class="fw-normal mb-1">RM <%=nf.format(commissionWork.getCommissionPrice())%> </p>
                                </td>
                                <td>
                                    <p align="center" class="fw-normal mb-1">RM <%=nf.format(commissionWork.getCommissionBackground())%> </p>
                                </td>

                                <td>
                                    <p  class="fw-normal mb-1"><%=commissionWork.getCommissionDesc()%> </p>

                                </td>

                                <td>
                                    <button> <a href="editDrawing2.jsp?commissionId=<%=commissionWork.getCommissionId()%>"  onclick="return confirm('Are you sure you want to Update this?');">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                                            </svg>
                                        </a></button>


                                </td>

                                <td>
                                    <form action="<%=request.getContextPath()%>/CommissionController">

                                        <button type="submit" name="action" value="delete" onclick="return confirm('Are you sure you want to Delete this?');">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-7 w-7" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                                            </svg>
                                        </button>
                                        <input name="commissionId" type="hidden" value="<%=commissionWork.getCommissionId()%>">
                                    </form>
                                </td>


                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div></div></div></div>




</body>
</html>


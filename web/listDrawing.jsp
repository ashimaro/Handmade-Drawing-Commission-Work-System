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
        <title>Dashboard</title>

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
    </head>
    <body>

        <%
            User user = (User) request.getSession().getAttribute("user");
        %>
        <div class="site-branding-area">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="logo">
                            <h1><a href="dashboard.jsp"><img class="logo" src="img/logo2.png"></a></h1>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="shopping-item">
                            <a class="add_to_cart_button" href="login.jsp">Logout</a>
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
                            <li><a href="checkout.jsp">Checkout</a></li>
                            <li><a href="order.jsp">Order</a></li>
                            <li><a href="account.jsp">My Account</a></li>
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
                            <h2>Let's become HDCW Artist ! </h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="single-product-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">

                    <div>
                        <%
                            int userId = user.getUserId();
                            CommissionDAO CommissionDAO = new CommissionDAO();
                            List<commissionWork> listcommissionWork = CommissionDAO.retrieveAllcommissionwWorkById(userId);

                            for (commissionWork commissionWork : listcommissionWork) {

                        %>

                        <div class="max-w-7xl mx-auto my-2">
                            <div class="border-r border-b border-l border-gray-400 lg:border-l-0 lg:border-t lg:border-gray-400 bg-white rounded-3xl p-4 flex justify-between leading-normal">
                                <img class="w-auto h-56 mr-4" class="lazy" src="/Drawing/img/image.jsp?id=<%=commissionWork.getCommissionId()%>" alt="Avatar of Writer">
                                <div class="mb-8">
                                    <div class="text-gray-900 font-bold text-xl mb-2">
                                        <table>
                                            <tr>
                                                <th>Commission Name :</th>
                                                <th><%=commissionWork.getCommissionName()%></th>
                                            </tr>   
                                        </table>
                                    </div>
                                    <div class="text-gray-700 text-base">
                                        <table>
                                            <tr>
                                                <th>Price :</th>
                                                <th><%=commissionWork.getCommissionPrice()%></th>
                                            </tr>   
                                        </table>   
                                    </div>
                                    <div class="text-gray-700 text-base">
                                        <table>
                                            <tr>
                                                <th>Background Charge</th>
                                                <th><%=commissionWork.getCommissionBackground()%></th>
                                            </tr>   
                                        </table>     
                                    </div>
                                    <div class="text-gray-700 text-base">
                                        <table>
                                            <tr>
                                                <th>Description </th>
                                                <th><%=commissionWork.getCommissionDesc()%></th>
                                            </tr>   
                                        </table>                               
                                    </div>
                                </div>
                                <div class="flex flex-col items-center">
                                    <div class="flex text-sm">
                                        <a href="editCafe.jsp?id=<%=commissionWork.getCommissionId()%>">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                                            </svg>
                                        </a>
                                        <form action="<%=request.getContextPath()%>/CommissionController">
                                            <button type="submit" name="action" value="delete">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="h-7 w-7" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                                                </svg>
                                            </button>
                                            <input name="commissionId" type="hidden" value="<%=commissionWork.getCommissionId()%>">
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>

                </body>
                </html>

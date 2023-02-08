<%-- 
    Document   : viewcommission
    Created on : Jan 4, 2022, 1:12:13 AM
    Author     : Ashi
--%>
<%@page import="model.DrawingDetails"%>
<%@page import="model.User"%>
<%@page import="model.commissionWork"%>
<%@page import="java.util.List"%>
<%@page import="dao.CommissionDAO"%>
<%@page import="dao.DrawingDetailsDAO"%>
<%@page import="dao.FeedbackDAO"%>
<%@page import="model.Feedback"%>

<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import = "java.text.NumberFormat" %>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Drawing Details</title>

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


        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <style>
            .checked {
                color: orange;
            }
        </style><!-- comment -->

        <style>
            .reset {
                color: #FF0000;
            }
        </style><!-- comment -->

        <style>

            .fa-star {
                font-size : 20px;
                align-content: center;
            }

        </style>
    </head>
    <body style="background-color:powderblue;">

        <%
            NumberFormat nf = NumberFormat.getInstance();
            nf.setMaximumFractionDigits(2);
            nf.setMinimumFractionDigits(2);
        %> 
        <%
            User user = (User) request.getSession().getAttribute("user");
            ;

            commissionWork commissionWork = new commissionWork();
            int commissionId = Integer.parseInt(request.getParameter("id"));
            CommissionDAO commissionDAO = new CommissionDAO();
            commissionWork = commissionDAO.retrievecommissionWorkById(commissionId);

            FeedbackDAO feedbackDAO = new FeedbackDAO();
            List<Feedback> listFeedback = feedbackDAO.retrieveAllFeedbackByCommissionId(commissionId);

        %> 

    </div> <!-- End header area -->
    <!-- End header area -->

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

    <!-- End mainmenu area -->
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Drawing Details</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>                
    <!-- End mainmenu area -->

    <div class="p-10 grid grid-cols-12 sm:grid-cols-10 md:grid-cols-1 lg:grid-cols-3 xl:grid-cols-12 gap-5">

    </div><!-- comment -->
    <div class="max-w-7xl mx-auto my-2">

        <div class="border-r border-b border-l border-gray-400 lg:border-l-0 lg:border-t lg:border-gray-400 bg-white rounded-3xl p-4 flex justify-between leading-normal">

            <div class="bg-gray-100 rounded-3xl overflow-hidden shadow-lg">
                <img class="w-auto h-56 mr-4" class="lazy" src="image.jsp?id=<%=commissionWork.getCommissionId()%>" alt="Image Broken">
            </div>
            <div class="max-w-7xl mx-auto">
                <br>
                <form class="mt-8 space-y-6" action="<%=request.getContextPath()%>/DrawingControlller" id="calculateQuantity" method="POST" enctype="multipart/form-data">   


                    <h1><strong><%=commissionWork.getCommissionName()%></strong></h1>
                    <br>
                    <h2><strong>Price : </strong> RM <%=nf.format(commissionWork.getCommissionPrice())%> </h2>
                    <input type="hidden" id ="price" name = "price" value ="<%=nf.format(commissionWork.getCommissionPrice())%>"></input>
                    <br>
                    <h2><strong>Description : </strong><%=commissionWork.getCommissionDesc()%> </h2>

                    <br>

                        <select name="figureNo" id="quantity">
                            <option value="1" selected>1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    <strong>Drawings per Sheet </strong>

                        <p></p>

                        <br>
                        <h2><strong>Add Background : </strong></h2>
                        <select name="bgPrice"  id = "bgPrice" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" 
                                <option   value="<%=commissionWork.getCommissionBackground()%>">Yes (RM <%=nf.format(commissionWork.getCommissionBackground())%>)</option>

                            <option    value="0" selected>No thanks!</option>
                            <option   value="<%=commissionWork.getCommissionBackground()%>">Yes (RM <%=nf.format(commissionWork.getCommissionBackground())%>)</option>

                        </select>
                        <br>

                        <h2><strong>Upload Image : </strong></h2>
                        <div class="text-gray-900 font-bold text-xl mb-2"> <input type="file" name="orderImage"  required > </div>
                       
                        <h2><strong>Background Image : </strong></h2>
                        <div class="text-gray-900 font-bold text-xl mb-2"> <input type="file" name="orderImage1"   > </div>
                       
                        <h2><strong>Upload Image : </strong></h2>
                        <div class="text-gray-900 font-bold text-xl mb-2"> <input type="file" name="orderImage2"  > </div>
                       
                        <h2><strong>Upload Image : </strong></h2>
                        <div class="text-gray-900 font-bold text-xl mb-2"> <input type="file" name="orderImage3"   > </div>
                       
                        <h2><strong>Upload Image : </strong></h2>
                        <div class="text-gray-900 font-bold text-xl mb-2"> <input type="file" name="orderImage4"   > </div>
                       
                        <h2><strong>Upload Image : </strong></h2>
                        <div class="text-gray-900 font-bold text-xl mb-2"> <input type="file" name="backgroundImage"  > </div>
                       
                        <br>
                        <br>
                        <br>
                        <br>
                        <div>
                            <button type="submit" name="action" value="add"  class="mr-3 group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-red-900 hover:bg-red-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                Add to Cart
                            </button> 
                        </div>
                        <input type="hidden" name="userId" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" value="<%=user.getUserId()%>">
                        <input type="hidden" name="commissionId" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" value="<%=commissionWork.getCommissionId()%>">
                        <input type="hidden" name="status"  value="NEW">
                        <br>

                        <br>
                        </div>    


                        </div>
                        </form>
                        <%-- Quantity Chosed :<u id="qty"></u>
                        <br>
                        Total Price (Inclusing Shipping Fee RM 10) :RM <u id="amt"></u> --%>
                        </div>

                        <div class="p-10 grid grid-cols-10 sm:grid-cols-10 md:grid-cols-1 lg:grid-cols-3 xl:grid-cols-6 gap-5">

                        </div><!-- comment -->



                        <div class="max-w-7xl mx-auto my-2">

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="product-bit-title text-center">
                                        <h1><strong>Customer Feedback</strong></h1>
                                    </div>
                                </div>
                            </div>
                            <br>
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

                                                    <% if (feedback.getFeedbackStar() == 0) {%>
                                                    <span class="fa fa-star "></span>
                                                    <span class="fa fa-star "></span>
                                                    <span class="fa fa-star "></span>
                                                    <span class="fa fa-star "></span>
                                                    <span class="fa fa-star "></span><!-- comment --></p> 

                                                <% } else if (feedback.getFeedbackStar() == 1) {%>
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star "></span>
                                                <span class="fa fa-star "></span>
                                                <span class="fa fa-star "></span>
                                                <span class="fa fa-star "></span><!-- comment --></p> 

                                                <% } else if (feedback.getFeedbackStar() == 2) {%>

                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star "></span>
                                                <span class="fa fa-star "></span> 
                                                <span class="fa fa-star "></span>


                                                <% } else if (feedback.getFeedbackStar() == 3) {%>

                                                <span class="fa fa-star checked" ></span>
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

                                                </p>
                                            </td>


                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <br><!-- comment -->       
                        <br>

                        <div class="max-w-7xl mx-auto my-2">

                            <div class="product-bit-title text-center">
                                <h1><strong>Submit Your Feedback & Star Rating</strong></h1>
                            </div>

                            <br>


                            <div class="border-r border-b border-l border-gray-400 lg:border-l-0 lg:border-t lg:border-gray-400 bg-white rounded-3xl p-4 flex justify-between leading-normal">


                                <div class="bg-gray-100 px-6 py-8 rounded-t-3xl shadow-md text-black w-full">

                                    <form class="mt-8 space-y-6" action="<%=request.getContextPath()%>/FeedbackController?" method="POST" >
                                        <div class="rounded-md shadow-sm -space-y-px">
                                            <h2>Star Rating</h2>
                                            <i class = "fa fa-star" aria-hidden = "true" id ="st1"  value="1" name="starrate" onclick="myRate1()"></i>
                                            <i class = "fa fa-star" aria-hidden = "true" id = "st2" value="2" name="starrate" onclick="myRate2()"></i>
                                            <i class = "fa fa-star" aria-hidden = "true" id = "st3" value="3" name="starrate" onclick="myRate3()"></i>
                                            <i class = "fa fa-star" aria-hidden = "true" id = "st4" value="4" name="starrate" onclick="myRate4()"></i>
                                            <i class = "fa fa-star" aria-hidden = "true" id = "st5" value="5" name="starrate" onclick="myRate5()"></i>
                                            <i class = "fa fa-star reset" aria-hidden = "true" id = "st0" value="0" name="starrate" onclick="myReset()"></i><!-- comment --><p></p>


                                            <h1></h1>
                                            <p></p>
                                            <div>
                                                <input type="text" name="newfeedback" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Add your feedback">
                                            </div>
                                            <br>
                                            <div>
                                                <input type="hidden" name="userIdfeedback" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" value="<%=user.getUserId()%>">
                                            </div>
                                            <div>
                                                <input type="hidden" name="commissionIdfeedback" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" value="<%=commissionWork.getCommissionId()%>">
                                            </div>
                                            <div>
                                                <input type="hidden" id = "myrate" name="myrate" value="0">
                                            </div><!-- comment -->
                                            <div class="flex items-center">
                                                <button type="button" onclick="window.history.back();" class="mr-3 group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                                    <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.707l-3-3a1 1 0 00-1.414 0l-3 3a1 1 0 001.414 1.414L9 9.414V13a1 1 0 102 0V9.414l1.293 1.293a1 1 0 001.414-1.414z" clip-rule="evenodd" />
                                                        </svg>
                                                    </span>
                                                    Cancel
                                                </button><!-- comment --><button type="submit" name="action" value="addFeedback" onclick=success() class="mr-3 group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                                    <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.707l-3-3a1 1 0 00-1.414 0l-3 3a1 1 0 001.414 1.414L9 9.414V13a1 1 0 102 0V9.414l1.293 1.293a1 1 0 001.414-1.414z" clip-rule="evenodd" />
                                                        </svg>
                                                    </span>
                                                    Submit
                                                </button>

                                            </div>
                                        </div>

                                </div>
                            </div>
                            </form>
                        </div>



                        <br><!-- comment -->       
                        <br>
                        <div class="p-10 grid grid-cols-12 sm:grid-cols-10 md:grid-cols-1 lg:grid-cols-3 xl:grid-cols-12 gap-5">

                        </div><!-- comment -->        
                        <script>
                            function success() {
                                alert("Feedback added successfully!");
                            }
                        </script>

                        <script>
                            function myReset() {
                                $("#st1").css("color", "black");
                                $("#st2").css("color", "black");
                                $("#st3").css("color", "black");
                                $("#st4").css("color", "black");
                                $("#st5").css("color", "black");
                                $("#st0").css("color", "#ff0000");
                                document.getElementById("myrate").value = "0";
                            }
                        </script>
                        <script>
                            function myRate1() {
                                $("#st1").css("color", "#ffa500");
                                $("#st2").css("color", "black");
                                $("#st3").css("color", "black");
                                $("#st4").css("color", "black");
                                $("#st5").css("color", "black");
                                $("#st0").css("color", "#ff0000");
                                document.getElementById("myrate").value = "1";
                            }
                        </script>
                        <script>
                            function myRate2() {
                                $("#st1").css("color", "#ffa500");
                                $("#st2").css("color", "#ffa500");
                                $("#st3").css("color", "black");
                                $("#st4").css("color", "black");
                                $("#st5").css("color", "black");
                                $("#st0").css("color", "#ff0000");
                                document.getElementById("myrate").value = "2";
                            }
                        </script>
                        <script>
                            function myRate3() {
                                $("#st1").css("color", "#ffa500");
                                $("#st2").css("color", "#ffa500");
                                $("#st3").css("color", "#ffa500");
                                $("#st4").css("color", "black");
                                $("#st5").css("color", "black");
                                $("#st0").css("color", "#ff0000");
                                document.getElementById("myrate").value = "3";
                            }
                        </script>
                        <script>
                            function myRate4() {
                                $("#st1").css("color", "#ffa500");
                                $("#st2").css("color", "#ffa500");
                                $("#st3").css("color", "#ffa500");
                                $("#st4").css("color", "#ffa500");
                                $("#st5").css("color", "black");
                                $("#st0").css("color", "#ff0000");
                                document.getElementById("myrate").value = "4";
                            }
                        </script>
                        <script>
                            function myRate5() {
                                $("#st1").css("color", "#ffa500");
                                $("#st2").css("color", "#ffa500");
                                $("#st3").css("color", "#ffa500");
                                $("#st4").css("color", "#ffa500");
                                $("#st5").css("color", "#ffa500");
                                $("#st0").css("color", "#ff0000");
                                document.getElementById("myrate").value = "5";

                            }
                        </script>

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

                        <script>
                            $(function () {
                                var fields = $('#calculateQuantity :input').change(calculate);
                                //var transdate = $('#transdate').val();

                                function calculate() {
                                    var qtyvalue = 0;
                                    var drawprice = 0;
                                    var ttlamount = 0;
                                    var bgcolourPrice = 0;
                                    //fields.each(function () {
                                    qtyvalue = +$(this).val();
                                    drawprice = +$('#price').val();
                                    
                                    bgcolourPrice = +$('#bgPrice').val();

                                    //drawprice = +$(this).price.var name = value;;
                                    //drawprice += +$(this).val();
                                    //);
                                    //qtyval = qtyvalue ;//* drawprice;

                                    ttlamount = (qtyvalue * drawprice) + bgcolourPrice + 10;

                                    //drawprice = drawprice * 100;//* drawprice;
                                    //$('#drawprice').html(drawprice.toFixed(2));
                                    $('#qty').html(qtyvalue.toFixed(0));
                                    $('#amt').html(ttlamount.toFixed(2));
                                }
                            });
                        </script>
                        </html>
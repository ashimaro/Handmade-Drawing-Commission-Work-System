<%-- 
    Document   : feedback
    Created on : Jan 5, 2022, 9:40:56 AM
    Author     : Ashi
--%>

<%@page import="dao.CommissionDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Feedback"%>
<%@page import="model.User"%>
<%@page import="model.commissionWork"%>
<%@page import="dao.FeedbackDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Feedback</title>
        <link  href ="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" media="all">
        <link href="css/addDrawing.css" rel="stylesheet" media="all">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" rel="stylesheet" media="all">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet" media="all">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"rel="stylesheet" media="all">
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }


            input[type=number] {
                -moz-appearance: textfield;


            </style>


        </head>
        <body>
            <div class="p-10">
                <%
                    User user = (User) request.getSession().getAttribute("user");
                    int userId = user.getUserId();
                    commissionWork commissionWork = new commissionWork();

                    int commissionId = Integer.parseInt(request.getParameter("id"));
                    CommissionDAO commissionDAO = new CommissionDAO();
                    commissionWork = commissionDAO.retrievecommissionWorkById(commissionId);

                %>
                <div class="max-w-7xl mx-auto">
                    
                    <div class="border-gray-300 lg:border-l-0 lg: bg-white rounded-3xl p-4 flex justify-between leading-normal">

                            <img class="w-auto h-56 mr-4"  src="image.jsp?id=<%=commissionWork.getCommissionId()%>" alt="Broken">
                            
                            <div class="mb-8">
                                <div class="text-gray-900 font-bold text-xl mb-2">
                                    <%=commissionWork.getCommissionName()%>
                                </div>
                                <p class="text-sm text-gray-600 flex ">
                                    RM<%=commissionWork.getCommissionPrice()%>0
                                </p>
                                <br>
                                <p class="text-gray-700 text-base">
                                    <%=commissionWork.getCommissionDesc()%>
                                </p>
                            </div>
                            <div class="container">
  <span id="rateMe2"  class="empty-stars"></span>
</div>

<!-- rating.js file -->
<script src="js/addons/rating.js"></script>
                        </div>
                    </div>
                </div>
                <br>
                <div class="bg-gray-100 px-6 py-8 rounded-t-3xl shadow-md text-black w-full">



                    <form class="mt-8 space-y-6" action="<%=request.getContextPath()%>/FeedbackController?" method="POST" >
                        <div class="rounded-md shadow-sm -space-y-px">
                            
                            
              
                            
                            
                            <div>
                                <label class="sr-only">Feedback</label>
                                <input type="text" name="feedback" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Add your feedback">
                            </div>
                            <br>
                            <div>
                                <input type="hidden" name="userId" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" value="<%=user.getUserId()%>">
                            </div>
                            <div>
                                <input type="hidden" name="commissionId" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" value="<%=commissionWork.getCommissionId()%>">
                            </div>
                            <div class="flex items-center">
                                <button type="submit" name="action" value="addFeedback" onclick=success() class="mr-3 group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                    <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.707l-3-3a1 1 0 00-1.414 0l-3 3a1 1 0 001.414 1.414L9 9.414V13a1 1 0 102 0V9.414l1.293 1.293a1 1 0 001.414-1.414z" clip-rule="evenodd" />
                                        </svg>
                                    </span>
                                    Submit
                                </button>
                                <button type="button" onclick="window.history.back();" class="mr-3 group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                    <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.707l-3-3a1 1 0 00-1.414 0l-3 3a1 1 0 001.414 1.414L9 9.414V13a1 1 0 102 0V9.414l1.293 1.293a1 1 0 001.414-1.414z" clip-rule="evenodd" />
                                        </svg>
                                    </span>
                                    Cancel
                                </button>
                            </div>
                        </div>
                    </form>
                           
                </div>

                <script>
                    function success() {
                        alert("Feedback added successfully!");
                    }
                </script>

            </body>
        </html>

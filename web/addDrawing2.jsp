<%-- 
    Document   : addDrawing2
    Created on : Jan 24, 2022, 9:47:16 AM
    Author     : Ashi
--%>

<%@page import="java.text.NumberFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add CW</title>
        <link  href ="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" media="all">
        <link href="css/addDrawing.css" rel="stylesheet" media="all">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" rel="stylesheet" media="all">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet" media="all">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"rel="stylesheet" media="all">
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
            <%
                User user = (User) request.getSession().getAttribute("user");
            %>

            <%
                NumberFormat nf = NumberFormat.getInstance();
                nf.setMaximumFractionDigits(2);
                nf.setMinimumFractionDigits(2);
            %>
            <div class="container-fluid px-1 py-5 mx-auto">
                <div class="row d-flex justify-content-center">
                    <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
                        <h3 style="color:white;">Share the details of your drawing commission work here</h3>

                        <div class="card">
                            <h5 class="text-center mb-4">Hello <%=user.getName()%> !</h5>

                            <form class="form-card" action="<%=request.getContextPath()%>/CommissionController" method="POST" enctype="multipart/form-data">
                                <div class="row justify-content-between text-left">

                                    <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Drawing Commission Name<span class="text-danger"> *</span></label> 
                                        <input type="text"  name="commissionName" placeholder="Eg: Sketch Drawing" required > </div>

                                    <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Price (RM)<span class="text-danger"> *</span></label>
                                        <input type="number" min="1" name="commissionPrice" placeholder="Eg : 40" required> </div>
                                </div>



                                <div class="row justify-content-between text-left">
                                    <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Background Charge (RM)<span class="text-danger"> *</span></label>
                                        <input type="number" min="1"  name="commissionBackground" placeholder="Eg : 10" required> </div>

                                    <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Description<span class="text-danger"> *</span></label>
                                        <input type="text"  name="commissionDesc" placeholder="Eg: I draw head until shoulder only." required> </div>
                                </div>


                                <div class="row justify-content-between text-left">
                                    <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Add your Drawing<span class="text-danger"> *</span></label>
                                        <input type="file" name="commissionImage" required> </div>

                                    <input type="hidden"  name="userId" value="<%=user.getUserId()%>"> 
                                </div>

                                <div class="row justify-content-between text-left">
                                    <div class="tacbox">
                                        <input id="checkbox" type="checkbox" required>
                                        <label for="checkbox" > I agree to these <a href="termsAndConditions.jsp">Terms and Conditions</a><span class="text-danger">*</span></label>
                                    </div>
                                </div>

                                <div class="row justify-content-between text-left">
                                    <div class="form-group col-sm-6 flex-column d-flex">
                                        <p><span class="text-danger">*</span>Required field.</p>
                                    </div>
                                </div>


                                <div class="row justify-content-end">
                                    <div class="form-group col-sm-6"><div id="success" ><button type="submit" name='action' value='register' class="btn-block btn-primary" onclick=success() >Add </button></div></div>

                                    <div class="form-group col-sm-6"> <button type="button" class="btn-block btn-primary" onclick="window.history.back();" >Cancel </button> </div>


                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                function success() {
                    alert("New Drawing Commission Work is added successfully!");
                }
            </script>
        </body>
    </html>
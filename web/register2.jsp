<%-- 
    Document   : register2
    Created on : Jan 24, 2022, 9:47:16 AM
    Author     : Ashi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link href ="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" media="all">
        <link href="css/registerCss.css" rel="stylesheet" media="all">
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

            <div class="container-fluid px-1 py-5 mx-auto">
                <div class="row d-flex justify-content-center">
                    <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
                        <h3 style="color:black;"> Welcome to HDCW!</h3>

                        <div class="card">
                            <h5 class="text-center mb-4"> Register Here</h5>

                            <form class="form-card" action="<%=request.getContextPath()%>/UserController" method="POST">
                                <center> <span style="color:red">${error}</span></center>

                                    <div class="row justify-content-between text-left">
                                        <input type="hidden" name="remember" value="true">
                                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Your Name<span class="text-danger"> *</span></label> 
                                            <input type="text"  name="name" placeholder="Nafisah Binti Samad" required > </div>

                                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Email<span class="text-danger"> *</span></label>
                                            <input type="email" name="email" placeholder="nafisah99@gmail.com" required> </div>
                                    </div>



                                    <div class="row justify-content-between text-left">
                                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Password<span class="text-danger"> *</span></label>
                                            <input type="password"  name="password" placeholder="password" required> </div>

                                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Address<span class="text-danger"> *</span></label>
                                            <input type="text"  name="address" placeholder="No 3 , Taman Kudamas" required> </div>
                                    </div>

                                    <div class="row justify-content-between text-left">
                                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Postcode<span class="text-danger"> *</span></label>
                                            <input type="text"  name="postcode" placeholder="35300" required> </div>

                                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">City<span class="text-danger"> *</span></label>
                                            <input type="text"  name="city" placeholder="Tapah" required> </div>
                                    </div>

                                    <div class="row justify-content-between text-left">
                                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">State<span class="text-danger"> *</span></label>
                                            <input type="text"  name="state" placeholder="Perak" required> </div>

                                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Your Phone Number<span class="text-danger"> *</span></label>
                                            <input type="text" name="phoneNo" placeholder="01xxxxxxxx" required> </div>
                                    </div>
                                    <div class="row justify-content-between text-left">
                                        <div class="form-group col-sm-6 flex-column d-flex">
                                            <p><span class="text-danger">*</span>Required field.</p>
                                        </div>
                                    </div>

                                    <div class="row justify-content-end">
                                        <div class="form-group col-sm-6"><div id="success" ><button type="submit" value='login' class="btn-block btn-primary" onclick="window.location.href = './index.jsp';" >Login</button></div></div>
                                        <div class="form-group col-sm-6"><div id="success" ><button type="submit" name='action' value='register' class="btn-block btn-primary" onclick=success() >Register</button></div></div>
                                    </div>                        

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <script>
                    function success() {
                        alert("Welcome to HDCW !");
                    }
                </script>
            </body>
        </html>

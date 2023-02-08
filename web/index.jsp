<%-- 
    Document   : login
    Created on : Jun 11, 2021, 9:30:55 AM
    Author     : ASHI
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HDCW - Home</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="css/userStyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="box">
                <img class="avatar" src="img/avatar.png">
                <h1>
                    Login Account</h1>
                <form action="UserController" method="post">
                    <center> <span style="color:red">${error}</span></center>
                    <p>Email</p>
                    <input type="text"  name="email" required>
                    <p>Password</p>
                    <input type="password" name="password" required>

                    <input type="submit" name="action" value="Login">

                    <a href="register2.jsp">Create New Account</a>
                </form>


            </div>
        </div>

    </body>
</html>
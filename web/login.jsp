<%--
Created by IntelliJ IDEA.
Date: 2016/4/1
Time: 23:34
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css"/>
    <style>
        body {
            font-family: 'microsoft yahei', Arial, sans-serif;
            background-color: #CCCCCC;
        }
        .row {
            padding: 20px 0;
        }
        .loginpanel {
            text-align: center;
            width: 300px;
            border-radius: 0.5rem;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
        }
        input {
            width: 100%;
            margin-bottom: 17px;
            padding: 15px;
            background-color: #ECF4F4;
            border-radius: 2px;
            border: none;
        }
        h2 {
            margin-bottom: 20px;
            font-weight: normal;
            color: black;
        }
        .btn {
            border-radius: 2px;
            padding: 10px;
        }
        .btn span {
            font-size: 27px;
            color: white;
        }

        .buttonwrapper {
            position: relative;
            overflow: hidden;
            height: 50px;
        }

        .lockbutton {
            font-size: 27px;
            color: white;
            padding: 10px;
            width: 100%;
            position: absolute;
            top: 0;
            left: 0;
            border-radius: 2px;
            background-color: #d9534f;
        }
        .loginbutton {
            width: 100%;
            -webkit-border-top-right-radius: 0;
            -webkit-border-bottom-right-radius: 0;
            -moz-border-radius-topright: 0;
            -moz-border-radius-bottomright: 0;
            border-top-right-radius: 0;
            border-bottom-right-radius: 0;
            left: -260px;
            position: absolute;
            top: 0;
        }
    </style>
    <script type="text/javascript" src="./js/jquery-2.0.2.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
</head>
<body>

<!-- Interactive Login - START -->
<div class="container-fluid">
    <div class="row">
        <form class="loginpanel" action="registerUser" method="POST">
            <h2>登录</h2>
            <div>
                <input name="user_id" id="username" type="text" placeholder="登录账号" onkeypress="check_values();">
                <input name="wx_id" id="password" type="password" placeholder="输入密码" onkeypress="check_values();">
                <div class="buttonwrapper">
                    <button id="loginbtn" type="submit" class="btn btn-success loginbutton">
                        <span class="glyphicon glyphicon-ok"></span>
                    </button>
                    <span id="lockbtn" class="glyphicon glyphicon-lock lockbutton"></span>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- Interactive Login - END -->

<script type="text/javascript">
    function check_values() {
        if ($("#username").val().length != 0 && $("#password").val().length != 0) {
            $("#loginbtn").animate({left: '0', duration: 'slow'});
            $("#lockbtn").animate({left: '260px', duration: 'slow'});
        }
    }

    $("#username,#password").blur(function(){
        if ($("#username").val().length == 0 || $("#password").val().length == 0) {
            $("#loginbtn").animate({left: '-260px', duration: 'slow'});
            $("#lockbtn").animate({left: '0', duration: 'slow'});
        }
    });
</script>
</body>
</html>
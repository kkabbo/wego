<%--
Created by IntelliJ IDEA.
Date: 2016/4/1
Time: 23:34
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>支付状态</title>
    <link rel="SHORTCUT ICON" href="./images/logo.ico"/>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no"/>

    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css"/>
    <link rel="stylesheet" href="./css/common.css">
    <style>
        .container{
            background-color: #f5f5f5;
            padding-bottom: 40px;
            padding-top: 50px;
        }
        h5{
            color: #8c8c8c;
        }
        .glyphicon-ok-sign{
            color: green;
            font-size: 7em;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <div class="row">
                <div class="col-xs-12 text-center">
                    <span class="glyphicon glyphicon-ok-sign"></span>
                    <h4>购买成功</h4>
                    <h5>我们将尽快为你发货</h5>
                </div>
            </div>

            <div class="row" style="margin-top: 20px">
                <div class="col-xs-4 col-xs-offset-1 " style="padding: 0">
                    <a href="order_getOrders"><button class="btn btn-primary btn-block">查看订单</button></a>
                </div>
                <div class="col-xs-4 col-xs-offset-2 " style="padding: 0">
                    <a href="products.jsp"><button class="btn btn-primary btn-block">继续逛逛</button></a>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="./js/jquery-2.0.2.js"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
</body>
</html>
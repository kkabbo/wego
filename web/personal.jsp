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
    <title>个人中心</title>
    <link rel="SHORTCUT ICON" href="./images/logo.ico"/>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no"/>

    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css"/>
    <link rel="stylesheet" href="./css/common.css">

    <style>
        .container-fluid {
            padding-bottom: 100px;
        }

        .head-img {
            background: url("./images/bg.jpg") center center;
            background-size: cover;
            padding: 50px 0 10px 0;
        }

        .head-img h5 {
            color: white;
        }

        .head-img .glyphicon-user {
            padding: 7px;
            color: white;
            border: 1px solid white;
            border-radius: 50%;
            cursor: pointer;
        }

        .personal-list {
            background-color: white;
            padding: 10px 0;
            margin-bottom: 10px;
        }

        .personal-list h3 {
            margin: 5px 0;
        }

        .personal-list h5 {
            margin: 5px 0;
            color: #3b4249;
        }

        .personal-list div {
            cursor: pointer;
            border-right: 1px solid #ccc;
        }

        .personal-list div:last-child {
            border-right: none;
        }

        .personal-item {
            margin-bottom: 3px;
            background-color: white;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <div class="row head-img">
                <div class="col-xs-4 col-xs-offset-4 text-center">
                    <img src="./images/lemon.jpg" class="img-responsive img-circle center-block" alt="">
                    <h5><strong>15820599475</strong></h5>
                </div>
                <div class="col-xs-5 text-center">
                    <span class="glyphicon glyphicon-user"></span>
                    <h5>个人资料</h5>
                </div>
            </div>
            <div class="row text-center personal-list">
                <div class="col-xs-4">
                    <a href="order_getOrders">
                        <h3><span class="text-danger glyphicon glyphicon-list-alt"></span></h3>
                    </a>
                    <h5>我的订单</h5>
                </div>

                <div class="col-xs-4">
                    <a href="products.jsp">
                        <h3><span class="text-danger glyphicon glyphicon-heart"></span></h3>
                    </a>
                    <h5>购物中心</h5>
                </div>
                <div class="col-xs-4">
                    <a href="products.jsp">
                        <h3><span class="text-success glyphicon glyphicon-shopping-cart"></span></h3>
                    </a>
                    <h5>购物车</h5>
                </div>
            </div>
            <div class="row ">
                <div class="col-xs-12">
                    <div class="row personal-item">
                        <div class="col-xs-8">
                            <h5>
                                <span class="glyphicon glyphicon-user"></span>
                                我的XXX
                            </h5>
                        </div>
                        <div class="col-xs-4 text-right">
                            <h5>
                                <span class="glyphicon glyphicon-menu-right"></span>
                            </h5>
                        </div>
                    </div>

                    <a href="user_getMyAddress">
                        <div class="row personal-item">
                            <div class="col-xs-8">
                                <h5>
                                    <span class="glyphicon glyphicon-map-marker"></span>
                                    我的收货地址
                                </h5>
                            </div>
                            <div class="col-xs-4 text-right">
                                <h5>
                                    <span class="glyphicon glyphicon-menu-right"></span>
                                </h5>
                            </div>
                        </div>
                    </a>

                    <div class="row personal-item">
                        <div class="col-xs-8">
                            <h5>
                                <span class="glyphicon glyphicon-info-sign"></span>
                                帮助中心
                            </h5>
                        </div>
                        <div class="col-xs-4 text-right">
                            <h5>
                                <span class="glyphicon glyphicon-menu-right"></span>
                            </h5>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" style="margin-top: 20px">
                <div class="col-xs-12">
                    <button class="btn btn-danger btn-block">注销</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="./js/jquery-2.0.2.js"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
</body>
</html>
<%--
Created by IntelliJ IDEA.
Date: 2016/4/1
Time: 23:34
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商品详情</title>
    <link rel="SHORTCUT ICON" href="./images/logo.ico"/>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no"/>

    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css"/>
    <link rel="stylesheet" href="./css/common.css">
    <style>
        img {
            width: 100%;
        }

        .good-img {
            max-height: 250px;
            overflow: hidden;
            position: relative;
        }

        .good-info {
            background-color: white;
        }

        .good-price {
            color: red;
        }

        .good-num {
            color: #999;
        }

        strong {
            font-size: 2em;
        }

        .good-content {
            background-color: white;
            margin-top: 10px;
            padding: 0;
            overflow: hidden;
        }

        .good-content h4 {
            margin: 0;
            padding: 5px 10px;
            border-bottom: 2px solid #f8f8f8;
        }

        hr {
            border: 1px solid #ccc;
        }

        .go-back {
            position: absolute;
            z-index: 999;
            top: 15px;
            left: 15px;
            cursor: pointer;
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 50%;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <div class="row">
                <div class="col-xs-12 good-img" style="padding: 0">
                    <span onClick="javascript :history.back(-1);" class="glyphicon glyphicon-menu-left go-back"></span>
                    <img src="./uploadImages/<s:property value='#request.product.images'/>" class="img-responsive center-block" alt="">
                </div>
                <div class="col-xs-12">
                    <div class="row good-info">
                        <div class="col-xs-12 ">
                            <h4 class="good-name"><s:property value="#request.product.name"/></h4>
                            <h5 class="good-price">￥<strong><s:property value="#request.product.normalPrice"/></strong></h5>
                            <h5 class="text-muted">
                                <del>市场价：￥<s:property value="#request.product.marketPrice"/></del>
                            </h5>
                        </div>
                        <div class="col-xs-4">
                            <h5 class="good-num">库存:<s:property value="#request.product.stock"/></h5>
                        </div>
                        <div class="col-xs-4">
                            <h5 class="good-num">销量 <s:property value="#request.product.sellCount"/> 件</h5>
                        </div>
                        <div class="col-xs-4 text-right">
                            <h5 class="good-num">北理工</h5>
                        </div>
                    </div>
                    <div class="row">
                        <h5>
                            <span class="glyphicon glyphicon-ok-circle text-danger"></span>正品保障
                            <span class="glyphicon glyphicon-ok-circle text-danger"></span>极速退款
                            <span class="glyphicon glyphicon-ok-circle text-danger"></span>7天退换
                        </h5>
                    </div>
                </div>

                <div class="col-xs-12 good-content">
                    <h4>商品介绍:</h4>
                    <s:property value="#request.product.content"/>
                </div>

                <div class="col-xs-12 text-center">
                    <h5>已经到底啦</h5>
                </div>

            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="./js/jquery-2.0.2.js"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
</body>
</html>
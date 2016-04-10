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
    <title>我的订单</title>
    <link rel="SHORTCUT ICON" href="./images/logo.ico"/>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no"/>

    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css"/>
    <link rel="stylesheet" href="./css/common.css">
    <style>
        .order-type {
            background-color: white;
            border-bottom: 1px solid #ccc;
            margin-bottom: 10px;
            cursor: pointer;
        }

        .order-type .active {
            border-bottom: 2px solid red;
        }

        .order {
            background-color: white;
            margin-bottom: 10px;
            padding-bottom: 10px;
        }

        .order-success {
            color: green;
        }

        .order-unpaid {
            color: red;
        }

        .glyphicon-map-marker {
            color: green;
        }

    </style>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <input id="show-orders-type" type="hidden" value="<s:property value='#request.showOrdersType'/>">
            <div class="row order-type text-center">
                <div class="col-xs-3" data-orderType="all">
                    <h5>全部</h5>
                </div>
                <div class="col-xs-3" data-orderType="unpaid">
                    <h5>待付款</h5>
                </div>
                <div class="col-xs-3" data-orderType="paid">
                    <h5>待收货</h5>
                </div>
                <div class="col-xs-3" data-orderType="success">
                    <h5>已完成</h5>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12 orders">
                    <s:iterator value="#request.orderList" var="order">
                        <div class="row order">
                            <a href="order_getOrderItem?id=<s:property value='#order.id'/>">
                                <div class="col-xs-7">
                                    <h5 class="order-id">
                                        <span class="glyphicon glyphicon-map-marker"></span>
                                        wego2016<s:property value='#order.id'/>
                                    </h5>
                                </div>
                            </a>
                            <div class="col-xs-5 text-right">
                                <s:if test="%{#order.status == 'paid' }">
                                    <h5 class="order-success"><b>待收货</b></h5>
                                </s:if>
                                <s:if test="%{#order.status == 'unpaid' }">
                                    <h5 class="order-unpaid"><b>待付款</b></h5>
                                </s:if>
                                <s:if test="%{#order.status == 'success' }">
                                    <h5 class="text-muted"><b>已完成</b></h5>
                                </s:if>
                                <s:if test="%{#order.status == 'cancel' }">
                                    <h5 class="text-muted"><b>已取消</b></h5>
                                </s:if>
                            </div>
                            <div class="col-xs-12 text-right">
                                <h5 class="text-success">合计:￥<s:property value='#order.totalMoney'/></h5>
                                <h5><b>送至</b><s:property value='#order.address'/></h5>
                            </div>
                            <div class="col-xs-12 text-right">
                                <span class="text-muted"><s:property value='#order.orderDate'/></span>
                                <s:if test="%{#order.status == 'unpaid' }">
                                    <button class="btn btn-default btn-check cancel" data-oid="<s:property value='#order.id'/>">
                                        取消订单
                                    </button>
                                    <a href="order_toPay?id=<s:property value='#order.id'/>">
                                        <button class="btn btn-danger btn-check">支付</button>
                                    </a>
                                </s:if>
                                <s:if test="%{#order.status == 'paid' }">
                                    <button class="btn btn-default btn-check confirm"
                                            data-oid="<s:property value='#order.id'/>">确认收货
                                    </button>
                                </s:if>
                            </div>
                        </div>

                    </s:iterator>
                </div>

                <div class="col-xs-12">
                    <h6 class="text-muted text-center">已经没有更多订单了！</h6>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="goback">
     <a href="personal.jsp"><span class="glyphicon glyphicon-menu-left"></span></a>
</div>

<script type="text/javascript" src="./js/jquery-2.0.2.js"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        var orderType = $("#show-orders-type").val();
        var $orderType = $(".order-type").children("div[data-orderType='" + orderType + "']");
        $orderType.addClass("active");
    });

    //订单类型
    $(".order-type>div").click(function () {
        $(this).addClass("active").siblings("div").removeClass("active");
        var orderType = $(this).attr("data-orderType");
        location.href = "order_getOrders?type=" + orderType;
    });

    //取消订单
    $(".cancel").click(function () {
        var oid = $(this).attr("data-oid");
        if (confirm("确认取消订单？")) {
            location.href = "order_cancelOrder?id=" + oid;
        }
    });
    //确认收货
    $(".confirm").click(function () {
        var oid = $(this).attr("data-oid");
        if (confirm("确认收货？")) {
            location.href = "order_confirmOrder?id=" + oid;
        }
    });


</script>
</body>
</html>
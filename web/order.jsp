<%--
  Created by IntelliJ IDEA.
  Date: 2016/4/8
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>订单详情</title>
    <link rel="SHORTCUT ICON" href="images/logo.ico"/>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no"/>

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/common.css">

    <style>
        .col-lg-8 > .row {
            background-color: white;
            border-bottom: 1px solid #ccc;
            margin-bottom: 15px;
        }

        .btn {
            margin-bottom: 10px;
        }

        .good {
            border-bottom: 1px solid #ccc;
            padding-top: 8px;
            padding-bottom: 8px;
        }

        .good:last-child {
            border-bottom: none;
        }

        .good .good-name {
            max-height: 14px;
            overflow: hidden;
        }

        .good h6 {
            margin: 2px 0;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <div class="row seller">
                <div class="col-xs-12">
                    <h6>
                        <span class="text-muted">订单状态：</span>
                        <span class="text-info">
                            <s:if test="%{#request.order.status == 'unpaid' }">待付款</s:if>
                            <s:if test="%{#request.order.status == 'paid' }">待收货</s:if>
                            <s:if test="%{#request.order.status == 'success' }">已完成</s:if>
                            <s:if test="%{#request.order.status == 'cancel' }">已取消</s:if>
                        </span>
                    </h6>
                    <h6><span class="text-muted">订单编号：</span>wego2016<s:property value="#request.order.id"/></h6>
                    <h6><span class="text-muted">下单时间：</span><s:property value="#request.order.orderDate"/></h6>
                </div>
                <s:if test="%{#request.order.status == 'unpaid' }">
                    <div class="col-xs-12">
                        <a href="order_toPay?id=<s:property value='#request.order.id'/>">
                            <button class="btn btn-danger btn-block">去支付</button>
                        </a>
                    </div>

                    <div class="col-xs-6">
                        <button class="btn cancel btn-default btn-block" data-oid="<s:property value='#request.order.id'/>">申请取消订单</button>
                    </div>
                    <div class="col-xs-6">
                        <button class="btn re-order btn-primary btn-block" data-oid="<s:property value='#request.order.id'/>">重新下单</button>
                    </div>
                    <div class="col-xs-12">
                        <h6 class="text-muted">
                            <span class="glyphicon glyphicon-exclamation-sign"></span>
                            重新下单是把商品放回购物车，请到购物车查看
                        </h6>
                    </div>
                </s:if>
                <s:if test="%{#request.order.status == 'paid' }">
                    <div class="col-xs-12">
                        <button class="confirm btn btn-primary btn-block" data-oid="<s:property value='#request.order.id'/>">确认收货</button>
                    </div>
                </s:if>
                <s:if test="%{#request.order.status == 'success' }">
                    <div class="col-xs-12">
                        <h5 class="text-success text-center">交易成功</h5>
                    </div>
                </s:if>
                <s:if test="%{#request.order.status == 'cancel' }">
                    <div class="col-xs-12">
                        <h5 class="text-muted text-center">您的订单已取消！</h5>
                    </div>
                </s:if>
            </div>

            <div class="row buyer">
                <div class="col-xs-12 ">
                    <h6><span class="text-muted">供货商家：</span>北理工珠海学院微购集团有限公司</h6>
                    <h6><span class="text-muted">订单总价：</span>￥<s:property value="#request.order.totalMoney"/></h6>
                    <h6><span class="text-muted">收货地址：</span><s:property value="#request.order.address"/></h6>
                    <h6><span class="text-muted">收货人：</span><s:property value="#request.order.contacts"/></h6>
                    <h6><span class="text-muted">联系号码：</span><s:property value="#request.order.phone"/></h6>
                </div>
            </div>


            <div class="row goods">
                <div class="col-xs-12" style="border-bottom: 1px solid #ccc">
                    <h5><span class="text-danger glyphicon glyphicon-list"></span>&nbsp;&nbsp;商品信息</h5>
                </div>
                <div class="col-xs-12">
                    <s:iterator value="#request.itemList" var="item">
                        <div class="row good">
                            <div class="col-xs-3">
                                <a href="product_getProductInfo?id=<s:property value='#item.product.id'/>">
                                <img src="./uploadImages/<s:property value='#item.product.images'/>"
                                     class="img-responsive center-block" alt="">
                                    </a>
                            </div>
                            <div class="col-xs-9 text-left">
                                <h6 class="good-name"><s:property value="#item.product.name"/></h6>
                                <h6 class="text-danger">价格：$<span class="good-price"><s:property
                                        value="#item.price"/></span></h6>
                                <h6 class="text-muted"><s:property value="#item.count"/>件</h6>
                            </div>
                        </div>
                    </s:iterator>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-6 text-left"><h6>商品总价：</h6></div>
                <div class="col-xs-6 text-right text-danger"><h6>￥<s:property value="#request.order.totalMoney"/></h6>
                </div>
                <div class="col-xs-6 text-left"><h6>优惠：</h6></div>
                <div class="col-xs-6 text-right text-danger"><h6>-￥0.0</h6></div>
                <div class="col-xs-6 text-left"><h6>邮费：</h6></div>
                <div class="col-xs-6 text-right text-danger"><h6>￥0.0</h6></div>
                <div class="col-xs-12 text-right" style="border-top: 1px solid #ccc">
                    <h6>订单总价：<span class="text-danger">￥<s:property value="#request.order.totalMoney"/></span></h6>
                </div>
            </div>

            <h6 class="text-center text-muted">已经到底啦~</h6>
        </div>
    </div>

</div>

<script type="text/javascript" src="js/jquery-2.0.2.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script>
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

    //重新下单
    $(".re-order").click(function () {
        var oid = $(this).attr("data-oid");
        if (confirm("重新下单？")) {
            location.href = "order_reOrder?id=" + oid;
        }
    });

</script>
</body>
</html>
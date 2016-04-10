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
    <title>确认订单并支付</title>
    <link rel="SHORTCUT ICON" href="./images/logo.ico"/>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no"/>

    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css"/>
    <link rel="stylesheet" href="./css/common.css">
    <style>
        html, body {
            font-family: 'microsoft yahei', Arial, sans-serif;
            /*background-color: #FCFCFC;*/
            background-color: #F8F8F8;
            width: 100%;
            height: 100%;
        }
        .good {
            background-color: white;
            padding: 5px 0;
            margin-bottom: 5px;
            max-height: 105px;
            overflow: hidden;
            border-bottom: 1px solid #CCCCCC;
            border-top: 1px solid #CCCCCC;
        }
        .good .good-name {
            height: 45px;
            overflow: hidden;
        }
        .good .good-price {
            /*color: red;*/
            position: relative;
        }
        .good .good-price strong {
            color: red;
        }
        .promotion {
            padding: 0 10px;
            background-color: white;
            border-bottom: 1px solid #ccc;
            border-top: 1px solid #ccc;
            margin-top: 15px;
            margin-bottom: 15px;
        }
        .promotion .row {
            border-bottom: 1px solid #ccc;
        }
        .promotion .row:last-child {
            border-bottom: none;
        }
        .pay {
            padding-bottom: 100px;
        }
        .pay .btn {
            margin-top: 10px;
        }
        .pay strong {
            color: red;
        }
        .address {
            cursor: pointer;
        }
        .address h5 {
            margin: 4px 0;
            max-height: 15px;
            overflow: hidden;
        }
        /*.form-control {*/
        /*box-shadow: none;*/
        /*border: none;*/
        /*}*/

        /*.form-control:focus {*/
        /*box-shadow: none;*/
        /*}*/
    </style>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2 text-center">
            <div class="row">
                <div class="col-xs-12 address">
                    <div class="row">
                        <s:action name="user_getDefaultAddress" executeResult="false" namespace="/"> </s:action>
                        <s:if test='%{#request.defaultAddress == null }'>
                            <div class="col-xs-10 text-left">
                                <h4> ！请填写地址</h4>
                            </div>
                        </s:if>
                        <s:else>
                            <div class="col-xs-10 text-left">
                                <h5 class="full-address">
                                    <s:property value="#request.defaultAddress.province"/>
                                    <s:property value="#request.defaultAddress.city"/>
                                    <s:property value="#request.defaultAddress.county"/>
                                    <s:property value="#request.defaultAddress.address"/>
                                </h5>
                                <h5 class="contact">
                                    <s:property value="#request.defaultAddress.contacts"/>
                                    <s:property value="#request.defaultAddress.phone"/>
                                </h5>
                            </div>
                        </s:else>
                        <div class="col-xs-2">
                            <h4>
                                <span class="glyphicon glyphicon-menu-right"></span>
                            </h4>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 goods">

                    <s:action name="order_getCart" executeResult="false" namespace="/"> </s:action>
                    <s:iterator value="#request.salesitemList" var="salesitem">
                        <div class="row good">
                            <div class="col-xs-4 ">
                                <a href="product_getProductInfo?id=<s:property value='#salesitem.product.id'/>">
                                    <img src="./uploadImages/<s:property value='#salesitem.product.images'/>" alt=""
                                         class="img-responsive center-block">
                                </a>
                            </div>
                            <div class="col-xs-8 text-left">
                                <h5 class="good-name"><s:property value="#salesitem.product.name"/></h5>
                                <h5 class="good-price">￥<s:property value="#salesitem.price"/>
                                    X <s:property value="#salesitem.count"/>
                                </h5>
                                <h5 hidden class="good-pcs"><s:property value="#salesitem.count"/></h5>
                                <h5 hidden class="good-id"><s:property value="#salesitem.id"/></h5>
                            </div>
                        </div>
                    </s:iterator>
                </div>
            </div>
            <div class="row promotion">
                <div class="col-xs-12">
                    <div class="row text-right">
                        <div class="col-xs-4">
                            <h5 class="color-red">优惠:</h5>
                        </div>
                        <div class="col-xs-8">
                            <h5 class="color-red">-￥0</h5>
                        </div>
                    </div>
                    <div class="row text-right">
                        <div class="col-xs-4">
                            <h5>配送费:</h5>
                        </div>
                        <div class="col-xs-8 ">
                            <h5>￥0.00</h5>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row pay">
                <div class="col-xs-12 text-center">
                    <h4>总价：￥<strong><s:property value="#request.amount"/></strong></h4>
                    <input type="hidden" id="amount" value="<s:property value="#request.amount"/>">
                </div>
                <div class="col-xs-10 col-xs-offset-1">
                    <button class="btn btn-success btn-block" value="wechatpay">微信支付</button>
                </div>
                <div class="col-xs-10 col-xs-offset-1">
                    <button class="btn btn-danger btn-block" value="alipay">支付宝支付</button>
                </div>
                <div class="col-xs-10 col-xs-offset-1">
                    <button class="btn btn-primary btn-block" value="cod">货到付款</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Small modal -->
<div id="address" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
     aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel">请输入收货信息</h4>
            </div>
            <form action="user_addAddressOnPay" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <input type="text" name="address.contacts" class="form-control"
                                           placeholder="请输入联系人">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="address.phone" class="form-control" placeholder="请输入联系方式">
                                </div>
                                <div class="form-group">
                                    <select class="form-control" id="s_province" name="address.province"></select>
                                    <select class="form-control" id="s_city" name="address.city"></select>
                                    <select class="form-control" id="s_county" name="address.county"></select>
                                    <script class="resources library" src="js/area.js" type="text/javascript"></script>
                                    <script type="text/javascript">_init_area();</script>
                                </div>
                                <div class="form-group ">
                                <textarea class="form-control" name="address.address" placeholder="详细地址"
                                          id="address-address"
                                          style="resize: none"></textarea>
                                </div>
                                <%--<div class="form-group">--%>
                                <%--<div class="checkbox">--%>
                                <%--<label>--%>
                                <%--<input id="is-default" checked type="checkbox"> 是否默认地址--%>
                                <%--</label>--%>
                                <%--</div>--%>
                                <%--</div>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success btn-block">确认
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="./js/jquery-2.0.2.js"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script>
    $(document).ready(function(){
        var amount =$("#amount").val();
        amount = parseFloat(amount);
        if(amount == null || amount <=0){
            location.href="products.jsp"
        }
    });
    //增加地址
    $(".address").click(function () {
        $("#address").modal('show');
    });

    //支付
    $(".pay .btn").click(function () {
        var pay_type = $(this).val();
        var amount =$("#amount").val();
        if (confirm("确认支付？")) {
            location.href="order_placeAnOrder?payType="+pay_type+"&&amount="+amount;
        }
    });

</script>
</body>
</html>
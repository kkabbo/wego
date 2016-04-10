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
    <title>微购</title>
    <link rel="SHORTCUT ICON" href="./images/logo.ico"/>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no"/>

    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css"/>
    <link rel="stylesheet" href="./css/common.css">

    <style>
        .top > div {
            padding: 0;
            margin: 15px 0;
        }
        .user {
            font-size: 16px;
        }
        .good {
            padding: 5px 10px;
        }

        .good h5 {
            margin: 0;
            padding: 5px 0;
            background-color: white;
        }

        .good .good-name {
            max-height: 22px;
            overflow: hidden;
        }

        .good .good-price {
            color: red;
            font-weight: bold;
            padding-bottom: 8px;
            position: relative;
        }

        .good .glyphicon-plus, .good .glyphicon-minus {
            display: block;
            position: absolute;
            right: 10px;
            top: 5px;
            color: green;
            cursor: pointer;
        }

        .btn-default {
            border: 1px solid white;
        }

        .form-control {
            box-shadow: none;
            border: none;
        }

        .form-control:focus {
            box-shadow: none;
        }

        /*购物车*/
        #cart {
            position: fixed;
            right: 0;
            bottom: 80px;
            font-size: 20px;
            cursor: pointer;
            padding: 5px 10px;
            z-index: 99;
            border-radius: 5px;
        }

        #add-num {
            display: none;
            position: absolute;
            top: -20px;
            color: red;
            font-size: 14px;
            font-weight: bold;
        }

        #cart .glyphicon {
            color: white;
            position: relative;
            z-index: 99;
        }

        .cart-bg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0.7;
            background-color: black;
            border-radius: 5px;
        }

        #shopping-cart {
            display: none;
            padding-bottom: 45px;
        }

        .shopping-cart .good {
            background-color: white;
            margin-bottom: 5px;
        }

        .shopping-cart .good-price {
            padding-top: 8px;
        }

        .shopping-cart .glyphicon-minus {
            top: 10px;
            right: 0;
        }

        .account-bar {
            position: fixed;
            bottom: 0;
            left: 15px;
            width: 100%;
            background-color: #F0F0F0;
            padding: 5px 10px;
        }

        strong {
            color: red;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <div class="row top">
                <div class="col-xs-2 text-center">
                    <a href="personal.jsp">
                        <div class="user btn btn-block">
                            <span style="color: green" class="glyphicon glyphicon-user" aria-hidden="true"></span>
                        </div>
                    </a>
                </div>
                <div class="col-xs-10">
                    <form action="product_getProductsByName" method="post" enctype="multipart/form-data">
                        <div class="input-group">
                            <s:if test="%{#request.searchKey!=null && #request.searchKey != '' }">
                                <input type="text" class="form-control"
                                       placeholder="<s:property value="#request.searchKey"/>" name="product.name"
                                       value="">
                            </s:if>
                            <s:else>
                                <input type="text" class="form-control"
                                placeholder="Search for..." name="product.name"
                                value="">
                            </s:else>
                            <span class="input-group-btn" id="search">
                                <button class="btn btn-default" type="submit">
                                    <span style="color: green" class="glyphicon glyphicon-search"
                                          aria-hidden="true"></span>
                                </button>
                            </span>
                        </div>
                    </form>

                </div>
            </div>

            <div class="row">
                <div class="col-xs-12 text-center goods" id="goods">
                    <div class="row">
                        <%--<s:action name="product_getProducts" executeResult="false" namespace="/"> </s:action>--%>
                        <s:iterator value="#request.productList" var="product">
                            <div class="col-xs-6 good ">
                                <a href="product_getProductInfo?id=<s:property value='#product.id'/>"><img
                                        src="./uploadImages/<s:property value='#product.images'/>"
                                        alt=""
                                        class="img-responsive center-block"></a>
                                <h5 class="good-name text-left"><s:property value="#product.name"/></h5>
                                <h5 class="good-price text-left"
                                    data-price="<s:property value='#product.normalPrice'/>">
                                    ￥<s:property value="#product.normalPrice"/>
                                    <span class="glyphicon glyphicon-plus"></span>
                                </h5>
                                <h5 hidden class="good-id"><s:property value="#product.id"/></h5>
                            </div>
                        </s:iterator>
                    </div>
                    <div class="row" style="padding-top: 20px;padding-bottom: 50px">
                        <div class="col-xs-10 col-xs-offset-1" >
                            <a href="product_nextPage" class="btn btn-default btn-block">更多商品...</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--购物车-->
<div class="container-fluid" id="shopping-cart">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <div class="row">
                <div class="col-xs-12 shopping-cart">

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
                                    <span class="glyphicon glyphicon-minus"></span>
                                    X <s:property value="#salesitem.count"/>
                                </h5>
                                <h5 hidden class="good-pcs"><s:property value="#salesitem.count"/></h5>
                                <h5 hidden class="good-id"><s:property value="#salesitem.id"/></h5>
                            </div>
                        </div>
                    </s:iterator>
                </div>
            </div>

            <div class="row account-bar">
                <div class="col-xs-2 text-right" style="padding: 0">
                    <h5>共<span id="cart-num"><s:property value="#request.count"/></span>件</h5>
                </div>
                <div class="col-xs-6 text-right" style="padding: 0">
                    <h5>总计：<strong>￥<span id="cart-amount"><s:property value="#request.amount"/></span></strong></h5>
                </div>
                <div class="col-xs-4">
                    <button class="btn btn-danger btn-block" id="account">结算</button>
                </div>
            </div>
        </div>
    </div>
</div>


<div id="cart">
    <div id="add-num">+1</div>
    <span class="glyphicon glyphicon-shopping-cart"></span>
    <div class="cart-bg"></div>
</div>

<!-- Small modal -->
<div id="popup" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel">输入购买数量</h4>
            </div>
            <form action="order_addCart" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xs-12">
                                <input name="salesitem.product.id" id="good-id" hidden="hidden" type="text">
                                <input name="salesitem.price" id="good-price" hidden="hidden" type="text">
                                <input name="salesitem.count" id="good-pcs" type="text" class="form-control"
                                       placeholder="输入购买数量" value="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="addCart" type="submit" class="btn btn-success">加入购物车</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="./js/jquery-2.0.2.js"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {

    });
    //添加购物车数量
    $(".glyphicon-plus").click(function () {
        var goodPrice = $(this).parent(".good-price").attr("data-price");
        var goodId = $(this).parent(".good-price").siblings(".good-id").html();
        var $popup = $("#popup");
        $("#good-price").val(goodPrice);
        $("#good-id").val(goodId);
        $popup.modal();
    });
    //添加购物车
    $("#addCart").click(function () {
        $("#add-num").fadeIn();
        $("#add-num").fadeOut(2000);
    });

    //移除商品
    $(".glyphicon-minus").click(function () {
        var goodId = $(this).parent(".good-price").siblings(".good-id").html();
        if (goodId != null && goodId != "") {
            if (confirm("确定移除商品？")) {
                location.href = "order_deleteCart?id=" + goodId;
            }
        }
    });


    //结算
    $("#account").click(function () {
        var html = $(".shopping-cart").html();
        html = html.replace(/[ ]/g, "");//去掉空格
        html = html.replace(/[\r\n]/g, "");//去掉回车换行
        if (html == "" || html == null) {
            alert("购物车为空！");
        } else {
            location.href = "gopay.jsp";
        }
    });

    $(document).ready(function () {
        //查看购物车
        $("#cart").click(function () {
            if ($(this).children("span").hasClass("glyphicon-list")) {
                $("#shopping-cart").slideUp("slow");
                $(".goods").slideDown("slow");
                $(this).children("span").removeClass("glyphicon-list").addClass("glyphicon-shopping-cart");
            } else {
                $("#shopping-cart").slideDown("slow");
                $(".goods").slideUp("slow");
                $(this).children("span").removeClass("glyphicon-shopping-cart").addClass("glyphicon-list");
            }
        });
    });

</script>
</body>
</html>
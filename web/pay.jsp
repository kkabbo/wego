<%--
  Created by IntelliJ IDEA.
  Date: 2016/4/7
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>支付</title>
    <link rel="SHORTCUT ICON" href="images/logo.ico"/>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no"/>

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/common.css">

    <style>
        .container-fluid {
            padding-top: 10px;
        }

        .pay-info {
            background: white;
        }

        .col-lg-8 .row {
            margin-top: 20px;
            margin-bottom: 20px;
            padding-top: 5px;
            padding-bottom: 5px;
        }

    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <div class="row">
                <div class="col-xs-12 text-center">
                    <h5>微购商城订单：<s:property value="#request.orderId"/></h5>
                    <h1>￥<s:property value="#request.amount"/></h1>
                </div>
            </div>
            <div class="row text-right pay-info">
                <div class="col-xs-3 ">
                    <h5>收款方</h5>
                </div>
                <div class="col-xs-9">
                    <h5>微购商城</h5>
                </div>
                <div class="col-xs-3">
                    <h5>商&nbsp;&nbsp;品</h5>
                </div>
                <div class="col-xs-9">
                    <h5>微购商城订单：<s:property value="#request.orderId"/></h5>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-10 col-xs-offset-1">
                    <button class="btn btn-success btn-block" data-toggle="modal" data-target="#popup">支付</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Small modal -->
<div id="popup" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-xs">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title text-center" id="exampleModalLabel">请输入支付密码</h4>
            </div>
            <form action="order_pay" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xs-12">
                                <input type="password" class="text-center form-control">
                                <input name="salesorder.id" type="hidden" value="<s:property value="#request.id"/>">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-xs-6">
                            <button type="button" class="btn btn-block btn-default" data-dismiss="modal">
                                取&nbsp;&nbsp;消
                            </button>
                        </div>
                        <div class="col-xs-6">
                            <button type="submit" class="btn btn-block btn-success">支&nbsp;&nbsp;付</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<script type="text/javascript" src="js/jquery-2.0.2.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>
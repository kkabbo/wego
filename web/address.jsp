<%--
  Created by IntelliJ IDEA.
  Date: 2016/4/8
  Time: 23:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的收货地址</title>
    <link rel="SHORTCUT ICON" href="images/logo.ico"/>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no"/>

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/common.css">

    <style>
        .col-lg-8 > .row {
            background: white;
        }

        .col-lg-8 > .row:last-child {
            background: none;
            margin-top: 15px;
        }
        .delete{
            cursor: pointer;
        }
        .address{
            margin-bottom: 2px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">

            <s:iterator value="#request.addressList" var="address">
            <div class="row address">
                <div class="col-xs-10 text-left">
                    <h6>
                        <s:property value='#address.province'/>
                        <s:property value='#address.city'/>
                        <s:property value='#address.county'/>
                        <s:property value='#address.address'/>
                    </h6>
                    <h6>
                        <s:property value='#address.contacts'/>&nbsp;&nbsp;&nbsp;
                        <s:property value='#address.phone'/>
                        <s:if test="%{#address.isDefault == 1 }">
                            [默认]
                        </s:if>
                    </h6>
                </div>
                <div class="col-xs-2 text-center" style="padding-top: 5px">
                    <h4 class="delete" data-aid="<s:property value='#address.id'/>">
                        <span class="glyphicon glyphicon-trash"></span>
                    </h4>
                </div>
            </div>
            </s:iterator>


            <div class="row">
                <div class="col-xs-12">
                    <button class="btn btn-default btn-block" data-toggle="modal" data-target="#address">新增收货地址</button>
                </div>
            </div>

        </div>
    </div>
</div>


<div id="address" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
     aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title text-center" id="exampleModalLabel">请输入收货地址</h4>
            </div>
            <form action="user_addAddress" method="post" enctype="multipart/form-data">
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
                                            <%--<input id="is-default" name="address.isDefault" checked type="checkbox"> 是否默认地址--%>
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

<div class="goback">
    <a href="personal.jsp"><span class="glyphicon glyphicon-menu-left"></span></a>
</div>

<script type="text/javascript" src="js/jquery-2.0.2.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script>
    //取消订单
    $(".delete").click(function () {
        var aid = $(this).attr("data-aid");
        if (confirm("确认删除地址？")) {
            location.href = "user_deleteAddress?id=" + aid;
        }
    });
</script>
</body>
</html>
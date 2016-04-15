<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="col-md-2">
    <ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
        <li >
            <a href="index.jsp">
                <i class="glyphicon glyphicon-th-large"></i>
                首页
            </a>
        </li>
        <li>
            <a href="">
                <i class="glyphicon glyphicon-credit-card"></i>
                基本信息
            </a>
        </li>
        <li>
            <a href="#productSetting" class="nav-header collapsed" data-toggle="collapse">
                <i class="glyphicon glyphicon-cog"></i>
                商品管理
                <span class="pull-right glyphicon glyphicon-chevron-down"></span>
            </a>
            <ul id="productSetting" class="nav nav-list collapse " >
                <li><a href="product_getProductsBypage?page=1"><i class="glyphicon glyphicon-user"></i>商品信息</a></li>
                <li><a href="product_getProductType?productType=productType2"><i class="glyphicon glyphicon-plus"></i>添加商品</a></li>
                <li><a href="product_getProductType?productType=productType"><i class="glyphicon glyphicon-plus"></i>添加商品类型</a></li>
            </ul>
        </li>
        <li>
            <a href="user_getUsers?page=1">
                <i class="glyphicon glyphicon-credit-card"></i>
                用户管理
            </a>
        </li>

        <li>
            <a href="order_getAllOrders?page=1">
                <i class="glyphicon glyphicon-globe"></i>
                订单管理
            </a>
        </li>

        <li>
            <a href="#">
                <i class="glyphicon glyphicon-fire"></i>
                关于系统
            </a>
        </li>
    </ul>
</div>

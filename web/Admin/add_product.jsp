<%--
Created by IntelliJ IDEA.
Date: 2016/4/1
Time: 23:34
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>爱代购- Home</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">

    <link href='http://fonts.useso.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="../css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/templatemo-style.css" rel="stylesheet">
    <link href="../css/admin-style.css" rel="stylesheet">
</head>
<body>
<!-- Left column -->
<div class="templatemo-flex-row">
    <!--Main nav-->
    <jsp:include page="./common/common-nav.jsp"></jsp:include>
    <!-- Main content -->
    <div class="templatemo-content col-1 light-gray-bg" style="height:47em">
        <div class="templatemo-top-nav-container">
            <div class="row">
                <nav class="templatemo-top-nav col-lg-12 col-md-12">
                    <ul class="text-uppercase">
                        <li><a href="" class="active">添加商品</a></li>
                        <li><a href="">微购</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="jumbotron text-center">
            <div class="container">
                <div class="row">
                    <form class="form-horizontal" action="product_addProduct" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">所属类型：</label>
                            <div class="col-sm-6">
                                <s:select name="product.typeId" cssClass="form-control" list="#request.typeList" listKey="id" listValue="name" headerKey="0" headerValue="==请选择=="></s:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">商品名称：</label>
                            <div class="col-sm-6">
                                <input type="text" name="product.name" class="form-control" placeholder="商品名称">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">库存：</label>
                            <div class="col-sm-6">
                                <input type="number" name="product.stock" class="form-control" placeholder="库存">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">价格：</label>
                            <div class="col-sm-6">
                                <input type="number" name="product.normalPrice" class="form-control" placeholder="价格">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">市场价：</label>
                            <div class="col-sm-6">
                                <input type="number" name="product.marketPrice" class="form-control" placeholder="市场价">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">图片：</label>
                            <div class="col-sm-6">
                                <input type="file" name="file" class="form-control" placeholder="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">商品介绍：</label>
                            <div class="col-sm-6">
                                <textarea  name="product.content" class="form-control" placeholder="商品介绍"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-4">
                                <button type="submit" class="btn btn-block btn-primary">提交</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
<footer class="text-right">
    技术支持 &copy;| More message contact us <a href="#" target="_blank"></a>
</footer>

<!-- JS -->
<script type="text/javascript" src="../js/jquery-2.0.2.js"></script>      <!-- jQuery -->
<script type="text/javascript" src="../js/templatemo-script.js"></script>      <!-- Templatemo Script -->

</body>
</html>
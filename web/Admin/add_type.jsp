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
                        <li><a href="" class="active">添加类型</a></li>
                        <li><a href="">微购</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="jumbotron text-center">
            <div class="container">
                <div class="row">
                    <div class="col-xs-10 col-xs-offset-1">
                        <form class="form-horizontal" action="product_addProductType" method="post">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品类型：</label>
                                <div class="col-sm-10">
                                    <input type="text" name="type.name" class="form-control" placeholder="name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">所属类型：</label>
                                <div class="col-sm-10">
                                    <s:select name="type.parentId" cssClass="form-control" list="#request.typeList" listKey="id" listValue="name" headerKey="0" headerValue="==请选择=="></s:select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">描述：</label>
                                <div class="col-sm-10">
                                    <textarea name="type.description" rows="3" cols="3" class="form-control"
                                              placeholder="description"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-6">
                                    <button type="submit" class="btn btn-block btn-primary">Sign in</button>
                                </div>
                            </div>
                        </form>
                    </div>
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
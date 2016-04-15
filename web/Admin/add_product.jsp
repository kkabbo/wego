<%--
Created by IntelliJ IDEA.
Date: 2016/4/1
Time: 23:34
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<jsp:include page="./common/common-head.jsp"></jsp:include>

<body>

<jsp:include page="./common/common-title.jsp"></jsp:include>

<div class="container-fluid">
    <div class="row">
        <!--Main nav-->
        <jsp:include page="./common/common-nav.jsp"></jsp:include>
        <!-- Main content -->
        <div class="col-md-10">
            <div class="row">
                <div class="col-md-12 ">
                    <h4>商品管理>添加商品</h4>
                </div>
            </div>

            <form class="form-horizontal" action="product_addProduct" method="post"
                  enctype="multipart/form-data">
                <div class="form-group">
                    <label class="col-sm-3 control-label">所属类型：</label>
                    <div class="col-sm-6">
                        <s:select name="product.typeId" cssClass="form-control" list="#request.typeList"
                                  listKey="id" listValue="name" headerKey="0" headerValue="==请选择=="></s:select>
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
                        <textarea name="product.content" class="form-control" placeholder="商品介绍"></textarea>
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


<!-- JS -->
<script type="text/javascript" src="../js/jquery-2.0.2.js"></script>      <!-- jQuery -->
<script type="text/javascript" src="../js/bootstrap.min.js"></script>      <!-- jQuery -->

</body>
</html>
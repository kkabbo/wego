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
<!-- Left column -->
<div class="container-fluid">
    <div class="row">
        <!--Main nav-->
        <jsp:include page="./common/common-nav.jsp"></jsp:include>
        <!-- Main content -->
        <div class="col-md-10">
            <div class="row">
                <div class="col-md-12 ">
                    <h4>商品管理>添加商品类型</h4>
                </div>
            </div>
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
                                <s:select name="type.parentId" cssClass="form-control" list="#request.typeList"
                                          listKey="id"
                                          listValue="name" headerKey="0" headerValue="==请选择=="></s:select>
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

<!-- JS -->
<script type="text/javascript" src="../js/jquery-2.0.2.js"></script>      <!-- jQuery -->
<script type="text/javascript" src="../js/bootstrap.min.js"></script>

</body>
</html>
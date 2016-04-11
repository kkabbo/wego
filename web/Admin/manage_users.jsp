<%--
  Created by IntelliJ IDEA.
  Date: 2016/4/11
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<jsp:include page="./common/common-head.jsp"></jsp:include>

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
                        <li><a href="" class="active">用户管理</a></li>
                        <li><a href="">微购</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="jumbotron text-center">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <table class="table table-bordered table-hover">
                            <tr>
                                <th>#</th>
                                <th>用户头像</th>
                                <th>用户名称</th>
                                <th>性别</th>
                                <th>年龄</th>
                                <th>电话</th>
                                <th>注册时间</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>
                                    <a href=""><img class="img-responsive center-block" src=""></a>
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <a class="btn btn-primary" href="__URL__/editGoods/id/{$value.goods_id}">编辑</a>
                                    <a class="btn btn-success" href="__URL__/allowGoods/id/{$value.goods_id}">上架</a>
                                    <a class="btn btn-default" href="__URL__/banGoods/id/{$value.goods_id}">下架</a>
                                    <a class="btn btn-danger" href="__URL__/deleteGoods/id/{$value.goods_id}">删除</a>
                                </td>
                            </tr>
                        </table>

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
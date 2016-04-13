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
<jsp:include page="./common/common-title.jsp"></jsp:include>

<!-- Left column -->
<div class="container-fluid">
    <div class="row">
        <!--Main nav-->
        <jsp:include page="./common/common-nav.jsp"></jsp:include>
        <!-- Main content -->
        <div class="col-md-10">
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
                        <%
                            int i = 1;
                        %>
                        <s:iterator value="#request.userList" var="user">

                            <tr>
                                <td><%=i%></td>
                                <td>
                                    <a href=""><img class="img-responsive center-block" src="${user.images}"></a>
                                </td>
                                <td>${user.userName}</td>
                                <td>${user.sex}</td>
                                <td>${user.age}</td>
                                <td>${user.phone}</td>
                                <td>${user.rdate}</td>
                                <td>${user.status}</td>
                                <td>
                                    <a class="btn btn-primary" href="__URL__/editGoods/id/{$value.goods_id}">锁定</a>
                                    <a class="btn btn-success" href="__URL__/allowGoods/id/{$value.goods_id}">解锁</a>
                                </td>
                            </tr>
                            <%
                                i++;
                            %>
                        </s:iterator>
                    </table>

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
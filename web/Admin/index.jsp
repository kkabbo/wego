<%--
Created by IntelliJ IDEA.
Date: 2016/4/1
Time: 23:34
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%--jsp标签里面 不能有空格--%>
<jsp:include page="./common/common-head.jsp"></jsp:include>

<body>
<jsp:include page="./common/common-title.jsp"></jsp:include>

<div class="container-fluid">
    <div class="row">
        <!--Main nav-->
        <jsp:include page="./common/common-nav.jsp"></jsp:include>
        <div class="col-md-10 text-center">
                <h1>Hello, world!</h1>
                <h2>欢迎来到《微购》后台管理系统</h2>
        </div>
    </div>
</div>


<!-- JS -->
<script type="text/javascript" src="../js/jquery-2.0.2.js"></script>      <!-- jQuery -->
<script type="text/javascript" src="../js/bootstrap.min.js"></script>      <!-- jQuery -->

</body>
</html>
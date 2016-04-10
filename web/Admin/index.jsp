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
                        <li><a href="" class="active">首页</a></li>
                        <li><a href="">微购</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="jumbotron text-center">
            <div class="container">
                <h1>Hello, world!</h1>
                <h2>欢迎来到《微购》后台管理系统</h2>
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
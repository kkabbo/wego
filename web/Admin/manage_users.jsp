<%@ page import="com.app.model.PageBean" %><%--
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
                <div class="col-md-12 ">
                    <h4>用户管理</h4>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-xs-12">
                    <table class="table table-bordered table-hover">
                        <tr class="success">
                            <th>#</th>
                            <th style="width: 100px">用户头像</th>
                            <th>用户名称</th>
                            <th>性别</th>
                            <th>年龄</th>
                            <th>电话</th>
                            <th>注册时间</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        <%
                            PageBean pb= (PageBean)request.getAttribute("pageBean");
                            int i = ( pb.getCurrentPage() - 1 ) * pb.getPageSize() + 1;
                        %>
                        <s:iterator value="#request.userList" var="user">

                            <tr>
                                <td><%=i%>
                                </td>
                                <td>
                                    <img class="img-responsive center-block" src="${user.images}">
                                </td>
                                <td>${user.userName}</td>
                                <td>${user.sex}</td>
                                <td>${user.age}</td>
                                <td>${user.phone}</td>
                                <td>${user.rdate}</td>
                                <td>
                                    <s:if test="%{#user.status == 'active' }">
                                        <span class="text-success">活跃</span>
                                    </s:if><s:else>
                                        <span class="text-danger">禁用</span>
                                    </s:else>
                                </td>
                                <td>
                                    <s:if test="%{#user.status == 'active' }">
                                        <a class="btn btn-xs btn-danger"
                                           href="user_updateUserStatus?page=${pageBean.currentPage}&&id=${user.id}&&status=locked">锁定</a>
                                    </s:if>
                                    <s:else>
                                        <a class="btn btn-xs btn-success"
                                           href="user_updateUserStatus?page=${pageBean.currentPage}&&id=${user.id}&&status=active">解锁</a>
                                    </s:else>

                                </td>
                            </tr>
                            <%
                                i++;
                            %>
                        </s:iterator>
                    </table>

                </div>
                <div class="col-md-12 text-left">
                    <a href="user_getUsers?page=1">第一页</a>
                    <s:if test="%{#request.pageBean.hasPreviousPage == true }">
                        <a href="user_getUsers?page=${pageBean.currentPage-1}">上一页</a>
                    </s:if>
                    <s:else>
                        <span class="text-muted">上一页</span>
                    </s:else>
                    每页<s:property value='#request.pageBean.pageSize'/>条
                    总共 <s:property value='#request.pageBean.allRow'/> 条
                    当前第 <s:property value='#request.pageBean.currentPage'/> 页
                    总共<s:property value='#request.pageBean.totalPage'/>页
                    <s:if test="%{#request.pageBean.hasNextPage == true }">
                        <a href="user_getUsers?page=${pageBean.currentPage+1}">下一页</a>
                    </s:if>
                    <s:else>
                        <span class="text-muted">下一页</span>
                    </s:else>
                    <a href="user_getUsers?page=<s:property value='#request.pageBean.totalPage'/>">最后一页</a>
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
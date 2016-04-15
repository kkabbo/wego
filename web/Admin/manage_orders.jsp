<%@ page import="com.app.model.PageBean" %><%--
  Created by IntelliJ IDEA.
  Date: 2016/4/11
  Time: 16:51
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
                    <h4>订单管理</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 text-center">
                    <table class="table table-bordered table-hover text-center">
                        <tr class="success">
                            <td><b>序号</b></td>
                            <td><b>订单号</b></td>
                            <td><b>用户id</b></td>
                            <td style="width: 70px"><b>联系人</b></td>
                            <td style="width: 120px"><b>联系电话</b></td>
                            <td ><b>收货地址</b></td>
                            <td><b>支付类型</b></td>
                            <td style="width: 80px"><b>订单总价</b></td>
                            <td style="width: 80px"><b>订单状态</b></td>
                            <td style="width: 100px"><b>操作</b></td>
                        </tr>
                        <%
                            PageBean pb= (PageBean)request.getAttribute("pageBean");
                            int i = ( pb.getCurrentPage() - 1 ) * pb.getPageSize() + 1;
                        %>
                        <s:iterator value="#request.orderList" var="order">
                            <tr>
                                <td><%=i%></td>
                                <td>wego2016${order.id}</td>
                                <td>${order.userId}</td>
                                <td>${order.contacts}</td>
                                <td>${order.phone}</td>
                                <td>${order.address}</td>
                                <td>
                                    <s:if test="%{#order.payType == 'wechatpay' }">
                                        微信支付
                                    </s:if>
                                    <s:if test="%{#order.payType == 'alipay' }">
                                        支付宝支付
                                    </s:if>
                                    <s:if test="%{#order.payType == 'cod' }">
                                        货到付款
                                    </s:if>
                                </td>
                                <td>${order.totalMoney}</td>
                                <td>
                                    <s:if test="%{#order.status == 'paid' }">
                                        <span class="text-success">待收货</span>
                                    </s:if>
                                    <s:if test="%{#order.status == 'unpaid' }">
                                        <span class="text-danger">待付款</span>
                                    </s:if>
                                    <s:if test="%{#order.status == 'success' }">
                                        <span class="text-muted">已完成</span>
                                    </s:if>
                                    <s:if test="%{#order.status == 'cancel' }">
                                        <span class="text-muted">已取消</span>
                                    </s:if>
                                    <s:if test="%{#order.status == 'want' }">
                                        <span class="text-muted">预购买</span>
                                    </s:if>
                                </td>
                                <td>
                                    <a class="btn btn-xs btn-primary" href="">查看</a>
                                    <a class="btn btn-xs btn-success" href="">发货</a>
                                </td>
                            </tr>
                            <%
                                i++;
                            %>
                        </s:iterator>
                    </table>
                </div>
                <div class="col-md-12 text-left">
                    <a href="order_getAllOrders?page=1">第一页</a>
                    <s:if test="%{#request.pageBean.hasPreviousPage == true }">
                        <a href="order_getAllOrders?page=${pageBean.currentPage-1}">上一页</a>
                    </s:if>
                    <s:else>
                        <span class="text-muted">上一页</span>
                    </s:else>
                    每页<s:property value='#request.pageBean.pageSize'/>条
                    总共 <s:property value='#request.pageBean.allRow'/> 条
                    当前第  <s:property value='#request.pageBean.currentPage'/>  页
                    总共<s:property value='#request.pageBean.totalPage'/>页
                    <s:if test="%{#request.pageBean.hasNextPage == true }">
                        <a href="order_getAllOrders?page=${pageBean.currentPage+1}">下一页</a>
                    </s:if>
                    <s:else>
                        <span class="text-muted">下一页</span>
                    </s:else>
                    <a href="order_getAllOrders?page=<s:property value='#request.pageBean.totalPage'/>">最后一页</a>
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
<%--
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
        <div class="col-md-10 text-center">
            <div class="row">
                <div class="col-md-12">
                    <h4>商品管理</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table class="table  table-bordered table-hover">
                        <tr>
                            <th>序号</th>
                            <th style="width: 10%">商品图片</th>
                            <th>商品名称</th>
                            <th>商品价格</th>
                            <th>商品状态</th>
                            <th>库存</th>
                            <th>销量</th>
                            <th>操作</th>
                        </tr>
                        <%
                            int i = 1;
                        %>
                        <s:iterator value="#request.productList" var="product">
                            <tr>
                                <td><%=i%></td>
                                <td>
                                    <a href="">
                                        <img height="50px" src="../uploadImages/<s:property value='#product.images'/>"
                                             class="center-block">
                                    </a>
                                </td>
                                <td><s:property value='#product.name'/></td>
                                <td><s:property value='#product.normalPrice'/></td>
                                <td><s:property value='#product.status'/></td>
                                <td><s:property value='#product.stock'/></td>
                                <td><s:property value='#product.sellCount'/></td>
                                <td>
                                    <a class="btn btn-primary"
                                       href="product_editProduct?id=<s:property value='#product.id'/>">编辑</a>
                                    <a class="btn btn-success"
                                       href="product_saleProduct?page=${pageBean.currentPage}&&id=<s:property value='#product.id'/>">上架</a>
                                    <a class="btn btn-default"
                                       href="product_stockProduct?page=${pageBean.currentPage}&&id=<s:property value='#product.id'/>">下架</a>
                                    <a class="btn btn-danger delete" data-page="${pageBean.currentPage}" data-pid="<s:property value='#product.id'/>">删除</a>
                                </td>
                            </tr>
                            <%
                                i++;
                            %>
                        </s:iterator>
                    </table>
                </div>
                <div class="col-md-12 text-left">
                    <a href="product_getProductsBypage?page=1">第一页</a>
                    <s:if test="%{#request.pageBean.hasPreviousPage == true }">
                        <a href="product_getProductsBypage?page=${pageBean.currentPage-1}">上一页</a>
                    </s:if>
                    <s:else>
                        <span class="text-muted">上一页</span>
                    </s:else>
                    每页<s:property value='#request.pageBean.pageSize'/>条
                    总共 <s:property value='#request.pageBean.allRow'/> 条
                    当前第<s:property value='#request.pageBean.currentPage'/>页
                    总共<s:property value='#request.pageBean.totalPage'/>页
                    <s:if test="%{#request.pageBean.hasNextPage == true }">
                        <a href="product_getProductsBypage?page=${pageBean.currentPage+1}">下一页</a>
                    </s:if>
                    <s:else>
                        <span class="text-muted">下一页</span>
                    </s:else>
                    <a href="product_getProductsBypage?page=<s:property value='#request.pageBean.totalPage'/>">最后一页</a>
                </div>
            </div>
        </div>
    </div>
</div>


<input id="error" type="hidden" value="<s:property value='#request.info'/>">
<!-- JS -->
<script type="text/javascript" src="../js/jquery-2.0.2.js"></script>      <!-- jQuery -->
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        var error = $("#error").val();
        if (error != null && error != "") {
            alert(error);
        }
    });

    $(".delete").click(function () {
        var pid = $(this).attr("data-pid");
        var page = $(this).attr("data-page");
        if (pid != null && pid != "") {
            if (confirm("确认删除商品？")) {
                location.href = "product_deleteProduct?page="+page+"&&id=" + pid;
            }
        }
    });
</script>
</body>
</html>
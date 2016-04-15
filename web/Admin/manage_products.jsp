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
                    <h4>商品管理>商品信息</h4>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-md-12">
                    <table class="table  table-bordered table-hover">
                        <tr class="success">
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
                            PageBean pb = (PageBean) request.getAttribute("pageBean");
                            int i = (pb.getCurrentPage() - 1) * pb.getPageSize() + 1;
                        %>
                        <s:iterator value="#request.productList" var="product">
                            <tr>
                                <td><%=i%>
                                </td>
                                <td>
                                    <img height="50px" src="../uploadImages/<s:property value='#product.images'/>"
                                         class="center-block">
                                </td>
                                <td><s:property value='#product.name'/></td>
                                <td><s:property value='#product.normalPrice'/></td>
                                <td><s:property value='#product.status'/></td>
                                <td><s:property value='#product.stock'/></td>
                                <td><s:property value='#product.sellCount'/></td>
                                <td hidden><s:property value='#product.content'/></td>
                                <td hidden><s:property value='#product.marketPrice'/></td>
                                <td>
                                    <a class="btn btn-primary edit"
                                       href="#" data-id="${product.id}">编辑</a>
                                    <a class="btn btn-success"
                                       href="product_saleProduct?page=${pageBean.currentPage}&&id=<s:property value='#product.id'/>">上架</a>
                                    <a class="btn btn-default"
                                       href="product_stockProduct?page=${pageBean.currentPage}&&id=<s:property value='#product.id'/>">下架</a>
                                    <a class="btn btn-danger delete" data-page="${pageBean.currentPage}"
                                       data-pid="<s:property value='#product.id'/>">删除</a>
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


<div id="edit" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title text-center" id="gridSystemModalLabel">编辑商品</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <form class="form-horizontal" action="product_updateProduct" method="post"
                                  enctype="multipart/form-data">
                                <div class="form-group">
                                    <input type="hidden" name="product.id" id="pid">
                                    <label class="col-sm-3 control-label">商品名称：</label>
                                    <div class="col-sm-7">
                                        <input id="name" type="text" name="product.name" class="form-control" placeholder="商品名称">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">库存：</label>
                                    <div class="col-sm-7">
                                        <input id="stock" type="number" name="product.stock" class="form-control" placeholder="库存">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">价格：</label>
                                    <div class="col-sm-7">
                                        <input id="normal" type="number" name="product.normalPrice" class="form-control"
                                               placeholder="价格">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">市场价：</label>
                                    <div class="col-sm-7">
                                        <input id="mark" type="number" name="product.marketPrice" class="form-control"
                                               placeholder="市场价">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">图片：</label>
                                    <div class="col-sm-7">
                                        <input type="file" name="file" class="form-control" placeholder="name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">商品介绍：</label>
                                    <div class="col-sm-7">
                                        <textarea id="content" name="product.content" class="form-control"
                                                  placeholder="商品介绍"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-4 col-sm-4">
                                        <button type="submit" class="btn btn-block btn-primary">保存</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
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
                location.href = "product_deleteProduct?page=" + page + "&&id=" + pid;
            }
        }
    });

    $(".edit").click(function () {
        var id = $(this).attr("data-id");
        var $tr = $(this).parents("tr");
        var images = $tr.children("td:eq(1)").html();
        var name = $tr.children("td:eq(2)").html();
        var normal = $tr.children("td:eq(3)").html();
        var stock = $tr.children("td:eq(5)").html();
        var mark = $tr.children("td:eq(8)").html();
        var content = $tr.children("td:eq(7)").html();

        $("#pid").val(id);
        $("#name").val(name);
        $("#normal").val(normal);
        $("#stock").val(stock);
        $("#mark").val(mark);
        $("#content").val(content);

        $("#edit").modal();
    });


</script>
</body>
</html>
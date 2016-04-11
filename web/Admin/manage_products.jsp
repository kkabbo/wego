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
                        <li><a href="" class="active">商品管理</a></li>
                        <li><a href="">微购</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="templatemo-content-container">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <table class="table table-bordered table-hover">
                            <tr>
                                <th>序号</th>
                                <th>商品图片</th>
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
                                            <img src="../uploadImages/<s:property value='#product.images'/>" class="img-responsive center-block" >
                                        </a>
                                    </td>
                                    <td><s:property value='#product.name'/></td>
                                    <td><s:property value='#product.normalPrice'/></td>
                                    <td><s:property value='#product.status'/></td>
                                    <td><s:property value='#product.stock'/></td>
                                    <td><s:property value='#product.sellCount'/></td>
                                    <td>
                                        <a class="btn btn-primary" href="product_editProduct?id=<s:property value='#product.id'/>">编辑</a>
                                        <a class="btn btn-success" href="product_saleProduct?id=<s:property value='#product.id'/>">上架</a>
                                        <a class="btn btn-default" href="product_stockProduct?id=<s:property value='#product.id'/>">下架</a>
                                        <a class="btn btn-danger delete" data-pid="<s:property value='#product.id'/>">删除</a>
                                    </td>
                                </tr>
                                <%
                                    i++;
                                %>
                            </s:iterator>
                        </table>
                    </div>
                    <div class="col-xs-12 text-center">
                        <nav>
                            <ul class="pagination">
                                <li>
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li>
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<footer class="text-right">
    技术支持 &copy;| More message contact us <a href="#" target="_blank"></a>
</footer>

<input id="error" type="hidden" value="<s:property value='#request.info'/>">

<!-- JS -->
<script type="text/javascript" src="../js/jquery-2.0.2.js"></script>      <!-- jQuery -->
<script type="text/javascript" src="../js/templatemo-script.js"></script>      <!-- Templatemo Script -->
<script>
    $(document).ready(function(){
        var error = $("#error").val();
        if(error!=null && error != ""){
            alert(error);
        }
    });

    $(".delete").click(function(){
       var pid = $(this).attr("data-pid");
        if(pid!=null && pid!=""){
            if(confirm("确认删除商品？")){
               location.href="product_deleteProduct?id="+pid;
            }
        }
    });
</script>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  Date: 2016/4/11
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>微信登录</title>
    <link rel="SHORTCUT ICON" href="images/logo.ico"/>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no"/>

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/common.css">
</head>
<body >

<div class="container">
    <div class="row">
        <div class="col-xs-12 text-center">
            <h3>正在获取权限...</h3>
            <input type="hidden" id="url" value="<s:property value="#request.url"/>"/>
        </div>
    </div>
</div>

<script type="text/javascript" src="js/jquery-2.0.2.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script>
    $(document).ready(function(){
        var url = $("#url").val();
        if(url!=null && url!=""){
            location.href=url;
        }else{
            alert("获取权限失败！");
        }
    });
</script>
</body>
</html>
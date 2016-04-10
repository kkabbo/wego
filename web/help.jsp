<%--
  Created by IntelliJ IDEA.
  Date: 2016/4/10
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>帮助中心</title>
    <link rel="SHORTCUT ICON" href="images/logo.ico"/>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no"/>

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/common.css">

    <style>

        .panel-default > .panel-heading {
            background-color: white;
        }

        .glyphicon {
            color: #2aabd2;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2 ">
            <div class="row">
                <div class="col-xs-12">
                    <h2>帮助中心</h2>
                </div>

                <div class="col-xs-12">
                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                                       aria-expanded="true" aria-controls="collapseOne">
                                        <span class="glyphicon glyphicon-comment"></span>
                                        联系客服
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel"
                                 aria-labelledby="headingOne">
                                <div class="panel-body">
                                    <dl>
                                        <dt>方法一：</dt>
                                        <dd>关注公众号“wego”,可以联系在线客服为你服务，也可以直接在公众号输入你要咨询的问题。</dd>
                                        <dt>方法二：</dt>
                                        <dd>拨打热线电话10086，按照提示即可人工服务。</dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingTwo">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        <span class="glyphicon glyphicon-yen"></span>
                                        价格说明
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
                                 aria-labelledby="headingTwo">
                                <div class="panel-body">
                                    <dl>
                                        <dt>普通价：</dt>
                                        <dd>即商品的销售价，是你最终是否购商品的依据。</dd>
                                        <dt>划线价：</dt>
                                        <dd>
                                            商品展示的划横线价格为参考价，该价格可能是品牌专柜标价，商品吊牌价或由品牌供应商提供的正品零售价
                                            （如厂商指导价，建议零售价等）或该商品在商城曾经展示过的销售价；由于地区、时间的差异性和市场行情波动
                                            ，品牌专柜标价、商品吊牌价等可能会和你购物时展示的不一致，该价格仅供你参考。
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingThree">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        <span class="glyphicon glyphicon-shopping-cart"></span>
                                        挑选商品
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel"
                                 aria-labelledby="headingThree">
                                <div class="panel-body">
                                    <dl>
                                        <dt>如何挑选商品？</dt>
                                        <dd>进入商城首页，在顶部搜索框内输入关键字搜索即可。</dd>
                                        <dt>如何查看更为详细的商品信息？</dt>
                                        <dd>进入商城首页，点击商品图片就会进入商品详细信息，可以查看到该有的信息。</dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingFour">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapsefour" aria-expanded="false" aria-controls="collapsefour">
                                        <span class="glyphicon glyphicon-list"></span>
                                        订单问题
                                    </a>
                                </h4>
                            </div>
                            <div id="collapsefour" class="panel-collapse collapse" role="tabpanel"
                                 aria-labelledby="headingThree">
                                <div class="panel-body">
                                    <dl>
                                        <dt>如何查看订单信息及物流状态？</dt>
                                        <dd>进入商品首页，点击左上角的人物头像即可进入个人中心，在个人中心点击我的订单进入订单页面，可以看到所有状态的订单信息。</dd>
                                        <dt>如何取消订单交易？</dt>
                                        <dd>
                                            进入商品首页，点击左上角的人物头像即可进入个人中心，在个人中心点击我的订单进入订单页面，订单页面有所有的订单信息，只要是
                                            未付款的订单则可以直接点击取消订单，或者进入订单详情页面点击取消订单。
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingFive">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                        <span class="glyphicon glyphicon-send"></span>
                                        发货问题
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseFive" class="panel-collapse collapse" role="tabpanel"
                                 aria-labelledby="headingThree">
                                <div class="panel-body">
                                    <dl>
                                        <dt>付款之后卖家多久发货？</dt>
                                        <dd>商城默认发货时间是下午17：00之前，比如你只要是中午购买的商品，则可以直接在当天发货。</dd>
                                        <dt>卖家超过48小时未发货怎么办？</dt>
                                        <dd>直接找客服进行沟通。有必要的话进行赔偿损失。</dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingSix">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                                        <span class="glyphicon glyphicon-send"></span>
                                        售后问题
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseSix" class="panel-collapse collapse" role="tabpanel"
                                 aria-labelledby="headingThree">
                                <div class="panel-body">
                                    <dl>
                                        <dt>商品不喜欢或质量有问题如何进行退换货？</dt>
                                        <dd>
                                            1.如果是为发货的商品怎可以直接联系客服进行商品更换；
                                            2.如果是已经发货或者是已经收到货的话，只要未拆条码，或者未损坏等一律是7天包退。邮费自理。
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingSeven">
                                <h4 class="panel-title ">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
                                        <span class="glyphicon glyphicon-question-sign"></span>
                                        常见问题
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseSeven" class="panel-collapse collapse" role="tabpanel"
                                 aria-labelledby="headingThree">
                                <div class="panel-body">
                                    ...
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="js/jquery-2.0.2.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>
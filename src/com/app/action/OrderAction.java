package com.app.action;

import com.app.model.*;
import com.app.service.OrderService;
import com.app.service.ProductService;
import com.app.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created on 2016/4/3.
 */
public class OrderAction extends ActionSupport {
    private TbSalesorder salesorder;
    private TbSalesitem salesitem;
    private PageBean pageBean;
    private int paseSize = 10;
    @Resource
    private OrderService orderService;
    @Resource
    private ProductService productService;
    @Resource
    private UserService userService;

    public int getPaseSize() {
        return paseSize;
    }

    public void setPaseSize(int paseSize) {
        this.paseSize = paseSize;
    }

    public PageBean getPageBean() {
        return pageBean;
    }

    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public ProductService getProductService() {
        return productService;
    }

    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    public TbSalesorder getSalesorder() {
        return salesorder;
    }

    public void setSalesorder(TbSalesorder salesorder) {
        this.salesorder = salesorder;
    }

    public OrderService getOrderService() {
        return orderService;
    }

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public TbSalesitem getSalesitem() {
        return salesitem;
    }

    public void setSalesitem(TbSalesitem salesitem) {
        this.salesitem = salesitem;
    }

    //新增购物车
    public String addCart() {
        Map session = ActionContext.getContext().getSession();
        String uid ;
        if(session.containsKey("uid")){
            uid = session.get("uid").toString();
        }else{
            return LOGIN;
        }
        TbProduct product = (TbProduct)orderService.getProduct(TbProduct.class,salesitem.getProduct().getId());
        int stock = product.getStock() == null?0:product.getStock();
        if(salesitem.getCount() > stock){
            session.put("info","库存不足！");
            return "products";
        }else{
            int sellCount = product.getSellCount()== null?0:product.getSellCount();
            product.setSellCount(sellCount + salesitem.getCount());
            product.setStock(product.getStock() - salesitem.getCount());
        }
        if (uid != null && !uid.equals("")) {
            int oid;
            List list = orderService.getOrderByUidAndStatus(Integer.parseInt(uid), "want");
            if (list == null || list.size() == 0) {//不存在购物车的话新建一个
                Date date = new Date();// new Date()为获取当前系统时间
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
                salesorder = new TbSalesorder();
                salesorder.setUserId(Integer.valueOf(uid));
                salesorder.setStatus("want");
                salesorder.setOrderDate(df.format(date));

                if (orderService.addOrder(salesorder)) { //新增购物车成功的话获取购物车id
                    list = orderService.getOrderByUidAndStatus(Integer.parseInt(uid), "want");
                    if (list != null && list.size() > 0) {
                        this.setSalesorder((TbSalesorder) list.get(0));
                        oid = this.salesorder.getId();
                    } else {//找不到购物车
                        return "products";
                    }
                } else {//新增购物车失败
                    return "products";
                }
            } else {//存在的话取得id
                this.setSalesorder((TbSalesorder) list.get(0));
                oid = this.salesorder.getId();
            }
            salesitem.setOrderId(oid);
            list = orderService.getSalesitem(oid, salesitem.getProduct().getId());
            if (list != null && list.size() > 0) {//购物车已存在该商品的话更新数量
                TbSalesitem oldSalesitem = (TbSalesitem) list.get(0);
                salesitem.setId(oldSalesitem.getId());
                salesitem.setCount(salesitem.getCount() + oldSalesitem.getCount());
            }
            double amount = salesitem.getPrice() * salesitem.getCount();
            salesitem.setAmount(amount);
            if (orderService.addOrupdateCart(salesitem)) {
                //销量加，库存减

                orderService.updateProduct(product);
                return "products";
            } else {
                return ERROR;
            }
        } else {
            return ERROR;
        }
    }

    //获取购物车
    public String getCart() {
        Map session = ActionContext.getContext().getSession();
        String uid ;
        if(session.containsKey("uid")){
            uid = session.get("uid").toString();
            List<TbSalesitem> salesitemList = (List<TbSalesitem>) orderService.getCart(Integer.parseInt(uid));
            int i = 0;
            float amount = 0;
            if (salesitemList != null && salesitemList.size() > 0) {
                for (i = 0; i < salesitemList.size(); i++) {
                    amount += salesitemList.get(i).getAmount();
                }
            }
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("salesitemList", salesitemList);
            request.setAttribute("count", i);
            request.setAttribute("amount", amount);
        }else{
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("salesitemList", null);
            request.setAttribute("count", 0);
            request.setAttribute("amount", 0);
            return LOGIN;
        }
        return null;
    }

    //删除购物车商品
    public String deleteCart() {
        HttpServletRequest request = ServletActionContext.getRequest();
        int itemId = Integer.parseInt(request.getParameter("id"));
        if (orderService.deleteCart(itemId)) {
            return "products";
        } else {
            return ERROR;
        }
    }

    //下单
    public String placeAnOrder() {
        Map session = ActionContext.getContext().getSession();
        String uid ;
        if(session.containsKey("uid")){
            uid = session.get("uid").toString();
        }else{
            return LOGIN;
        }
        HttpServletRequest request = ServletActionContext.getRequest();
        String payType = request.getParameter("payType");
        String amount = request.getParameter("amount");
        if (uid != null && !uid.equals("")) {
            List list = orderService.getOrderByUidAndStatus(Integer.parseInt(uid), "want");//获取购物车
            if (list != null && list.size() > 0) {
                Date date = new Date();// new Date()为获取当前系统时间
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
                this.setSalesorder((TbSalesorder) list.get(0));//获取购物车订单
                salesorder.setStatus("unpaid");     //未支付
                salesorder.setPayType(payType);     //支付方式
                salesorder.setTotalMoney(Double.parseDouble(amount));//支付总价
                salesorder.setOrderDate(df.format(date));  //更新下单时间
                List addresslist = userService.getDefaultAddress(Integer.parseInt(uid));//获取默认地址
                if (addresslist != null && addresslist.size() > 0) {
                    TbAddress defaultAddress = (TbAddress) addresslist.get(0);
                    String address = defaultAddress.getProvince()
                            + defaultAddress.getCity()
                            + defaultAddress.getCounty()
                            + defaultAddress.getAddress();
                    salesorder.setAddress(address);
                    salesorder.setContacts(defaultAddress.getContacts());
                    salesorder.setPhone(defaultAddress.getPhone());
                    if (orderService.updateOrder(salesorder)) {
                        request.setAttribute("amount", amount);
                        request.setAttribute("orderId", "wego2016" + salesorder.getId());
                        request.setAttribute("id", salesorder.getId());
                        return "pay";
                    } else {//更新订单失败
                        return ERROR;
                    }
                } else {//找不到默认地址
                    return "gopay";
                }
            } else {//已下单的话进入订单页面
                return "orders";
            }
        } else {//未登录
            return LOGIN;
        }
    }


    //支付
    public String pay() {
        int id = salesorder.getId();
        if (orderService.updateOrderStatus("paid", salesorder.getId())) {
            return "payStatus";
        } else {
            return INPUT;
        }
    }

    //取消订单
    public String cancelOrder(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        if (id!=null && !id.equals("") && orderService.updateOrderStatus("cancel", Integer.parseInt(id))) {
            return "orders";
        } else {
            return INPUT;
        }
    }
    //确认收货
    public String confirmOrder(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        if (id!=null && !id.equals("") && orderService.updateOrderStatus("success", Integer.parseInt(id))) {
            return "orders";
        } else {
            return INPUT;
        }
    }
    //重新下单
    public String reOrder(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        if (id!=null && !id.equals("") && orderService.updateOrderStatus("want", Integer.parseInt(id))) {
            return "orders";
        } else {
            return INPUT;
        }
    }

    //前往支付页面
    public String toPay() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        if (id != null && !id.equals("")) {
            this.setSalesorder(orderService.getOrder(Integer.parseInt(id)));
            request.setAttribute("amount", salesorder.getTotalMoney());
            request.setAttribute("orderId", "wego2016" + salesorder.getId());
            request.setAttribute("id", salesorder.getId());
            return "pay";
        } else {//找不到订单号
            return "orders";
        }
    }

    //获取我的订单
    public String getOrders() {
        Map session = ActionContext.getContext().getSession();
        String uid ;
        if(session.containsKey("uid")){
            uid = session.get("uid").toString();
        }else{
            return LOGIN;
        }
//        String uid = "1";
        HttpServletRequest request = ServletActionContext.getRequest();
        String showOrdersType= request.getParameter("type");
        List<TbSalesorder> list;
        if (showOrdersType == null || showOrdersType.equals("") ||showOrdersType.equals("all")){
            showOrdersType = "all";
            list = (List<TbSalesorder>)orderService.getOders(Integer.parseInt(uid));
        }else{
            list = (List<TbSalesorder>)orderService.getOrderByUidAndStatus(Integer.parseInt(uid),showOrdersType);
        }
        request.setAttribute("orderList", list);
        request.setAttribute("showOrdersType", showOrdersType);
         return "showOrders";
    }

    //获取订单中的商品信息
    public String getOrderItem(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String oid = request.getParameter("id");
        if(oid!=null && !oid.equals("")){
            this.setSalesorder(orderService.getOrder(Integer.parseInt(oid)));
            List<TbSalesitem> itemList = (List<TbSalesitem>)orderService.getOrderItem(Integer.parseInt(oid));
            if (itemList!=null && itemList.size() > 0){
                request.setAttribute("itemList",itemList);
                request.setAttribute("order",this.getSalesorder());
                return "order";
            }else{//没找到商品
                return "orders";
            }
        }else{//没找到oid
            return "orders";
        }

    }

    //判断管理员是否登录
    public boolean checkAdminLogin(){
        Map session = ActionContext.getContext().getSession();
        String aid ;
        if(session.containsKey("aid")){
            aid = session.get("aid").toString();
            if(aid == null || aid.equals("")){
                return false;
            }
        }else{
            return false;
        }
        return true;
    }
    //通过页数获取所有订单
    public String getAllOrders(){
        if(!checkAdminLogin()){//验证管理员是否登录
            return "adminLogin";
        }
        HttpServletRequest request = ServletActionContext.getRequest();
        String page = request.getParameter("page");
        setPageBean(orderService.getOrders(Integer.parseInt(page),paseSize));
        List<TbSalesorder> orderList = (List<TbSalesorder>) this.pageBean.getList();
        if (orderList != null) {
            request.setAttribute("orderList", orderList);
            request.setAttribute("pageBean",this.getPageBean());
        }
        return "manageOrders";
    }
}

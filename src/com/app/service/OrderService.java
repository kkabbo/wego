package com.app.service;

import com.app.model.PageBean;
import com.app.model.TbSalesitem;
import com.app.model.TbSalesorder;

import java.io.Serializable;
import java.util.List;

/**
 * Created on 2016/4/6.
 */
public interface OrderService {
    List getOrderByUidAndStatus(int uid,String status);
    boolean addOrder(TbSalesorder salesorder);
    boolean addCart(TbSalesitem salesitem);
    boolean addOrupdateCart(TbSalesitem salesitem);
    Object getProduct(Class c,Serializable id);
    List getSalesitem(int orderId,int productId);
    List getOrderItem(int orderId);
    List getCart(int uid);
    boolean deleteCart(int itemId);
    boolean updateOrder(TbSalesorder salesorder);
    boolean updateOrderStatus(String status,int id);
    TbSalesorder getOrder(int id);
    List getOders(int uid);
    PageBean getOrders(int page, int pageSize);
}

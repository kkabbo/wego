package com.app.service.impl;

import com.app.dao.BaseDao;
import com.app.model.TbSalesitem;
import com.app.model.TbSalesorder;
import com.app.service.OrderService;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;

/**
 * Created on 2016/4/6.
 */
public class OrderServiceImpl implements OrderService {
    @Resource
    private BaseDao baseDao;

    /**
     * 通过用户id和订单状态获取订单
     * @param uid
     * @param status
     * @return
     */
    public List getOrderByUidAndStatus(int uid,String status){
        String hql = "from TbSalesorder where userId = ? and status = ? order by id desc";
        List list = baseDao.find(hql,uid,status);
        if(list!=null && !list.isEmpty()){
            return list;
        }else{
            return null;
        }
    }

    /**
     * 新增订单
     * @param salesorder
     * @return
     */
    public boolean addOrder(TbSalesorder salesorder){
        return baseDao.save(salesorder);
    }

    /**
     * 新增购物车
     * @param salesitem
     * @return
     */
    public boolean addCart(TbSalesitem salesitem){
        return baseDao.save(salesitem);
    }

    /**
     * 新增或修改购物车商品
     * @param salesitem
     * @return
     */
    public boolean addOrupdateCart(TbSalesitem salesitem){
        return baseDao.saveOrUpdate(salesitem);
    }


    /**
     * 通过id获取商品
     * @param c
     * @param id
     * @return
     */
    public Object getProduct(Class c,Serializable id){
        return baseDao.get(c,id);
    }

    /**
     * 通过订单id和商品id查找是否存在商品
     * @param orderId
     * @param productId
     * @return
     */
    public List getSalesitem(int orderId,int productId){
        String hql = "from TbSalesitem where orderId = ? and productId = ?";
        return baseDao.find(hql,orderId,productId);
    }

    /**
     * 获取订单的商品信息
     * @param orderId
     * @return
     */
    public List getOrderItem(int orderId){
        String hql = "from TbSalesitem where orderId = ?";
        return baseDao.find(hql,orderId);
    }

    /**
     * 通过用户id 获取购物车信息
     * @param uid
     * @return
     */
    public List getCart(int uid){
        List list = getOrderByUidAndStatus(uid,"want");
        if(list!=null && list.size()>0){
            TbSalesorder salesorder = (TbSalesorder) list.get(0);
            int orderId = salesorder.getId();
            String hql = "from TbSalesitem where orderId = ?";
            list = baseDao.find(hql,orderId);
            return list;
        }else{
            return null;
        }
    }

    /**
     * 通过id 删除购物车商品
     * @param itemId
     * @return
     */
    public boolean deleteCart(int itemId){
        String hql = "delete TbSalesitem where id = ?";
        if(baseDao.delete(hql,itemId) > 0){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 更新订单
     * @param salesorder
     * @return
     */
    public boolean updateOrder(TbSalesorder salesorder){
        return baseDao.update(salesorder);
    }

    /**
     * 通关id 更新订单状态
     * @param status
     * @param id
     * @return
     */
    public boolean updateOrderStatus(String status,int id){
        String hql = "update TbSalesorder set status = ? where id = ?";
        return baseDao.update(hql,status,id);
    }

    /**
     * 通过id获取订单对象
     * @param id
     * @return
     */
    public TbSalesorder getOrder(int id){
        return (TbSalesorder)baseDao.get(TbSalesorder.class,id);
    }

    /**
     * 获取用户的所有订单
     * @param uid
     * @return
     */
    public List getOders(int uid){
        String hql = "from TbSalesorder where userId = ? and status <> 'want' order by id desc";
        return baseDao.find(hql,uid);
    }

}

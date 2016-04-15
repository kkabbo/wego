package com.app.service;

import com.app.model.PageBean;
import com.app.model.TbProduct;
import com.app.model.TbType;

import java.util.List;

/**
 * Created on 2016/4/3.
 */
public interface ProductService {
    //新增商品
    boolean addProduct(TbProduct product);
    //新增商品类型
    boolean addProductType(TbType type);
    //获取商品类型
    List<TbType> getProductType();
    //升序获取商品
    List<TbProduct> getProductsSortAsc(int page, int pageSize);
    //降序获取商品
    List<TbProduct> getProductsSortDesc(int page, int pageSize);
    //默认获取所有商品
    List<TbProduct> getProducts();
    //分页获取商品
    PageBean getProducts(int page, int pageSize);

    List<TbProduct> getProductsByNameSortAsc(String value, int page, int pageSize);

    List<TbProduct> getProductsByNameSortDesc(String value, int page, int pageSize);

    PageBean getProductsByName(String value, int page, int pageSize);
    //通过商品id获取商品信息
    Object getProductInfo(int pid);
    //通过id删除商品
    boolean deleteProduct(int pid);
    //更新商品状态
    boolean updateProductStatus(String status,int id);
    //验证商品是否有下单
    boolean checkProductIsUsed(int pid);
    //更新商品
    boolean updateProduct(TbProduct product);
}

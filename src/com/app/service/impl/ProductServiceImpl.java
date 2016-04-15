package com.app.service.impl;

import com.app.dao.BaseDao;
import com.app.model.PageBean;
import com.app.model.TbProduct;
import com.app.model.TbType;
import com.app.service.ProductService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created on 2016/4/3.
 */

public class ProductServiceImpl implements ProductService {
    @Resource
    private BaseDao baseDao;

    /**
     * 新增商品
     * @param product
     * @return
     */
    @Override
    public boolean addProduct(TbProduct product) {
        return baseDao.save(product) ;
    }

    /**
     * 新增商品类型
     * @param type
     * @return
     */
    @Override
    public boolean addProductType(TbType type) {
        return baseDao.save(type);
    }

    /**
     * 获取商品类型
     * @return
     */
    @Override
    public List<TbType> getProductType() {
        //hql语句,Users代表是models里的实体类
        String hql = "from TbType ";
        return (List<TbType>) baseDao.find(hql);
    }

    /**
     * 升序查找商品
     *
     * @param page
     * @param pageSize
     * @return
     */
    @Override
    public List<TbProduct> getProductsSortAsc(int page, int pageSize) {
        String hql = "from TbProduct order by normalPrice asc";
        return baseDao.find(hql, page, pageSize);
    }

    @Override
    public List<TbProduct> getProductsSortDesc(int page, int pageSize) {
        String hql = "from TbProduct order by normalPrice desc";
        return baseDao.find(hql, page, pageSize);
    }

    @Override
    public List<TbProduct> getProducts(){
        String hql = "from TbProduct";
        return (List<TbProduct>)baseDao.find(hql);
    }

    @Override
    public PageBean getProducts(int page, int pageSize) {
        final String hql = "from TbProduct";//查询语句
        int allRow = baseDao.total(hql);//总记录数
        int totalPage = PageBean.countTotalPage(pageSize, allRow);//总页数
        final int offset = PageBean.countOffset(pageSize, page);//当前页开始记录
        final int currentPage = PageBean.countCurrentPage(page);
        List list = baseDao.findBypage(hql, offset, pageSize);//"一页"的记录

        //把分页信息保存到Bean中
        PageBean pageBean = new PageBean();
        pageBean.setPageSize(pageSize);
        pageBean.setCurrentPage(currentPage);
        pageBean.setAllRow(allRow);
        pageBean.setTotalPage(totalPage);
        pageBean.setList(list);
        pageBean.init();
        return pageBean;
    }


    @Override
    public List<TbProduct> getProductsByNameSortAsc(String value, int page, int pageSize) {
        String hql = "from TbProduct where name like ? order by normalPrice asc";
        return baseDao.find(hql, page, pageSize,value);
    }
    @Override
    public List<TbProduct> getProductsByNameSortDesc(String value, int page, int pageSize) {
        String hql = "from TbProduct where name like ? order by normalPrice desc";
        return baseDao.find(hql, page, pageSize,value);
    }
    @Override
    public PageBean getProductsByName(String value, int page, int pageSize) {
        final String hql = "from TbProduct where status = '上架' and name like '%"+value+"%'";
        int allRow = baseDao.total(hql);//总记录数
        int totalPage = PageBean.countTotalPage(pageSize, allRow);//总页数
        final int offset = PageBean.countOffset(pageSize, page);//当前页开始记录
        final int currentPage = PageBean.countCurrentPage(page);
        List list = baseDao.findBypage(hql, offset, pageSize);//"一页"的记录

        //把分页信息保存到Bean中
        PageBean pageBean = new PageBean();
        pageBean.setPageSize(pageSize);
        pageBean.setCurrentPage(currentPage);
        pageBean.setAllRow(allRow);
        pageBean.setTotalPage(totalPage);
        pageBean.setList(list);
        pageBean.init();
        return pageBean;
    }

    /**
     * 通过商品id获取商品信息
     * @param pid
     * @return
     */
    public Object getProductInfo(int pid){
        String hql = "from TbProduct where id = ?";
        return baseDao.get(TbProduct.class,pid);
    }

    /**
     * 通过id删除商品
     * @param pid
     * @return
     */
    public boolean deleteProduct(int pid){
        return baseDao.delete(TbProduct.class,pid);
    }

    /**
     * 通过商品id更新商品状态
     * @param status
     * @param pid
     * @return
     */
    public boolean updateProductStatus(String status,int pid){
        String hql = "update TbProduct set status = ? where id = ?";
        return baseDao.update(hql,status,pid);
    }

    /**
     * 通过id验证商品是否有下单
     * @param pid
     * @return
     */
    public boolean checkProductIsUsed(int pid){
        String hql = "from TbSalesitem where productId = ?";
        List list = baseDao.find(hql,pid);
        if(list == null || list.size() <= 0){
            return false;
        }else{
            return true;
        }
    }

    /**
     * 更新商品
     * @param product
     * @return
     */
    public boolean updateProduct(TbProduct product){
        return baseDao.update(product);
    }
}

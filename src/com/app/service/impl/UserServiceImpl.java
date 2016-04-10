package com.app.service.impl;

import com.app.dao.BaseDao;
import com.app.model.TbAddress;
import com.app.service.UserService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created on 2016/4/3.
 */
public class UserServiceImpl implements UserService{
    @Resource
    private BaseDao baseDao;

    @Override
    public boolean addAddress(TbAddress address) {
        return baseDao.save(address);
    }

    /**
     * 设置地址是否默认
     * @param isDefault
     * @param uid
     * @return
     */
    public boolean setAddressDefault(int isDefault,int uid){
        String hql = "update TbAddress set isDefault = ? where userId = ?";
        return baseDao.update(hql,isDefault,uid);
    }

    /**
     * 通过用户id 获取默认地址
     * @param uid
     * @return
     */
    public List getDefaultAddress(int uid){
        String hql = "from TbAddress where isDefault=1 and userId = ?";
        return baseDao.find(hql,uid);
    }

    /**
     * 通过用户id获取所有地址
     * @param uid
     * @return
     */
    public List getAddress(int uid){
        String hql ="from TbAddress where userId = ?";
        return baseDao.find(hql,uid);
    }

    /**
     * 通过地址id删除地址
     * @param aid
     * @return
     */
    public boolean deleteAddress(int aid){
        return baseDao.delete(TbAddress.class,aid);
    }
}

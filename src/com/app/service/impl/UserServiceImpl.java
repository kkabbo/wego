package com.app.service.impl;

import com.app.dao.BaseDao;
import com.app.model.TbAddress;
import com.app.model.TbUsers;
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

    /**
     * 新增用户，返回用户对象
     * @param users
     * @return
     */
    public Object addUser(TbUsers users){
        if(baseDao.save(users)){
            return getUserByName(users.getName());
        }else {
            return null;
        }
    }

    /**
     * 通过name 获取用户对象
     * @param name
     * @return
     */
    public Object getUserByName(String name){
        String hql = "from TbUsers where name = ?";
        List list = baseDao.find(hql,name);
        if (list!=null && list.size()>0){
            return list.get(0);
        }else{
            return null;
        }
    }
}

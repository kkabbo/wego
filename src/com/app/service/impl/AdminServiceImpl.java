package com.app.service.impl;

import com.app.dao.BaseDao;
import com.app.service.AdminService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created on 2016/4/17.
 */
public class AdminServiceImpl implements AdminService{
    @Resource
    private BaseDao baseDao;

    /**
     * 通过name 获取对象
     * @param name
     * @return
     */
    public Object getAdminByName(String name){
        String hql = "from TbAdmin where name = ?";
        List list = baseDao.find(hql,name);
        if (list!=null && list.size()>0){
            return list.get(0);
        }else{
            return null;
        }
    }
}

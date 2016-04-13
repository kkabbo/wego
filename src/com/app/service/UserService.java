package com.app.service;

import com.app.model.PageBean;
import com.app.model.TbAddress;
import com.app.model.TbUsers;

import java.util.List;

/**
 * Created on 2016/4/3.
 */
public interface  UserService {
    boolean addAddress(TbAddress address);
    boolean setAddressDefault(int isDefault,int uid);
    List getDefaultAddress(int uid);
    List getAddress(int uid);
    boolean deleteAddress(int aid);
    Object addUser(TbUsers users);
    Object getUserByName(String name);
    PageBean getUsers(int page, int pageSize);
}

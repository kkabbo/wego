package com.app.service;

import com.app.model.TbAddress;

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
}

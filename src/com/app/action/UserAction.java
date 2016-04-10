package com.app.action;

import com.app.model.TbAddress;
import com.app.model.TbUsers;
import com.app.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created on 2016/4/3.
 */
public class UserAction extends ActionSupport {
    private TbUsers user;
    private TbAddress address;

    @Resource
    private UserService userService;

    public TbUsers getUser() {
        return user;
    }

    public void setUser(TbUsers user) {
        this.user = user;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public TbAddress getAddress() {
        return address;
    }

    public void setAddress(TbAddress address) {
        this.address = address;
    }

    //注册
    public String registerUser() {

        return "success";
    }

    //支付的时候新增地址
    public String addAddressOnPay() {
        Map session = ActionContext.getContext().getSession();
//        String uid = session.get("uid").toString();
        String uid = "1";
        userService.setAddressDefault(0, Integer.parseInt(uid));//设置其他地址为不是默认
        address.setUserId(Integer.parseInt(uid));
        address.setIsDefault(1);
        if (userService.addAddress(address)) {//新增地址
            return "gopay";
        } else {
            return ERROR;
        }
    }
    //管理地址的时候新增地址
    public String addAddress() {
        Map session = ActionContext.getContext().getSession();
//        String uid = session.get("uid").toString();
        String uid = "1";
        userService.setAddressDefault(0, Integer.parseInt(uid));//设置其他地址为不是默认
        address.setUserId(Integer.parseInt(uid));
        address.setIsDefault(1);
        if (userService.addAddress(address)) {//新增地址
            return "address";
        } else {
            return ERROR;
        }
    }

    //删除地址
    public String deleteAddress(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String aid = request.getParameter("id");
        if(aid!=null && !aid.equals("")){
            userService.deleteAddress(Integer.parseInt(aid));
        }
        return "address";
    }

    //获取地址
    public String getMyAddress(){
        Map session = ActionContext.getContext().getSession();
//        String uid = session.get("uid").toString();
        String uid = "1";
        if(uid!=null && !uid.equals("")){
            List<TbAddress> list =  (List<TbAddress>)userService.getAddress(Integer.parseInt(uid));
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("addressList",list);
            return "showAddress";
        }else{
            return LOGIN;
        }
    }

    //获取默认地址
    public String getDefaultAddress() {
        Map session = ActionContext.getContext().getSession();
//        String uid = session.get("uid").toString();
        String uid = "1";
        List list = userService.getDefaultAddress(Integer.parseInt(uid));
        HttpServletRequest request = ServletActionContext.getRequest();
        if(list!=null && list.size() > 0){
            TbAddress defaultAddress = (TbAddress) list.get(0);
            request.setAttribute("defaultAddress", defaultAddress);
        }else{
            request.setAttribute("defaultAddress", null);
        }
        return null;
    }
}

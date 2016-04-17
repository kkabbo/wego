package com.app.action;

import com.app.model.TbAdmin;
import com.app.service.AdminService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created on 2016/4/17.
 */
public class AdminAction extends ActionSupport {
    private TbAdmin admin;

    @Resource
    private AdminService adminService;

    public TbAdmin getAdmin() {
        return admin;
    }

    public void setAdmin(TbAdmin admin) {
        this.admin = admin;
    }

    public AdminService getAdminService() {
        return adminService;
    }

    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    public String login(){
        Map session = ActionContext.getContext().getSession();
        HttpServletRequest request = ServletActionContext.getRequest();

        TbAdmin admin1 = (TbAdmin)adminService.getAdminByName(this.admin.getName());
        if(admin1 != null && admin1.getPassword().equals(this.getAdmin().getPassword())){
            session.put("aid",admin1.getId());
            session.put("admin",admin1);
        }else{
            request.setAttribute("info","账号或密码错误！");
            return LOGIN;
        }
        return "index";
    }
}

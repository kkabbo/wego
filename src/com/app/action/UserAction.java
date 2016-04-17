package com.app.action;

import com.app.model.PageBean;
import com.app.model.TbAddress;
import com.app.model.TbUsers;
import com.app.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.json.JSONObject;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created on 2016/4/3.
 */
public class UserAction extends ActionSupport {
    private TbUsers user;
    private TbAddress address;
    private PageBean pageBean;
    private int paseSize = 10;

    @Resource
    private UserService userService;


    public PageBean getPageBean() {
        return pageBean;
    }

    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }

    public int getPaseSize() {
        return paseSize;
    }

    public void setPaseSize(int paseSize) {
        this.paseSize = paseSize;
    }

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
        String uid ;
        if(session.containsKey("uid")){
            uid = session.get("uid").toString();
        }else{
            return LOGIN;
        }
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
        String uid ;
        if(session.containsKey("uid")){
            uid = session.get("uid").toString();
        }else{
            return LOGIN;
        }
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
    public String deleteAddress() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String aid = request.getParameter("id");
        if (aid != null && !aid.equals("")) {
            userService.deleteAddress(Integer.parseInt(aid));
        }
        return "address";
    }

    //获取地址
    public String getMyAddress() {
        Map session = ActionContext.getContext().getSession();
        String uid ;
        if(session.containsKey("uid")){
            uid = session.get("uid").toString();
        }else{
            return LOGIN;
        }
        if (uid != null && !uid.equals("")) {
            List<TbAddress> list = (List<TbAddress>) userService.getAddress(Integer.parseInt(uid));
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("addressList", list);
            return "showAddress";
        } else {
            return LOGIN;
        }
    }

    //获取默认地址
    public String getDefaultAddress() {
        Map session = ActionContext.getContext().getSession();
        String uid;
        if(session.containsKey("uid")){
            uid = session.get("uid").toString();
        }else{
            return LOGIN;
        }
        List list = userService.getDefaultAddress(Integer.parseInt(uid));
        HttpServletRequest request = ServletActionContext.getRequest();
        if (list != null && list.size() > 0) {
            TbAddress defaultAddress = (TbAddress) list.get(0);
            request.setAttribute("defaultAddress", defaultAddress);
        } else {
            request.setAttribute("defaultAddress", null);
        }
        return null;
    }

    public String wechatLogin() throws IOException {
        String appid = "wx81109d302fe4126e";
        String redirect_uri = "http://www.i-leak.com/wego/wechatCallback";
        String state = "success";
        String url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + appid + "&redirect_uri=" + redirect_uri + "&response_type=code&scope=snsapi_userinfo&state=" + state + "#wechat_redirect";
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("url", url);
        return "wechatLogin";
    }

    //微信登录
    public String wechatCallback() throws IOException {
        HttpServletRequest request = ServletActionContext.getRequest();
        Map session = ActionContext.getContext().getSession();
//        String uid = session.get("uid").toString();
        //微信请求CODE
        String code = request.getParameter("code");
        if (code != null && !code.equals("")) {
            String appid = "wx81109d302fe4126e";
            String secret = "95541c5bf650e005bc6f487c846058db";
//            String redirect_uri = "http://www.i-leak.com/wego/wechatLogin";
//            String url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri="+redirect_uri+"&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect";
            // 通过code获取access_token
            String openUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + appid + "&secret=" + secret + "&code=" + code + "&grant_type=authorization_code";

            //天气接口(测试用)
//            String apikey = "apikey=7d1d6504779f9baa26528b9e06c9879d";//天气接口
//            openUrl = "http://apis.baidu.com/heweather/weather/free";
//            openUrl = openUrl +apikey+"city=beijing";
            String json = fileGetContents(openUrl);
            JSONObject jsonObject = new JSONObject(json);
            //通过access_token调用接口
            if (jsonObject != null) {
                String access_token = jsonObject.getString("access_token");
                String openid = jsonObject.getString("openid");
                String userInfoUrl = "https://api.weixin.qq.com/sns/userinfo?access_token=" + access_token + "&openid=" + openid + "&lang=zh_CN";
                json = fileGetContents(userInfoUrl);
                jsonObject = new JSONObject(json);
                if (jsonObject != null) {
                    this.setUser((TbUsers) userService.getUserByName(jsonObject.getString("openid")));//判断用户有没有登录过
                    if ( this.user == null) { //第一次登陆
                        Date date = new Date(); // new Date()为获取当前系统时间
                        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
                        user = new TbUsers();
                        user.setName(jsonObject.getString("openid"));
                        user.setPassword(jsonObject.getString("openid"));
                        user.setUserName(jsonObject.getString("nickname"));
                        user.setImages(jsonObject.getString("sex").equals("1") ? "男" : "女");
                        user.setSex(jsonObject.getString("headimgurl"));
                        user.setRdate(df.format(date));
                        this.setUser((TbUsers) userService.addUser(user));
                        if (this.user != null) {//存入数据库失败
                            return ERROR;
                        }
                    }
                    session.put("user", this.getUser());
                    session.put("uid", this.user.getId());
                    request.setAttribute("json", jsonObject.toString());
                }else{//无法获取用户数据
                    request.setAttribute("json", "无法获取用户信息");
                }
            }else{//无权限
                request.setAttribute("json", "无法获取access_token和openid");
            }
            return INPUT;
        } else {//未获取微信登录权限
            return ERROR;
        }
    }

    //获取url页面数据
    public String fileGetContents(String openUrl) throws IOException {
        URL url = new URL(openUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.connect();
        InputStream inputStream = connection.getInputStream();
        //对应的字符编码转换
        Reader reader = new InputStreamReader(inputStream, "UTF-8");
        BufferedReader bufferedReader = new BufferedReader(reader);
        String str = null;
        StringBuffer sb = new StringBuffer();
        while ((str = bufferedReader.readLine()) != null) {
            sb.append(str);
        }
        reader.close();
        connection.disconnect();
        return sb.toString();
    }
    public String login(){
        Map session = ActionContext.getContext().getSession();
        TbUsers users = (TbUsers)userService.getUserByName(this.user.getName());
        if(users != null && users.getPassword().equals(this.getUser().getPassword())){
            session.put("uid",users.getId());
            session.put("user",users);
        }else{
            return LOGIN;
        }
        return "products";
    }

    //退出
    public String logOut() {
        Map session = ActionContext.getContext().getSession();
        session.clear();
        return LOGIN;
    }
    //个人中心页面
    public String personal(){
        HttpServletRequest request = ServletActionContext.getRequest();
        Map session = ActionContext.getContext().getSession();
        TbUsers users = null;
        if(session.containsKey("user")){
            users = (TbUsers)session.get("user");
        }else{
            return LOGIN;
        }
        request.setAttribute("user",users);
        return "personal";
    }

    //分页获取用户
    public String getUsers(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String page = request.getParameter("page");
        setPageBean(userService.getUsers(Integer.parseInt(page),paseSize));
        List<TbUsers> userList = (List<TbUsers>) this.pageBean.getList();
        if (userList != null) {
            request.setAttribute("userList", userList);
            request.setAttribute("pageBean",this.getPageBean());
        }
        return "manageUsers";
    }
    //修改用户状态
    public String updateUserStatus(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String page = request.getParameter("page");
        String status = request.getParameter("status");
        String uid = request.getParameter("id");
        userService.updateUserStatus(Integer.parseInt(uid),status);
        setPageBean(userService.getUsers(Integer.parseInt(page),paseSize));
        List<TbUsers> userList = (List<TbUsers>) this.pageBean.getList();
        if (userList != null) {
            request.setAttribute("userList", userList);
            request.setAttribute("pageBean",this.getPageBean());
        }
        return "manageUsers";
    }
}

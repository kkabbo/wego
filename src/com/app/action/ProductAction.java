package com.app.action;

import com.app.model.PageBean;
import com.app.model.TbProduct;
import com.app.model.TbType;
import com.app.service.ProductService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created on 2016/4/3.
 */
public class ProductAction extends ActionSupport {
    private TbProduct product;//商品
    private TbType type;//商品类型
    private File file;
    private String fileFileName;
    private PageBean pageBean;//包含分页信息的bean
    private int paseSize = 6;
    @Resource
    private ProductService productService;

    public PageBean getPageBean() {
        return pageBean;
    }

    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }

    public ProductService getProductService() {
        return productService;
    }

    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public TbProduct getProduct() {
        return product;
    }

    public void setProduct(TbProduct product) {
        this.product = product;
    }

    public TbType getType() {
        return type;
    }

    public void setType(TbType type) {
        this.type = type;
    }


    //添加商品
    public String addProduct() {
        if (fileFileName != null && !fileFileName.equals("")) {
            fileFileName = new Date().getTime() + getExtention(this.getFileFileName());
            product.setImages(fileFileName);
        }
        if (productService.addProduct(product)) {
            if (file != null) {
                copyFile(fileFileName);
            }
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("productType", "productType2");
            return getProductType();
        } else {
            return INPUT;
        }
    }

    //显示首页，为重定向而建
    public String index() {
        Map session = ActionContext.getContext().getSession();
        HttpServletRequest request = ServletActionContext.getRequest();
        if (session.containsKey("info")){
            String info = session.get("info").toString();
            request.setAttribute("info", info);
            session.remove("info");
        }
        if (session.containsKey("pageBean")){
            setPageBean((PageBean) session.get("pageBean"));
            List<TbProduct> productList = (List<TbProduct>) this.pageBean.getList();
            request.setAttribute("productList", productList);
        }
        return "index";
    }

    //前台获取商品
    public String getProducts() {
        Map session = ActionContext.getContext().getSession();
        session.put("searchKey", "");//搜索关键字为空的话是所有商品

        setPageBean(productService.getProducts(1, 10));
        session.put("pageBean", this.getPageBean());
        List<TbProduct> productList = (List<TbProduct>) this.pageBean.getList();
        HttpServletRequest request = ServletActionContext.getRequest();
        if (productList != null) {
            request.setAttribute("productList", productList);
        }
        return "index";
    }

    //通过传过的页数获取商品
    public String getProductsBypage(){
        Map session = ActionContext.getContext().getSession();
        if(!checkAdminLogin()){//验证管理员是否登录
            return "adminLogin";
        }
        HttpServletRequest request = ServletActionContext.getRequest();
        String page = request.getParameter("page");
        setPageBean(productService.getProducts(Integer.parseInt(page),paseSize));
        session.put("pageBean",this.getPageBean());
        List<TbProduct> productList = (List<TbProduct>) this.pageBean.getList();
        if (productList != null) {
            request.setAttribute("productList", productList);
            request.setAttribute("pageBean",this.getPageBean());
        }
        return "manageProducts";
    }

    //判断管理员是否登录
    public boolean checkAdminLogin(){
        Map session = ActionContext.getContext().getSession();
        String aid ;
        if(session.containsKey("aid")){
            aid = session.get("aid").toString();
            if(aid == null || aid.equals("")){
                return false;
            }
        }else{
            return false;
        }
        return true;
    }

    //删除商品
    public String deleteProduct(){
        HttpServletRequest request = ServletActionContext.getRequest();
        if(!checkAdminLogin()){//验证管理员是否登录
            return "adminLogin";
        }
        String pid = request.getParameter("id");
        String page = request.getParameter("page");
        if(pid != null && !pid.equals("")){
            this.setProduct((TbProduct) productService.getProductInfo(Integer.parseInt(pid)));//查看是否有这个商品
            boolean isUsed = productService.checkProductIsUsed(Integer.parseInt(pid));//该商品是否被下单
            if(this.product != null&& !isUsed && productService.deleteProduct(Integer.parseInt(pid))){//删除商品
                setPageBean(productService.getProducts(Integer.parseInt(page), paseSize));
                List<TbProduct> productList = (List<TbProduct>) this.pageBean.getList();
                request.setAttribute("productList", productList);
                request.setAttribute("pageBean",this.getPageBean());
                request.setAttribute("info","删除成功！");
            }else{//删除失败
                request.setAttribute("info","该商品已被下单或者不存在，无法删除。");
            }
        }else{
            request.setAttribute("info","该商品不存在！");
        }
        return "manageProducts";
    }
    //商品上架
    public String saleProduct(){
        if(!checkAdminLogin()){//验证管理员是否登录
            return "adminLogin";
        }
        HttpServletRequest request = ServletActionContext.getRequest();
        String pid = request.getParameter("id");
        String page = request.getParameter("page");
        if(pid != null && !pid.equals("")){
            if(productService.updateProductStatus("上架",Integer.parseInt(pid))){
                setPageBean(productService.getProducts(Integer.parseInt(page), paseSize));
                List<TbProduct> productList = (List<TbProduct>) this.pageBean.getList();
                request.setAttribute("productList", productList);
                request.setAttribute("pageBean",this.getPageBean());
            }else{//更新失败
                request.setAttribute("info","该商品上架失败。");
            }
        }else{//没有获取id
            request.setAttribute("info","该商品不存在！");
        }
        return "manageProducts";

    }
    //商品下架
    public String stockProduct(){
        if(!checkAdminLogin()){//验证管理员是否登录
            return "adminLogin";
        }
        HttpServletRequest request = ServletActionContext.getRequest();
        String pid = request.getParameter("id");
        String page = request.getParameter("page");
        if(pid != null && !pid.equals("")){
            if(productService.updateProductStatus("下架",Integer.parseInt(pid))){
                setPageBean(productService.getProducts(Integer.parseInt(page),paseSize));
                List<TbProduct> productList = (List<TbProduct>) this.pageBean.getList();
                request.setAttribute("pageBean",this.getPageBean());
                request.setAttribute("productList", productList);
            }else{//更新失败
                request.setAttribute("info","该商品下架失败。");
            }
        }else{
            request.setAttribute("info","该商品不存在！");
        }
        return "manageProducts";

    }

    //下一页
    public String nextPage() {
        Map session = ActionContext.getContext().getSession();
        String searchKey = (String)session.get("searchKey");
        PageBean pb = (PageBean) session.get("pageBean");
        int currentPage = 0;
        int pageSize = 0;
        if(pb!=null){
            boolean hasNextPage = pb.isHasNextPage();//是否有下一页
            if(hasNextPage){
                currentPage = pb.getCurrentPage() + 1 ;//下一页
            }else{
                currentPage = pb.getCurrentPage();
            }
            pageSize = pb.getPageSize() * currentPage;//数据
        }else{//pb为空说明没有进acion获取数据直接进products.jsp
            getProducts();
            return "index";
        }
        if(searchKey==null || searchKey.equals("")){//搜索关键字为空说明是查找所有商品
            setPageBean(productService.getProducts(1, pageSize));
        }else{
            setPageBean(productService.getProductsByName(searchKey, 1, pageSize));
        }
        session.put("pageBean", this.getPageBean());
        List<TbProduct> productList = (List<TbProduct>) this.pageBean.getList();
        HttpServletRequest request = ServletActionContext.getRequest();
        if (productList != null) {
            request.setAttribute("searchKey", searchKey);
            request.setAttribute("productList", productList);
        }
        return "index";
    }

    //模糊搜索获取商品
    public String getProductsByName() {
        Map session = ActionContext.getContext().getSession();
        session.put("searchKey", this.product.getName());//模糊搜索
        setPageBean(productService.getProductsByName(this.product.getName(), 1, 10));
        session.put("pageBean", this.getPageBean());
        List<TbProduct> productList = (List<TbProduct>) this.pageBean.getList();
        HttpServletRequest request = ServletActionContext.getRequest();
        if (productList != null) {
            request.setAttribute("productList", productList);
            request.setAttribute("searchKey", this.product.getName());
            if(this.product.getName().equals("")){
                request.setAttribute("searchKey", "");
            }
        }
        return "index";
    }

    //添加商品类型
    public String addProductType() {
        if(!checkAdminLogin()){//验证管理员是否登录
            return "adminLogin";
        }
        if (productService.addProductType(type)) {
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("productType", "productType");
            return getProductType();
        } else {
            return INPUT;
        }
    }

    //获取商品类型
    public String getProductType() {
        List<TbType> typeList = productService.getProductType();
        HttpServletRequest request = ServletActionContext.getRequest();
        if (typeList != null) {
            request.setAttribute("typeList", typeList);
            String productType = request.getParameter("productType");
            if (productType == null || productType.equals("")) {
                productType = request.getAttribute("productType").toString();
            }
            return productType;
        } else {
            return INPUT;
        }
    }

    //商品详情
    public String getProductInfo() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String pid = request.getParameter("id");
        if (pid != null && !pid.equals("")) {
            setProduct((TbProduct) productService.getProductInfo(Integer.parseInt(pid)));
        }
        request.setAttribute("product", this.getProduct());
        return "product";
    }

    /**
     * 获得图片的后缀
     *
     * @param fileName
     * @return
     */
    public String getExtention(String fileName) {
        int pos = fileName.lastIndexOf(".");
        return fileName.substring(pos);
    }

    /**
     * 文件上传方法
     *
     * @param source
     * @param target
     */
    public void uploadFile(File source, File target) {
        try {
            //构造输入输出流
            //低层输入流
            FileInputStream fis = new FileInputStream(source);//源文件
            //高层输入流（二进制）
            DataInputStream dis = new DataInputStream(fis);
            FileOutputStream fos = new FileOutputStream(target);//目标文件
            DataOutputStream dos = new DataOutputStream(fos);
            int temp = 0;
            while ((temp = dis.read()) != -1) {//没有读到文件末尾
                dos.write(temp);
            }
            dis.close();
            fis.close();
            dos.close();
            fos.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
     * 复制文件
     *
     * @param fileName
     */
    public void copyFile(String fileName) {
        String filePath = ServletActionContext.getServletContext().getRealPath("uploadImages");
        //构造目标文件对象
        File target = new File(filePath);
        if (!target.exists()) {
            target.mkdir();
            System.out.println("图片存储文件夹创建成功");
        }
        target = new File(filePath, fileName);
        //调用方法实现文件的复制,注意必须是要创建先创建文件夹，创建完文件再创建文件，对文件进行操作
        uploadFile(file, target);
    }

    //更新商品
    public String updateProduct(){
        if(!checkAdminLogin()){//验证管理员是否登录
            return "adminLogin";
        }
        Map session = ActionContext.getContext().getSession();
        HttpServletRequest request = ServletActionContext.getRequest();
        int page = 1;
        if (session.containsKey("pageBean")){
            setPageBean((PageBean) session.get("pageBean"));
            page = pageBean.getCurrentPage();
            List<TbProduct> productList = (List<TbProduct>) this.pageBean.getList();
            request.setAttribute("productList", productList);
            request.setAttribute("pageBean",this.getPageBean());
        }

        TbProduct oldProduct = (TbProduct)productService.getProductInfo(this.product.getId());
        oldProduct.setName(this.product.getName());
        oldProduct.setStock(this.product.getStock());
        oldProduct.setNormalPrice(this.product.getNormalPrice());
        oldProduct.setMarketPrice(this.product.getMarketPrice());
        if (fileFileName != null && !fileFileName.equals("")) {
            fileFileName = new Date().getTime() + getExtention(this.getFileFileName());
            product.setImages(fileFileName);
            oldProduct.setImages(this.product.getImages());
        }

        if(productService.updateProduct(oldProduct)){
            if (file != null) {
                copyFile(fileFileName);
            }
            setPageBean(productService.getProducts(page,paseSize));
            session.put("pageBean",this.getPageBean());
            List<TbProduct> productList = (List<TbProduct>) this.pageBean.getList();
            request.setAttribute("productList", productList);
            request.setAttribute("pageBean",this.getPageBean());
            request.setAttribute("errors","修改成功");
        }else{
            request.setAttribute("errors","修改失败");
        }
        return "manageProducts";
    }
}

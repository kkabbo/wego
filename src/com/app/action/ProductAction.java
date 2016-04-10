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
        if (fileFileName != "") {
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
        return "index";
    }

    //获取商品
    public String getProducts() {
        Map session = ActionContext.getContext().getSession();
        session.put("searchKey", null);//搜索关键字为空的话是所有商品

        setPageBean(productService.getProducts(1, 10));
        session.put("pageBean", this.getPageBean());
        List<TbProduct> productList = (List<TbProduct>) this.pageBean.getList();
        HttpServletRequest request = ServletActionContext.getRequest();
        if (productList != null) {
            request.setAttribute("productList", productList);
        }
        return "index";
    }

    //下一页
    public String nextPage() {
        Map session = ActionContext.getContext().getSession();
        String searchKey = this.product.getName();
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
            pageSize = pb.getPageSize();
        }else{//pb为空说明没有进acion获取数据直接进products.jsp
            getProducts();
        }
        if(searchKey==null || searchKey.equals("")){//搜索关键字为空说明是查找所有商品
            setPageBean(productService.getProducts(currentPage, pageSize));
        }else{
            setPageBean(productService.getProductsByName(searchKey, currentPage, pageSize));
        }
        session.put("pageBean", this.getPageBean());
        List<TbProduct> productList = (List<TbProduct>) this.pageBean.getList();
        HttpServletRequest request = ServletActionContext.getRequest();
        if (productList != null) {
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
        }
        return "index";
    }

    //添加商品类型
    public String addProductType() {
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
}
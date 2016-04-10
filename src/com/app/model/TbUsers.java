package com.app.model;

import javax.persistence.*;

/**
 * Created on 2016/4/3.
 */
@Entity
@Table(name = "tb_users", schema = "wego_db", catalog = "")
public class TbUsers{
    private int id;
    private String name;
    private String password;
    private String userName;
    private String email;
    private String sex;
    private String phone;
    private Integer age;
    private String images;
    private Integer addressId;
    private String rdate;
    private String status;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "userName")
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Basic
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "sex")
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Basic
    @Column(name = "phone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "age")
    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    @Basic
    @Column(name = "images")
    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    @Basic
    @Column(name = "addressId")
    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    @Basic
    @Column(name = "rdate")
    public String getRdate() {
        return rdate;
    }

    public void setRdate(String rdate) {
        this.rdate = rdate;
    }

    @Basic
    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TbUsers tbUsers = (TbUsers) o;

        if (id != tbUsers.id) return false;
        if (name != null ? !name.equals(tbUsers.name) : tbUsers.name != null) return false;
        if (password != null ? !password.equals(tbUsers.password) : tbUsers.password != null) return false;
        if (userName != null ? !userName.equals(tbUsers.userName) : tbUsers.userName != null) return false;
        if (email != null ? !email.equals(tbUsers.email) : tbUsers.email != null) return false;
        if (sex != null ? !sex.equals(tbUsers.sex) : tbUsers.sex != null) return false;
        if (phone != null ? !phone.equals(tbUsers.phone) : tbUsers.phone != null) return false;
        if (age != null ? !age.equals(tbUsers.age) : tbUsers.age != null) return false;
        if (images != null ? !images.equals(tbUsers.images) : tbUsers.images != null) return false;
        if (addressId != null ? !addressId.equals(tbUsers.addressId) : tbUsers.addressId != null) return false;
        if (rdate != null ? !rdate.equals(tbUsers.rdate) : tbUsers.rdate != null) return false;
        if (status != null ? !status.equals(tbUsers.status) : tbUsers.status != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (userName != null ? userName.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (sex != null ? sex.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (age != null ? age.hashCode() : 0);
        result = 31 * result + (images != null ? images.hashCode() : 0);
        result = 31 * result + (addressId != null ? addressId.hashCode() : 0);
        result = 31 * result + (rdate != null ? rdate.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        return result;
    }
}

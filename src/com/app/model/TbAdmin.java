package com.app.model;

import javax.persistence.*;

/**
 * Created on 2016/4/3.
 */
@Entity
@Table(name = "tb_admin", schema = "wego_db", catalog = "")
public class TbAdmin{
    private int id;
    private String name;
    private String password;
    private String sex;
    private String phone;
    private String images;

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
    @Column(name = "images")
    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TbAdmin tbAdmin = (TbAdmin) o;

        if (id != tbAdmin.id) return false;
        if (name != null ? !name.equals(tbAdmin.name) : tbAdmin.name != null) return false;
        if (password != null ? !password.equals(tbAdmin.password) : tbAdmin.password != null) return false;
        if (sex != null ? !sex.equals(tbAdmin.sex) : tbAdmin.sex != null) return false;
        if (phone != null ? !phone.equals(tbAdmin.phone) : tbAdmin.phone != null) return false;
        if (images != null ? !images.equals(tbAdmin.images) : tbAdmin.images != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (sex != null ? sex.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (images != null ? images.hashCode() : 0);
        return result;
    }
}

package com.app.model;

import javax.persistence.*;

/**
 * Created on 2016/4/7.
 */
@Entity
@Table(name = "tb_address", schema = "wego_db", catalog = "")
public class TbAddress {
    private int id;
    private Integer userId;
    private String contacts;
    private String phone;
    private String province;
    private String city;
    private String county;
    private String address;
    private Integer isDefault;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "userId")
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "contacts")
    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
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
    @Column(name = "province")
    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    @Basic
    @Column(name = "city")
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Basic
    @Column(name = "county")
    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    @Basic
    @Column(name = "address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "isDefault")
    public Integer getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(Integer isDefault) {
        this.isDefault = isDefault;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TbAddress tbAddress = (TbAddress) o;

        if (id != tbAddress.id) return false;
        if (userId != null ? !userId.equals(tbAddress.userId) : tbAddress.userId != null) return false;
        if (contacts != null ? !contacts.equals(tbAddress.contacts) : tbAddress.contacts != null) return false;
        if (phone != null ? !phone.equals(tbAddress.phone) : tbAddress.phone != null) return false;
        if (province != null ? !province.equals(tbAddress.province) : tbAddress.province != null) return false;
        if (city != null ? !city.equals(tbAddress.city) : tbAddress.city != null) return false;
        if (county != null ? !county.equals(tbAddress.county) : tbAddress.county != null) return false;
        if (address != null ? !address.equals(tbAddress.address) : tbAddress.address != null) return false;
        if (isDefault != null ? !isDefault.equals(tbAddress.isDefault) : tbAddress.isDefault != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        result = 31 * result + (contacts != null ? contacts.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (province != null ? province.hashCode() : 0);
        result = 31 * result + (city != null ? city.hashCode() : 0);
        result = 31 * result + (county != null ? county.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (isDefault != null ? isDefault.hashCode() : 0);
        return result;
    }
}

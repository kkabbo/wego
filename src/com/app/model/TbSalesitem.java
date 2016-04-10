package com.app.model;

import javax.persistence.*;

/**
 * Created on 2016/4/3.
 */
@Entity
@Table(name = "tb_salesitem", schema = "wego_db", catalog = "")
public class TbSalesitem {
    private int id;
    private int orderId;
    private Integer count;
    private Double price;
    private Double amount;
    private TbProduct product;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "orderId")
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public TbProduct getProduct() {
        return product;
    }

    public void setProduct(TbProduct product) {
        this.product = product;
    }

    @Basic
    @Column(name = "count")
    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Basic
    @Column(name = "price")
    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Basic
    @Column(name = "amount")
    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

}

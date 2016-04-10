package com.app.model;

import javax.persistence.*;

/**
 * Created on 2016/4/3.
 */
@Entity
@Table(name = "tb_product", schema = "wego_db", catalog = "")
public class TbProduct{
    private int id;
    private String name;
    private Integer typeId;
    private String description;
    private Double normalPrice;
    private Double marketPrice;
    private String images;
    private Integer sellCount;
    private String date;
    private String content;
    private Integer stock;
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
    @Column(name = "typeId")
    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    @Basic
    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "normalPrice")
    public Double getNormalPrice() {
        return normalPrice;
    }

    public void setNormalPrice(Double normalPrice) {
        this.normalPrice = normalPrice;
    }

    @Basic
    @Column(name = "marketPrice")
    public Double getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(Double marketPrice) {
        this.marketPrice = marketPrice;
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
    @Column(name = "sellCount")
    public Integer getSellCount() {
        return sellCount;
    }

    public void setSellCount(Integer sellCount) {
        this.sellCount = sellCount;
    }

    @Basic
    @Column(name = "date")
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Basic
    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Basic
    @Column(name = "stock")
    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
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

        TbProduct tbProduct = (TbProduct) o;

        if (id != tbProduct.id) return false;
        if (name != null ? !name.equals(tbProduct.name) : tbProduct.name != null) return false;
        if (typeId != null ? !typeId.equals(tbProduct.typeId) : tbProduct.typeId != null) return false;
        if (description != null ? !description.equals(tbProduct.description) : tbProduct.description != null)
            return false;
        if (normalPrice != null ? !normalPrice.equals(tbProduct.normalPrice) : tbProduct.normalPrice != null) return false;
        if (marketPrice != null ? !marketPrice.equals(tbProduct.marketPrice) : tbProduct.marketPrice != null)
            return false;
        if (images != null ? !images.equals(tbProduct.images) : tbProduct.images != null) return false;
        if (sellCount != null ? !sellCount.equals(tbProduct.sellCount) : tbProduct.sellCount != null) return false;
        if (date != null ? !date.equals(tbProduct.date) : tbProduct.date != null) return false;
        if (content != null ? !content.equals(tbProduct.content) : tbProduct.content != null) return false;
        if (stock != null ? !stock.equals(tbProduct.stock) : tbProduct.stock != null) return false;
        if (status != null ? !status.equals(tbProduct.status) : tbProduct.status != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (typeId != null ? typeId.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (normalPrice != null ? normalPrice.hashCode() : 0);
        result = 31 * result + (marketPrice != null ? marketPrice.hashCode() : 0);
        result = 31 * result + (images != null ? images.hashCode() : 0);
        result = 31 * result + (sellCount != null ? sellCount.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (stock != null ? stock.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        return result;
    }
}

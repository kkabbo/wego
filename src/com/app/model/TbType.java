package com.app.model;

import javax.persistence.*;

/**
 * Created on 2016/4/4.
 */
@Entity
@Table(name = "tb_type", schema = "wego_db", catalog = "")
public class TbType{
    private int id;
    private String name;
    private String description;
    private Integer parentId;

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
    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "parentId")
    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TbType tbType = (TbType) o;

        if (id != tbType.id) return false;
        if (name != null ? !name.equals(tbType.name) : tbType.name != null) return false;
        if (description != null ? !description.equals(tbType.description) : tbType.description != null) return false;
        if (parentId != null ? !parentId.equals(tbType.parentId) : tbType.parentId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (parentId != null ? parentId.hashCode() : 0);
        return result;
    }
}

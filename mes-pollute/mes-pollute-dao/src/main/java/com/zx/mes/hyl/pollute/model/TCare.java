package com.zx.mes.hyl.pollute.model;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Administrator on 2017/9/21.
 */
@Entity
@Table(name = "CARE", schema = "dbo", catalog = "pollute")
public class TCare {
    private String id;
    private String name;
    private Timestamp createdatetime;
    private Timestamp modifydatetime;
    private String remark;
    private TCaretype tCaretype;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="CARETYPE_ID")
    public TCaretype gettCaretype() {
        return tCaretype;
    }

    public void settCaretype(TCaretype tCaretype) {
        this.tCaretype = tCaretype;
    }

    @Id
    @Column(name = "ID", nullable = false, length = 36)
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Basic
    @Column(name = "NAME", nullable = true, length = 50)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "CREATEDATETIME", nullable = true)
    public Timestamp getCreatedatetime() {
        return createdatetime;
    }

    public void setCreatedatetime(Timestamp createdatetime) {
        this.createdatetime = createdatetime;
    }

    @Basic
    @Column(name = "MODIFYDATETIME", nullable = true)
    public Timestamp getModifydatetime() {
        return modifydatetime;
    }

    public void setModifydatetime(Timestamp modifydatetime) {
        this.modifydatetime = modifydatetime;
    }

    @Basic
    @Column(name = "REMARK", nullable = true, length = 150)
    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TCare tCare = (TCare) o;

        if (id != null ? !id.equals(tCare.id) : tCare.id != null) return false;
        if (name != null ? !name.equals(tCare.name) : tCare.name != null) return false;
        if (createdatetime != null ? !createdatetime.equals(tCare.createdatetime) : tCare.createdatetime != null)
            return false;
        if (modifydatetime != null ? !modifydatetime.equals(tCare.modifydatetime) : tCare.modifydatetime != null)
            return false;
        if (remark != null ? !remark.equals(tCare.remark) : tCare.remark != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (createdatetime != null ? createdatetime.hashCode() : 0);
        result = 31 * result + (modifydatetime != null ? modifydatetime.hashCode() : 0);
        result = 31 * result + (remark != null ? remark.hashCode() : 0);
        return result;
    }
}

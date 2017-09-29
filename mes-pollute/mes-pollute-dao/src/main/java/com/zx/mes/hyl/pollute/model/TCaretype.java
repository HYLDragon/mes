package com.zx.mes.hyl.pollute.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Administrator on 2017/9/21.
 */
@Entity
@Table(name = "CARETYPE", schema = "dbo", catalog = "pollute")
public class TCaretype {
    private String id;
    private String name;
    private String remark;
    private Set<TCare> tCares=new HashSet<TCare>(0);



    @OneToMany(fetch = FetchType.LAZY,mappedBy = "tCaretype")
    public Set<TCare> gettCares() {
        return tCares;

    }

    public void settCares(Set<TCare> tCares) {
        this.tCares = tCares;
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
    @Column(name = "NAME", nullable = false, length = 50)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

        TCaretype tCaretype = (TCaretype) o;

        if (id != null ? !id.equals(tCaretype.id) : tCaretype.id != null) return false;
        if (name != null ? !name.equals(tCaretype.name) : tCaretype.name != null) return false;
        if (remark != null ? !remark.equals(tCaretype.remark) : tCaretype.remark != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (remark != null ? remark.hashCode() : 0);
        return result;
    }
}

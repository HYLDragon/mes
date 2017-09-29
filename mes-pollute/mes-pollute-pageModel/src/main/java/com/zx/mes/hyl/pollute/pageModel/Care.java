package com.zx.mes.hyl.pollute.pageModel;

import java.util.Date;

/**
 * Created by Administrator on 2017/9/21.
 */
public class Care {
    private String id;

    private String name;

    private Date createdatetime;

    private Date modifydatetime;

    private String remark;

    private String caretypeId;

    private String careTypeId;
    private String careTypeName;

    private Date createdatetimeStart;
    private Date createdatetimeEnd;

    private Date modifydatetimeStart;

    public Date getModifydatetimeStart() {
        return modifydatetimeStart;
    }

    public void setModifydatetimeStart(Date modifydatetimeStart) {
        this.modifydatetimeStart = modifydatetimeStart;
    }

    public Date getModifydatetimeEnd() {
        return modifydatetimeEnd;
    }

    public void setModifydatetimeEnd(Date modifydatetimeEnd) {
        this.modifydatetimeEnd = modifydatetimeEnd;
    }

    private Date modifydatetimeEnd;

    public Date getCreatedatetimeStart() {
        return createdatetimeStart;
    }

    public void setCreatedatetimeStart(Date createdatetimeStart) {
        this.createdatetimeStart = createdatetimeStart;
    }

    public Date getCreatedatetimeEnd() {
        return createdatetimeEnd;
    }

    public void setCreatedatetimeEnd(Date createdatetimeEnd) {
        this.createdatetimeEnd = createdatetimeEnd;
    }

    public String getCareTypeName() {
        return careTypeName;
    }

    public void setCareTypeName(String careTypeName) {
        this.careTypeName = careTypeName;
    }



    public String getCareTypeId() {
        return careTypeId;
    }

    public void setCareTypeId(String careTypeId) {
        this.careTypeId = careTypeId;
    }





    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Date getCreatedatetime() {
        return createdatetime;
    }

    public void setCreatedatetime(Date createdatetime) {
        this.createdatetime = createdatetime;
    }

    public Date getModifydatetime() {
        return modifydatetime;
    }

    public void setModifydatetime(Date modifydatetime) {
        this.modifydatetime = modifydatetime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getCaretypeId() {
        return caretypeId;
    }

    public void setCaretypeId(String caretypeId) {
        this.caretypeId = caretypeId == null ? null : caretypeId.trim();
    }
}

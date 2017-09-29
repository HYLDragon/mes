package com.zx.mes.hyl.pageModel;

import java.io.Serializable;

/**
 * Created by Administrator on 2017/9/8.
 */
public class PropertyGrid implements Serializable {

    private String name;

    private String value;

    private String group;

    private String editor;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public String getEditor() {
        return editor;
    }

    public void setEditor(String editor) {
        this.editor = editor;
    }
}

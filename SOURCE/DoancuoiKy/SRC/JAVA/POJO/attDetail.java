/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

/**
 *
 * @author FreeX
 */
public class attDetail {
    //id name detail type
    private int id;
    private String name;
    private String detail;
    private String type;
    private String unit;
    
    public attDetail() {
    }

    public attDetail(int id, String name, String detail, String type, String unit) {
        this.id = id;
        this.name = name;
        this.detail = detail;
        this.type = type;
        this.unit = unit;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }
    
}

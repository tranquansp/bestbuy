/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

/**
 *
 * @author FreeX
 */
public class quotation {
    private int idp;
    private String namep;
    private int categoryp;
    private String namecate;
    private double pricep;
    private String imgfilep;
    private String descp;
    private String detailp;
    private String publishp;
    private String hotp;
    private String sttp;
    private String keysearchp;
    private int viewp;
    private String datep;

    public quotation() {
    }

    public quotation(int idp, String namep, int categoryp, String namecate, double pricep, String imgfilep, String descp, String detailp, String publishp, String hotp, String sttp, String keysearchp, int viewp, String datep) {
        this.idp = idp;
        this.namep = namep;
        this.categoryp = categoryp;
        this.namecate = namecate;
        this.pricep = pricep;
        this.imgfilep = imgfilep;
        this.descp = descp;
        this.detailp = detailp;
        this.publishp = publishp;
        this.hotp = hotp;
        this.sttp = sttp;
        this.keysearchp = keysearchp;
        this.viewp = viewp;
        this.datep = datep;
    }

    public int getCategoryp() {
        return categoryp;
    }

    public void setCategoryp(int categoryp) {
        this.categoryp = categoryp;
    }

    public String getDatep() {
        return datep;
    }

    public void setDatep(String datep) {
        this.datep = datep;
    }

    public String getDescp() {
        return descp;
    }

    public void setDescp(String descp) {
        this.descp = descp;
    }

    public String getDetailp() {
        return detailp;
    }

    public void setDetailp(String detailp) {
        this.detailp = detailp;
    }

    public String getHotp() {
        return hotp;
    }

    public void setHotp(String hotp) {
        this.hotp = hotp;
    }

    public int getIdp() {
        return idp;
    }

    public void setIdp(int idp) {
        this.idp = idp;
    }

    public String getImgfilep() {
        return imgfilep;
    }

    public void setImgfilep(String imgfilep) {
        this.imgfilep = imgfilep;
    }

    public String getKeysearchp() {
        return keysearchp;
    }

    public void setKeysearchp(String keysearchp) {
        this.keysearchp = keysearchp;
    }

    public String getNamecate() {
        return namecate;
    }

    public void setNamecate(String namecate) {
        this.namecate = namecate;
    }

    public String getNamep() {
        return namep;
    }

    public void setNamep(String namep) {
        this.namep = namep;
    }

    public double getPricep() {
        return pricep;
    }

    public void setPricep(double pricep) {
        this.pricep = pricep;
    }

    public String getPublishp() {
        return publishp;
    }

    public void setPublishp(String publishp) {
        this.publishp = publishp;
    }

    public String getSttp() {
        return sttp;
    }

    public void setSttp(String sttp) {
        this.sttp = sttp;
    }

    public int getViewp() {
        return viewp;
    }

    public void setViewp(int viewp) {
        this.viewp = viewp;
    }
    
    
    
}

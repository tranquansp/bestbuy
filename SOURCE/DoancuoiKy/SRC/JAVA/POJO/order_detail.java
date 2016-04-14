/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

/**
 *
 * @author FreeX
 */
public class order_detail {
    //name, soluong, dongia
    private int idSP;
    private String nameSP;
    private int soluongSP;
    private double dongiaSP;

    public order_detail() {
    }

    public order_detail(int idSP, String nameSP, int soluongSP, double dongiaSP) {
        this.idSP = idSP;
        this.nameSP = nameSP;
        this.soluongSP = soluongSP;
        this.dongiaSP = dongiaSP;
    }

    public double getDongiaSP() {
        return dongiaSP;
    }

    public void setDongiaSP(double dongiaSP) {
        this.dongiaSP = dongiaSP;
    }

    public int getIdSP() {
        return idSP;
    }

    public void setIdSP(int idSP) {
        this.idSP = idSP;
    }

    public String getNameSP() {
        return nameSP;
    }

    public void setNameSP(String nameSP) {
        this.nameSP = nameSP;
    }

    public int getSoluongSP() {
        return soluongSP;
    }

    public void setSoluongSP(int soluongSP) {
        this.soluongSP = soluongSP;
    }
    
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

/**
 *
 * @author FreeX
 */
public class OrderDetail {
    private int maHD;
    private int maSP;
    private String tenSP;
    private double giaSP;
    private int soluong;
    private double dongia;
    private int maKH;
    private String tenKH;
    private int ageKH;
    private String diachiKH;
    private String dtKH;
    private String ngaydathang;

    public OrderDetail() {
    }

    public OrderDetail(int maHD, int maSP, String tenSP, double giaSP, int soluong, double dongia, int maKH, String tenKH, int ageKH, String diachiKH, String dtKH, String ngaydathang) {
        this.maHD = maHD;
        this.maSP = maSP;
        this.tenSP = tenSP;
        this.giaSP = giaSP;
        this.soluong = soluong;
        this.dongia = dongia;
        this.maKH = maKH;
        this.tenKH = tenKH;
        this.ageKH = ageKH;
        this.diachiKH = diachiKH;
        this.dtKH = dtKH;
        this.ngaydathang = ngaydathang;
    }

    public int getAgeKH() {
        return ageKH;
    }

    public void setAgeKH(int ageKH) {
        this.ageKH = ageKH;
    }

    public String getDiachiKH() {
        return diachiKH;
    }

    public void setDiachiKH(String diachiKH) {
        this.diachiKH = diachiKH;
    }

    public double getDongia() {
        return dongia;
    }

    public void setDongia(double dongia) {
        this.dongia = dongia;
    }

    public String getDtKH() {
        return dtKH;
    }

    public void setDtKH(String dtKH) {
        this.dtKH = dtKH;
    }

    public double getGiaSP() {
        return giaSP;
    }

    public void setGiaSP(double giaSP) {
        this.giaSP = giaSP;
    }

    public int getMaHD() {
        return maHD;
    }

    public void setMaHD(int maHD) {
        this.maHD = maHD;
    }

    public int getMaKH() {
        return maKH;
    }

    public void setMaKH(int maKH) {
        this.maKH = maKH;
    }

    public int getMaSP() {
        return maSP;
    }

    public void setMaSP(int maSP) {
        this.maSP = maSP;
    }

    public String getNgaydathang() {
        return ngaydathang;
    }

    public void setNgaydathang(String ngaydathang) {
        this.ngaydathang = ngaydathang;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public String getTenKH() {
        return tenKH;
    }

    public void setTenKH(String tenKH) {
        this.tenKH = tenKH;
    }

    public String getTenSP() {
        return tenSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }
    
           
    
}

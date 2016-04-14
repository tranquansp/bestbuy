/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

/**
 *
 * @author FreeX
 */
public class user {

    private int idu;
    private String nameu;
    private String ava;
    private String phoneu;
    private String addressu;

    public user() {
    }

    public user(int idu, String nameu, String ava, String phoneu, String addressu) {
        this.idu = idu;
        this.nameu = nameu;
        this.ava = ava;
        this.phoneu = phoneu;
        this.addressu = addressu;
    }

    public String getAddressu() {
        return addressu;
    }

    public void setAddressu(String addressu) {
        this.addressu = addressu;
    }

    public String getAva() {
        return ava;
    }

    public void setAva(String ava) {
        this.ava = ava;
    }

    public int getIdu() {
        return idu;
    }

    public void setIdu(int idu) {
        this.idu = idu;
    }

    public String getNameu() {
        return nameu;
    }

    public void setNameu(String nameu) {
        this.nameu = nameu;
    }

    public String getPhoneu() {
        return phoneu;
    }

    public void setPhoneu(String phoneu) {
        this.phoneu = phoneu;
    }
    
    
}

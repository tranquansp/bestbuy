/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package datamining;

import java.util.ArrayList;
import pojo.product;

/**
 *
 * @author FreeX
 */
public class classficationProduct {
    public static ArrayList<Integer> introProduct(ArrayList<product> A){
        ArrayList<Integer> M = new ArrayList<Integer>();
        product p = new product();
        int pr1 ,pr2,pr3,s1,s2,s3,cr1,cr2;
        pr1 = pr2 = pr3 = s1 = s2 = s3= cr1 = cr2 =0;
        for(int foo=0;foo<A.size();foo++){
            p = A.get(foo);
            if(p.getPricep() < 4000000){ // cac san pham gia re
                pr1++;
            }
            if(p.getPricep() > 10000000){ //cac san pham cao cap
                pr3++;
            }
            if(p.getPricep() < 10000000 && p.getPricep() > 4000000){ // cac san pham trung binh
                pr2++;
            }
            if(p.getHotp().equals("h")){
                s1++;
            }
            if(p.getHotp().equals("s")){
                s2++;
            }
            if(p.getHotp().equals("i")){
                s3++;
            }
            if(p.getViewp() == 1){
                cr1++;
            }
            if(p.getViewp() == 0){
                cr2++;
            }
            int temp1 = ((pr1>pr2?pr1:pr2)>pr3)?(pr1>pr2?pr1:pr2):pr3;
            if(temp1 == pr1){
                M.add(1);
            }
            if(temp1 == pr2){
                M.add(2);
            }
            if(temp1 == pr3){
                M.add(3);
            }
            int temp2 = s1>s2?s1:s2;
            if(temp2 == s1){
                M.add(1);
            }
            if(temp2 == s2){
                M.add(2);
            }
            int temp3 = cr1>cr2?cr1:cr2;
            if(temp3 == cr1){
                M.add(1);
            }
            if(temp3 == cr2){
                M.add(2);
            }
        }
        return null;
    }
}

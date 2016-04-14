/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

/**
 *
 * @author FreeX
 */
public class category {
    private int ids;
    private String names;
    private int parents;
    
    public category() {
    }

    public category(int ids, String names) {
        this.ids = ids;
        this.names = names;
        this.parents = parents;
    }

    public int getParents() {
        return parents;
    }

    public void setParents(int parents) {
        this.parents = parents;
    }
    
    
    public int getIds() {
        return ids;
    }

    public void setIds(int ids) {
        this.ids = ids;
    }

    public String getNames() {
        return names;
    }

    public void setNames(String names) {
        this.names = names;
    }
    
    
}

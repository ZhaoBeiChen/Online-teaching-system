package View;

import Model.Class;
import Model.Offered;

public class SelectedView {
    private int id;
    private Class class1;
    private Offered offered;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Class getClass1() {
        return class1;
    }

    public void setClass1(Class class1) {
        this.class1 = class1;
    }

    public Offered getOffered() {
        return offered;
    }

    public void setOffered(Offered offered) {
        this.offered = offered;
    }
}

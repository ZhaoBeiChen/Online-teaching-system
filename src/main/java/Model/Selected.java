package Model;

public class Selected {
    private int id;
    private int offeredid;
    private int classid;

    private Offered offered;
    private Class class0;
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOfferedid() {
        return offeredid;
    }

    public void setOfferedid(int offeredid) {
        this.offeredid = offeredid;
    }

    public int getClassid() {
        return classid;
    }

    public void setClassid(int classid) {
        this.classid = classid;
    }

    public Offered getOffered() {
        return offered;
    }

    public void setOffered(Offered offered) {
        this.offered = offered;
    }

    public Class getClass0() {
        return class0;
    }

    public void setClass0(Class class0) {
        this.class0 = class0;
    }
}

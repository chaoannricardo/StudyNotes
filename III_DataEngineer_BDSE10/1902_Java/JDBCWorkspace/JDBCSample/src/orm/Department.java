package orm;

/**
 * Created with IntelliJ IDEA.
 * User: vincent
 * Date: 13/8/15
 * Time: 上午10:53
 * To change this template use File | Settings | File Templates.
 */
public class Department {
    private int deptNO;
    private String name;

    public int getDeptNO() {
        return deptNO;
    }

    public void setDeptNO(int deptNO) {
        this.deptNO = deptNO;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    private String location;
}

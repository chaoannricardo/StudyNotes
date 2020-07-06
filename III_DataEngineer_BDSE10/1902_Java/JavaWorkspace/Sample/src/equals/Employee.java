package equals;

public class Employee extends Object{
    private String id;

    public Employee(String id) {
        this.id = id;
    }


     @Override
    public boolean equals(Object obj) {
        if ( obj instanceof Employee){
            Employee e1 = (Employee) obj;
            if ( id != null ){
                return id.equals(e1.id);
            }
        }
        return false;
    }


    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }

    @Override
    public String toString() {
        return "員工編號="+this.id;
    }
}

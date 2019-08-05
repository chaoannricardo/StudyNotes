package inheritance;

public class TestInheritance {

    public static void main(String[] args) {

        /* step 1 Item3C也有可以有setName, setPrice並且可以使用 */
        /*
        Notebook notebook = new Notebook();
        notebook.setName("Asus Notebook");
        notebook.setPrice(50000);
        notebook.setWarranty(365);

        System.out.println(notebook.getName());
        */

        /* step 2 Notebook 建構子 */
        Notebook asus_notebook = new Notebook("Asus Notebook", 50000,365);
        System.out.println(asus_notebook.description());

        /*step 3 test protected name 在不是繼承的情況下，也可以看到,因為Protected > package */
        System.out.println(asus_notebook.name);

        /*step 4 test protected name 繼承的情況下，但不同套件，也可以看到
        * 產生一個新的package，叫pack1，建立另一個ProductABC 繼承Product，
        * 覆寫description方法，可以呼叫this.name
        * */

    }

}

package modifier;

//step 1. test final class
public class FinalTest {

    //step3. test final variable
    private  int age = 20;
    
    //step3. test final object reference
    private  String key = "001";

    //step2. test final method
    void test(){
        System.out.println("test");
    }
    
    public class B extends FinalTest{

       
    }

}

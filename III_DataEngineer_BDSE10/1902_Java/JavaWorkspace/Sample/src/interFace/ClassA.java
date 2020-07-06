package interFace;

public class ClassA {
    private int counter = 0;

    private class InnerClass {
        public int add(){
            return ++counter;
        }
    }
    public void increment(){
        //利用inner class 改變counter的值,非 static inner class 可以看見private成員
        InnerClass inner = new InnerClass();
        inner.add();
        System.out.println(counter);
    }

    public static void main(String[] args) {
        ClassA a = new ClassA(){
            @Override
            public void increment() {
                super.increment();
            }
        };
        a.increment();
        //InnerClassInA innerClassInA = new InnerClassInA();//無法產生
        //InnerClassInA innerClassInA = a.new InnerClassInA();//必須利用外部類別物件才能產生inner class物件
        //innerClassInA.add();
    }
}

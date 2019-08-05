package interFace;

public class AnonymousClassDemo {
    public static void main(String[] args) {

        SayHello chinese = new SayHello() {
            public String sayHi() {
                return "你好";
            }
        };
        SayHello english = new SayHello() {
            public String sayHi() {
                return "Hello";
            }
        };
        System.out.println(chinese.sayHi());
        System.out.println(english.sayHi());
    }
}

package lambda;

import java.util.function.IntConsumer;
import java.util.stream.IntStream;

public class Lambda1 {
    public static void main(String[] args) {
        for (int i = 0; i < 10; i++) {
            System.out.println("Hello lambda "+i);
        }

        IntConsumer action = i ->  System.out.println("Hello lambda" + i);
        System.out.println("action = " + action);

        for (int i = 0; i < 10; i++) {
            action.accept(i);
        }

        IntStream.range(0,10).forEach(action);

        IntStream.range(0,10).forEach( i -> System.out.println("Hello lambda"));
    }
}

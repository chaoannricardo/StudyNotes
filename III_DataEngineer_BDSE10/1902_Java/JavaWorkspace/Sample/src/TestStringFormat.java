public class TestStringFormat {
    public static void main(String[] args) {
        String message = String.format("%15s=%10.0f", "bollinger", 10.00);
        System.out.println(message);
    }
}

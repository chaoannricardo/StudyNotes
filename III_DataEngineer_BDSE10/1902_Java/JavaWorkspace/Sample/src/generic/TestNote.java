package generic;

import java.util.Arrays;
import java.util.List;

public class TestNote {
    public static void main(String[] args) {
        NoteString note1 = new NoteString("java gc");
        System.out.println(note1.getContent());

        NoteInt note2 = new NoteInt(1);
        System.out.println(note2.getContent());

        //使用generic
        Note<String> n1 = new Note<>("java gc");
        Note<Integer> n2 = new Note<>(2);
        System.out.println(n1.getContent());
        System.out.println(n2.getContent());

        List<String> list = Arrays.asList("Hello", "Generic", "method"); //使用文字則回傳List<String>
        List<Integer> integers = Arrays.asList(1, 2, 3); //使用int,則回傳List<Integer>

        Note<Integer> n3 = new Note<>(3);
        System.out.println("總和："+sumNote(n2,n3));

    }

    public static double sumNote(Note<? extends Number>... notes){
        double sum = 0.0;
        for (Note<? extends Number> note : notes) {
            sum = note.getContent().doubleValue();
        }
        return sum / notes.length;
    }

}

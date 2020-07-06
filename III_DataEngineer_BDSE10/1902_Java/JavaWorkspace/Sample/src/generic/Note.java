package generic;

public class Note<T> {
    
    private T content;

    public Note(T text ) {
        this.content = text;
    }

    public T getContent() {
        return content;
    }

    public void setContent(T content) {
        this.content = content;
    }
    
    
}

package Collection;

public class Note<T> {
	
	private T content;

	public T getContent() {
		return content;
	}

	public void setContent(T content) {
		this.content = content;
	}

	public Note(T content) {
		this.content = content;
	}
	

}

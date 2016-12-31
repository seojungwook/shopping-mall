package exception;

public class AdminRequiredException extends RuntimeException {
	public AdminRequiredException(String msg){
		super(msg);
	}
}

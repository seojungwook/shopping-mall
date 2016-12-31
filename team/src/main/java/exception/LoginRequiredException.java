package exception;

// 자바에서 예외처리는 필수임.
// 단 RuntimeException 예외처리는 생략이 가능하다.

public class LoginRequiredException extends RuntimeException{
	public LoginRequiredException(String msg){
		super(msg);
	}
}

package exception;

// �ڹٿ��� ����ó���� �ʼ���.
// �� RuntimeException ����ó���� ������ �����ϴ�.

public class LoginRequiredException extends RuntimeException{
	public LoginRequiredException(String msg){
		super(msg);
	}
}

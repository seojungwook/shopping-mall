package dao;

import logic.Member;

public interface MemberDao {

	Member getUser(String id, String pass);

	int memberInsert(Member member);

	Member selectOne(int mNo);

	int memberUpdate(Member member);

	String selectMessage(Integer no);

}

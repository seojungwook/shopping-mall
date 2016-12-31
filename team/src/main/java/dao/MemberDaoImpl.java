package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.MemberMapper;
import logic.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.MemberMapper.";

	@Override
	public Member getUser(String id, String pass) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("id", id);
		paramMap.put("pass", pass);
		Member member = sqlSession.selectOne(NS+"getMember", paramMap);
		
		return member;
	}

	@Override
	public int memberInsert(Member member) {
		member.setmNo(sqlSession.getMapper(MemberMapper.class).maxNo() + 1);
		member.setAddress(member.getAddress1() + "| " + member.getAddress2());
		member.setTel(member.getTel1() + member.getTel2() + member.getTel3());
		member.setPhone(member.getPon1() + member.getPon2() + member.getPon3());
		return sqlSession.getMapper(MemberMapper.class).insert(member);
	}

	@Override
	public Member selectOne(int mNo) {
		
		return sqlSession.getMapper(MemberMapper.class).selectOne(mNo);
	}

	@Override
	public int memberUpdate(Member member) {
		member.setAddress(member.getAddress1() + "| " + member.getAddress2());
		member.setTel(member.getTel1() + member.getTel2() + member.getTel3());
		member.setPhone(member.getPon1() + member.getPon2() + member.getPon3());
		System.out.println(member.getmNo());
		return sqlSession.getMapper(MemberMapper.class).update(member);
	}

	@Override
	public String selectMessage(Integer no) {
		
		return sqlSession.getMapper(MemberMapper.class).selectMessage(no);
	}


}

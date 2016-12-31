package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.ZzimMapper;
import logic.Zzim;


@Repository
public class ZzimDaoImpl implements ZzimDao{
	@Autowired
	   private SqlSessionTemplate sqlSession;
	   private final String NS = "dao.mapper.ZzimMapper.";
	  @Override
	  
	public void input(int mno, int num) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("mno", mno);
		map.put("num", num);
		sqlSession.getMapper(ZzimMapper.class).input(map);
	}
	@Override
	public int listcount(int mNo) {
       return sqlSession.getMapper(ZzimMapper.class).listcount(mNo);
	}
	@Override
	public List<Zzim> getlist(int mNo) {
		Map<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("mno", mNo);
		return sqlSession.selectList(NS + "getzzimlist",paramMap);
	}
	@Override
	public void delete(int mno, int num) {
		Map<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("mno", mno);
		paramMap.put("num",num);
		sqlSession.getMapper(ZzimMapper.class).delete(paramMap);
		
	}
	
}

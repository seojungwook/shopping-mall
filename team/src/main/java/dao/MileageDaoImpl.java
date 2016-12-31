package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.MileageMapper;
import logic.Mileage;

@Repository
public class MileageDaoImpl implements MileageDao{

	@Autowired
	   private SqlSessionTemplate sqlSession;
	   private final String NS = "dao.mapper.MileageMapper.";

	@Override
	public int mileCount() {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(MileageMapper.class).mileCount();
	}

	@Override
	public List<Mileage> getMileList(Integer pageNum, int limit) {
		// TODO Auto-generated method stub
		int startrow = (pageNum - 1) * limit + 1;
	      int endrow = startrow + limit - 1;
	      Map<String, Integer> map = new HashMap<String, Integer>();
	      map.put("start", startrow);
	      map.put("end", endrow);
	      return sqlSession.selectList(NS + "getMileage", map);
	}
	
	

	@Override
	public Mileage mileDetail(Integer num) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(MileageMapper.class).mileageDetail(num);
	}

	@Override
	public void mileWrite(Mileage mileage, HttpServletRequest request) {
		// TODO Auto-generated method stub
		  
		
		Integer i = sqlSession.getMapper(MileageMapper.class).getMaxNum();
		      mileage.setListno(i+1);
		      

		      sqlSession.getMapper(MileageMapper.class).mileageWrite(mileage);
		
	}

	@Override
	public void mileDelete(int num) {
		System.out.println(num);
		sqlSession.getMapper(MileageMapper.class).delete(num);
	}

	@Override
	public String getPass(int num) {
		// TODO Auto-generated method stub
		return null;
	}

}

package dao.mapper;


import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface ZzimMapper {

	@Insert("insert into Zzim values(#{mno},#{num})")
	void input(Map<String, Integer> map);
    @Select("select count(nvl(bNo,0)) from zzim where mNo=#{mNo}")
	int listcount(int mNo);
    @Delete("delete from zzim where mno=#{mno} and bNo=#{num}")
	void delete(Map<String, Integer> paramMap);
   
    

}

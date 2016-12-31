package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Mileage;

public interface MileageMapper {

	@Select("select count(*) from mileage")
	int mileCount();

	@Insert(" insert into mileage(listno, mNo, money, mileage, mileage_check, regdate)"
	          + " values(#{listno},#{mNo},#{money},#{mileage},"
	          + "#{mileage_check}, sysdate)")
	void mileageWrite(Mileage mileage);

	@Select("select nvl(max(listno),0) from mileage")
	Integer getMaxNum();

	@Select("select listno, mNo, money, mileage, mileage_check, regdate "
			+ "from mileage where listno=#{listno}")
	Mileage mileageDetail(Integer num);

	@Delete("delete from mileage where listno = #{value}")
	void delete(int num);

}

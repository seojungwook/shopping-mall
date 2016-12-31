package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Member;

public interface MemberMapper {

	@Insert("insert into member3(MNO, NICKNAME, ID, PASS, NAME, POSTCODE, ADDRESS, TEL, PHONE, EMAIL, POINT, MILEAGE, GRADE) "
			+ "values(#{mNo}, #{nickname}, #{id}, #{pass}, #{name}, #{postcode}, #{address}, #{tel}, #{phone}, #{email}, 10, 0, 1)")
	int insert(Member member);

	@Select("select count(*) from member3")
	int maxNo();

	@Select("select *from member3")
	Member selectOne(int mNo);

	@Update("update member3 set pass = #{pass}, nickname = #{nickname}, postcode = #{postcode}, address = #{address}, tel = #{tel}, phone=#{phone}, email=#{email} where mno=#{mNo}")
	int update(Member member);

	@Select("select nickname from member3 where mno = #{value}")
	String selectMessage(Integer no);

}

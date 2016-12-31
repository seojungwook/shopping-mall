package dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import logic.Mileage;

public interface MileageDao {

	int mileCount();

	List<Mileage> getMileList(Integer pageNum, int limit);

	Mileage mileDetail(Integer num);

	void mileWrite(Mileage mileage, HttpServletRequest request);

	String getPass(int num);

	void mileDelete(int num);

}

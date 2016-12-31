package dao;

import java.util.List;

import logic.Zzim;

public interface ZzimDao {

	void input(int mno, int num);

	int listcount(int mNo);

	List<Zzim> getlist(int mNo);

	void delete(int mno, int num);

	

}

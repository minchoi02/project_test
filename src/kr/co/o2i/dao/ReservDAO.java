package kr.co.o2i.dao;

import java.util.List;
import java.util.Map;
import kr.co.o2i.util.CommonMap;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public class ReservDAO extends DefaultDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> list(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("reserv.list",param);
	}

	public int listCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("reserv.listCount",param);
	}
	
	public int insert(@Param("param")CommonMap param){
		return (int)sqlSession.insert("reserv.insert",param);
	}
	
	public int getMaxSeq(){
		return (int)sqlSession.selectOne("reserv.getMaxSeq");
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> view(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("reserv.view" ,param);
	}

	public void del(@Param("param")CommonMap param){
		sqlSession.selectOne("reserv.del",param);
	}
	
	public void update(@Param("param")CommonMap param){
		sqlSession.selectOne("reserv.update",param);
	}
	
	public void check_del(@Param("param")CommonMap param){
		sqlSession.selectOne("reserv.check_del",param);
	}
	
	public int ok_finish(@Param("param")CommonMap param){
		return (int)sqlSession.insert("reserv.ok_finish",param);
	}
	
	public int cancel_finish(@Param("param")CommonMap param){
		return (int)sqlSession.insert("reserv.cancel_finish",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> finish_list(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("reserv.finish_list",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> this_day_list(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("reserv.this_day_list",param);
	}
	
	public int pwdConfirm(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("reserv.pwdConfirm", param);
	}
 
}
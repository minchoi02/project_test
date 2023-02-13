package kr.co.o2i.dao;

import java.util.List;
import java.util.Map;
import kr.co.o2i.util.CommonMap;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public class VolunteerDAO extends DefaultDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> list(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("volunteer.list",param);
	}

	public int listCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("volunteer.listCount",param);
	}
	
	public int insert(@Param("param")CommonMap param){
		return (int)sqlSession.insert("volunteer.insert",param);
	}
	
	public int getMaxSeq(){
		return (int)sqlSession.selectOne("volunteer.getMaxSeq");
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> view(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("volunteer.view" ,param);
	}

	public void del(@Param("param")CommonMap param){
		sqlSession.selectOne("volunteer.del",param);
	}
	
	public void update(@Param("param")CommonMap param){
		sqlSession.selectOne("volunteer.update",param);
	}
	
	public void check_del(@Param("param")CommonMap param){
		sqlSession.selectOne("volunteer.check_del",param);
	}
	
	public int insertKind(@Param("param")CommonMap param){
		return (int)sqlSession.insert("volunteer.insertKind",param);
	}
	
	@SuppressWarnings("unchecked")
	public String motive_list(@Param("param")CommonMap param){
		return (String)sqlSession.selectOne("volunteer.motive_list",param);
	}
	
	public void motive_delete(@Param("param")CommonMap param){
		sqlSession.selectOne("volunteer.motive_delete",param);
	}

 
}
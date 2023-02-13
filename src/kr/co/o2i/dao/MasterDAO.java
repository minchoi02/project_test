package kr.co.o2i.dao;

import java.util.List;
import java.util.Map;
import kr.co.o2i.util.CommonMap;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public class MasterDAO extends DefaultDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> list(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("master.list",param);
	}

	public int listCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("master.listCount",param);
	}
	
	public int insert(@Param("param")CommonMap param){
		return (int)sqlSession.insert("master.insert",param);
	}
	
	public int member_insert(@Param("param")CommonMap param){
		return (int)sqlSession.insert("master.member_insert",param);
	}
	
	public int getMaxSeq(){
		return (int)sqlSession.selectOne("master.getMaxSeq");
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> view(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("master.view" ,param);
	}

	public void del(@Param("param")CommonMap param){
		sqlSession.selectOne("master.del",param);
	}
	
	public void update(@Param("param")CommonMap param){
		sqlSession.selectOne("master.update",param);
	}
	
	public int check_id(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("master.check_id", param);
	}

	public void check_del(@Param("param")CommonMap param){
		sqlSession.selectOne("master.check_del",param);
	}
 
}
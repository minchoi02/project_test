package kr.co.o2i.dao;

import java.util.List;
import java.util.Map;
import kr.co.o2i.util.CommonMap;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public class SupportDAO extends DefaultDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> list(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("support.list",param);
	}

	public int listCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("support.listCount",param);
	}
	
	public int insert(@Param("param")CommonMap param){
		return (int)sqlSession.insert("support.insert",param);
	}
	
	public int getMaxSeq(){
		return (int)sqlSession.selectOne("support.getMaxSeq");
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> view(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("support.view" ,param);
	}

	public void del(@Param("param")CommonMap param){
		sqlSession.selectOne("support.del",param);
	}
	
	public void update(@Param("param")CommonMap param){
		sqlSession.selectOne("support.update",param);
	}
	
	public void check_del(@Param("param")CommonMap param){
		sqlSession.selectOne("support.check_del",param);
	}
	
	public int insertKind(@Param("param")CommonMap param){
		return (int)sqlSession.insert("support.insertKind",param);
	}
	
	@SuppressWarnings("unchecked")
	public String motive_list(@Param("param")CommonMap param){
		return (String)sqlSession.selectOne("support.motive_list",param);
	}
	
	public void motive_delete(@Param("param")CommonMap param){
		sqlSession.selectOne("support.motive_delete",param);
	}
	
	public Map<String, Object> get_menu_info(@Param("param")Map<String, Object> param){
		return (Map<String, Object>) sqlSession.selectOne("support.get_menu_info",param);
	}
	
	public void insert_menu_statistics(@Param("param")Map<String, Object> param){
		sqlSession.selectOne("support.insert_menu_statistics",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> get_menu_statistics(@Param("param")Map<String, Object> param){
		return (List<Map<String, Object>>) sqlSession.selectList("support.get_menu_statistics",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> get_menu_log(@Param("param")Map<String, Object> param){
		return (List<Map<String, Object>>) sqlSession.selectList("support.get_menu_log",param);
	}
	
	public Integer get_menu_log_cnt(@Param("param")Map<String, Object> param){
		return (Integer) sqlSession.selectOne("support.get_menu_log_cnt",param);
	}

 
}
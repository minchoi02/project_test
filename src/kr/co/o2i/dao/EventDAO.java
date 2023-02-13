package kr.co.o2i.dao;

import java.util.List;
import java.util.Map;

import kr.co.o2i.util.CommonMap;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAO extends DefaultDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> list(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("event.list",param);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> view(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("event.view" ,param);
	}
	
	public void update(@Param("param")CommonMap param){
		sqlSession.selectOne("event.update",param);
	}
	
	public void delete(@Param("param")CommonMap param){
		sqlSession.selectOne("event.delete",param);
	}
	
	public void insert(@Param("param")CommonMap param){
		sqlSession.selectOne("event.insert",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> m_list(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("event.m_list",param);
	}
	
	public int mTotalCnt(@Param("param")CommonMap param){
		return (int)sqlSession.insert("event.mTotalCnt",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> userlist(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("event.userlist",param);
	}
	
}

package kr.co.o2i.dao;

import java.util.List;
import java.util.Map;
import kr.co.o2i.util.CommonMap;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public class OrganizationDAO extends DefaultDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> depth1list(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("organization.depth1list",param);
	}
	
	public int depth1listCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("organization.depth1listCount",param);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> view(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("organization.view" ,param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> depth2list(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("organization.depth2list",param);
	}
	
	public int depth2listCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("organization.depth2listCount",param);
	}
	
	public int gubun1insert(@Param("param")CommonMap param){
		return (int)sqlSession.insert("organization.gubun1insert",param);
	}
	
	public int gubun2insert(@Param("param")CommonMap param){
		return (int)sqlSession.insert("organization.gubun2insert",param);
	}
	
	public void delete(@Param("param")CommonMap param){
		sqlSession.selectOne("organization.delete",param);
	}
	
	public void update(@Param("param")CommonMap param){
		sqlSession.selectOne("organization.update",param);
	}

 
}
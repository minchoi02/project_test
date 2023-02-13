package kr.co.o2i.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.co.o2i.util.CommonMap;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IntegrateDAO extends DefaultDAO{
	
	@Autowired
	@Resource(name="sqlSession")
	public SqlSession sqlSession;
	
	@Autowired
	@Resource(name="sqlSession2")
	public SqlSession sqlSession2;
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> templevillTop5(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession2.selectList("integrate.templevillTop5",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> userlist(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession2.selectList("integrate.userlist",param);
	}
	
	public int userlistCount(@Param("param")CommonMap param){
		return (int)sqlSession2.selectOne("integrate.userlistCount",param);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> view(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession2.selectOne("integrate.view" ,param);
	}
	
}

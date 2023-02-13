package kr.co.o2i.dao;

import java.util.List;
import java.util.Map;

import kr.co.o2i.util.CommonMap;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public class CodeDAO extends DefaultDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getCodeList(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("code.getCodeList",param);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getCodeName(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("code.getCodeName",param);
	}
	
}

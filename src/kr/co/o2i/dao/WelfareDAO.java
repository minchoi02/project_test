package kr.co.o2i.dao;

import java.util.List;
import java.util.Map;
import kr.co.o2i.util.CommonMap;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public class WelfareDAO extends DefaultDAO{
	
	public String kind_list(@Param("param")CommonMap param){
		return (String)sqlSession.selectOne("welfare.kind_list",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> list(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("welfare.list",param);
	}

	public int listCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("welfare.listCount",param);
	}
	
	public int insert(@Param("param")CommonMap param){
		return (int)sqlSession.insert("welfare.insert",param);
	}
	
	public int getMaxSeq(){
		return (int)sqlSession.selectOne("welfare.getMaxSeq");
	}
	
	public int insertKind(@Param("param")CommonMap param){
		return (int)sqlSession.insert("welfare.insertKind",param);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> view(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("welfare.view" ,param);
	}

	public void del(@Param("param")CommonMap param){
		sqlSession.selectOne("welfare.del",param);
	}
	
	public void kind_del(@Param("param")CommonMap param){
		sqlSession.selectOne("welfare.kind_del",param);
	}

	public void update(@Param("param")CommonMap param){
		sqlSession.selectOne("welfare.update",param);
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> codeList(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("welfare.codeList",param);
	}

	public int codeListCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("welfare.codeListCount",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTypeCode(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("welfare.selectTypeCode",param);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> code_welfare_view(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("welfare.code_welfare_view" ,param);
	}
	
	public void code_welfare_update(@Param("param")CommonMap param){
		sqlSession.selectOne("welfare.code_welfare_update",param);
	}
	
	public int welfare_code_insert(@Param("param")CommonMap param){
		return (int)sqlSession.insert("welfare.welfare_code_insert",param);
	}
	
	public void welfare_code_del(@Param("param")CommonMap param){
		sqlSession.selectOne("welfare.welfare_code_del",param);
	}
	
	public int listCountForGroup(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("welfare.listCountForGroup",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> kind_count(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("welfare.kind_count",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> user_list(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("welfare.user_list",param);
	}
 
}
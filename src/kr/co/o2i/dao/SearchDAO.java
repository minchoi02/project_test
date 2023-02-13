package kr.co.o2i.dao;

import java.util.List;
import java.util.Map;
import kr.co.o2i.util.CommonMap;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDAO extends DefaultDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> menuTop3List(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("search.menuTop3List",param);
	}
	
	public int menuCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("search.menuCount",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> menuList(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("search.menuList",param);
	}
	
	public int menuListCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("search.menuListCount",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> welfareTop3List(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("search.welfareTop3List",param);
	}
	
	public int welfareCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("search.welfareCount",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> welfareList(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("search.welfareList",param);
	}
	
	public int welfareListCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("search.welfareListCount",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> facilityTop3List(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("search.facilityTop3List",param);
	}
	
	public int facilityCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("search.facilityCount",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> facilityList(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("search.facilityList",param);
	}
	
	public int facilityListCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("search.facilityListCount",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> boardTop3List(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("search.boardTop3List",param);
	}
	
	public int boardCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("search.boardCount",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> boardList(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("search.boardList",param);
	}
	
	public int boardListCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("search.boardListCount",param);
	}
	
	
	public int searchCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("search.searchCount",param);
	}
	
	public void searchUpdate(@Param("param")CommonMap param){
		sqlSession.selectOne("search.searchUpdate",param);
	}
	
	public void searchInsert(@Param("param")CommonMap param){
		sqlSession.selectOne("search.searchInsert",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchList(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("search.searchList",param);
	}
 
}
package kr.co.o2i.dao;

import java.util.List;
import java.util.Map;
import kr.co.o2i.util.CommonMap;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public class FacilityDAO extends DefaultDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> list(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("facility.list",param);
	}

	public int listCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("facility.listCount",param);
	}
	
	public int insert(@Param("param")CommonMap param){
		return (int)sqlSession.insert("facility.insert",param);
	}
	
	public int getMaxSeq(){
		return (int)sqlSession.selectOne("facility.getMaxSeq");
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> view(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("facility.view" ,param);
	}

	public void del(@Param("param")CommonMap param){
		sqlSession.selectOne("facility.del",param);
	}
	
	public void update(@Param("param")CommonMap param){
		sqlSession.selectOne("facility.update",param);
	}	
	
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> conList(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("facility.conList",param);
	}

	public int conListCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("facility.conListCount",param);
	}
	
	public int conInsert(@Param("param")CommonMap param){
		return (int)sqlSession.insert("facility.conInsert",param);
	}
	
	public int conGetMaxSeq(){
		return (int)sqlSession.selectOne("facility.conGetMaxSeq");
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> conView(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("facility.conView" ,param);
	}

	public void conDel(@Param("param")CommonMap param){
		sqlSession.selectOne("facility.conDel",param);
	}
	
	public void conUpdate(@Param("param")CommonMap param){
		sqlSession.selectOne("facility.conUpdate",param);
	}	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> commentList(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("facility.commentList",param);
	}

	public int commentListCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("facility.commentListCount",param);
	}
	
	public void commentDel(@Param("param")CommonMap param){
		sqlSession.selectOne("facility.commentDel",param);
	}
	
	public int commentInsert(@Param("param")CommonMap param){
		return (int)sqlSession.insert("facility.commentInsert",param);
	}
	
	public int commentGetMaxSeq(){
		return (int)sqlSession.selectOne("facility.commentGetMaxSeq");
	}
	
	public void commentUpdate(@Param("param")CommonMap param){
		sqlSession.selectOne("facility.commentUpdate",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> userCommentList(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("facility.userCommentList",param);
	}

	public int userCommentListCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("facility.userCommentListCount",param);
	}
	
	public void comment_check_del(@Param("param")CommonMap param){
		sqlSession.selectOne("facility.comment_check_del",param);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> comment_view(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("facility.comment_view" ,param);
	}
	
	public int comment_pwd_check(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("facility.comment_pwd_check",param);
	}	
	
	public int favoriteGetMaxSeq(){
		return (int)sqlSession.selectOne("facility.favoriteGetMaxSeq");
	}
	
	public int favoriteInsert(@Param("param")CommonMap param){
		return (int)sqlSession.insert("facility.favoriteInsert",param);
	}
	
	public int getFavoriteCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("facility.getFavoriteCount",param);
	}
	
	public int favoriteDelete(@Param("param")CommonMap param){
		return (int)sqlSession.insert("facility.favoriteDelete",param);
	}
	
}
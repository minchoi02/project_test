package kr.co.o2i.dao;

import java.util.List;
import java.util.Map;
import kr.co.o2i.util.CommonMap;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO extends DefaultDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> list(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("member.list",param);
	}

	public int listCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("member.listCount",param);
	}
	
	public int insert(@Param("param")CommonMap param){
		return (int)sqlSession.insert("member.insert",param);
	}
	
	public int getMaxSeq(){
		return (int)sqlSession.selectOne("member.getMaxSeq");
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> view(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("member.view" ,param);
	}

	public void del(@Param("param")CommonMap param){
		sqlSession.selectOne("member.del",param);
	}
	
	public void update(@Param("param")CommonMap param){
		sqlSession.selectOne("member.update",param);
	}
	
	public int check_id(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("member.check_id", param);
	}

	public void check_del(@Param("param")CommonMap param){
		sqlSession.selectOne("member.check_del",param);
	}
	
	public void user_drop(@Param("param")CommonMap param){
		sqlSession.selectOne("member.user_drop",param);
	}
	
	public void drop_delete(@Param("param")CommonMap param){
		sqlSession.selectOne("member.drop_delete",param);
	}
	
	public void drop_cancel(@Param("param")CommonMap param){
		sqlSession.selectOne("member.drop_cancel",param);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> userIdCheck(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("member.userIdCheck" ,param);
	}
	
	public void drop_board_update(@Param("param")CommonMap param){
		sqlSession.selectOne("member.drop_board_update",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> findId(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("member.findId",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> findPwd(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("member.findPwd",param);
	}
	
	public void findPwdUpdate(@Param("param")CommonMap param){
		sqlSession.selectOne("member.findPwdUpdate",param);
	}
 
}
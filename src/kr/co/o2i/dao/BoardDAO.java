package kr.co.o2i.dao;

import java.util.List;
import java.util.Map;
import kr.co.o2i.util.CommonMap;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO extends DefaultDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> nList(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("board.nList",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> list(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("board.list",param);
	}

	public int listCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("board.listCount",param);
	}

	public int getMaxSeq(){
		return (int)sqlSession.selectOne("board.getMaxSeq");
	}
	
	public int insert(@Param("param")CommonMap param){
		return (int)sqlSession.insert("board.insert",param);
	}

	public void plus_ref_level(@Param("param")CommonMap param){
		sqlSession.selectOne("board.plus_ref_level",param);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> view(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("board.view" ,param);
	}

	public void increaseHit(@Param("param")CommonMap param){
		sqlSession.selectOne("board.increaseHit",param);
	}
	
	public void fileinsert(@Param("param")Map<String, Object> param){
		sqlSession.selectOne("board.fileinsert",param);
	}
	
	public void file_del(@Param("param")CommonMap param){
		sqlSession.selectOne("board.file_del",param);
	}
	
	public void fileUpdate(@Param("param")Map<String, Object> param){
		sqlSession.selectOne("board.fileUpdate",param);
	}
	
	public void del(@Param("param")CommonMap param){
		sqlSession.selectOne("board.del",param);
	}
	
	public void qna_del(@Param("param")CommonMap param){
		sqlSession.selectOne("board.qna_del",param);
	}
	
	public void update(@Param("param")CommonMap param){
		sqlSession.selectOne("board.update",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> userlist(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("board.userlist",param);
	}
	
	public int userlistCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("board.userlistCount",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> fileList(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("board.fileList",param);
	}

	public void schedulesInsert(@Param("param")CommonMap param){
		sqlSession.selectOne("board.schedulesInsert",param);
	}
	
	public void schedulesDelete(@Param("param")CommonMap param){
		sqlSession.selectOne("board.schedulesDelete",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> popupList(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("board.popupList",param);
	}

	public int popupListCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("board.popupListCount",param);
	}
  
	public void popupDel(@Param("param")CommonMap param){
		sqlSession.selectOne("board.popupDel",param);
	}
	
	public void popupInsert(@Param("param")CommonMap param){
		sqlSession.selectOne("board.popupInsert",param);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> popupView(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("board.popupView" ,param);
	}
	
	public void popupUpdate(@Param("param")CommonMap param){
		sqlSession.selectOne("board.popupUpdate",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> mainPopupList(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("board.mainPopupList",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> mainList(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("board.mainList",param);
	}
	
	public int boardPwdCheck(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("board.boardPwdCheck",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> schedulesList(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("board.schedulesList",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> schedulesAjax(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("board.schedulesAjax",param);
	}
	
	public void check_del(@Param("param")CommonMap param){
		sqlSession.selectOne("board.check_del",param);
	}
	
	public void check_del_popup(@Param("param")CommonMap param){
		sqlSession.selectOne("board.check_del_popup",param);
	}
	
	public int pwdConfirm(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("board.pwdConfirm", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> this_day_list(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("board.this_day_list",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> sign_language_list(){
		return (List<Map<String, Object>>)sqlSession.selectList("board.sign_language_list");
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> sign_language_view(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("board.sign_language_view" ,param);
	}
	
	public void sign_language_update(@Param("param")CommonMap param){
		sqlSession.selectOne("board.sign_language_update",param);
	}
	
	public void sortUpdate(@Param("param")CommonMap param){
		sqlSession.selectOne("board.sortUpdate",param);
	}
 
}
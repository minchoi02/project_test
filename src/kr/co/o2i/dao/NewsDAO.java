package kr.co.o2i.dao;

import java.util.List;
import java.util.Map;
import kr.co.o2i.util.CommonMap;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public class NewsDAO extends DefaultDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> list(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("news.list",param);
	}

	public int listCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("news.listCount",param);
	}
	
	public int insert(@Param("param")CommonMap param){
		return (int)sqlSession.insert("news.insert",param);
	}
	
	public int getMaxSeq(){
		return (int)sqlSession.selectOne("news.getMaxSeq");
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> view(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("news.view" ,param);
	}

	public void del(@Param("param")CommonMap param){
		sqlSession.selectOne("news.del",param);
	}
	
	public void update(@Param("param")CommonMap param){
		sqlSession.selectOne("news.update",param);
	}
	
	public int check_id(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("news.check_id", param);
	}

	public void check_del(@Param("param")CommonMap param){
		sqlSession.selectOne("news.check_del",param);
	}
	
	public void drop_delete(@Param("param")CommonMap param){
		sqlSession.selectOne("news.drop_delete",param);
	}
	
	public void drop_cancel(@Param("param")CommonMap param){
		sqlSession.selectOne("news.drop_cancel",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> mainList(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("news.mainList",param);
	}
	
	public void thum_update(@Param("param")CommonMap param){
		sqlSession.selectOne("news.thum_update",param);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> config_view(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("news.config_view" ,param);
	}
	
	public void config_update(@Param("param")CommonMap param){
		sqlSession.selectOne("news.config_update",param);
	}
	
	public void thum_default_update(@Param("param")CommonMap param){
		sqlSession.selectOne("news.thum_default_update",param);
	}
 
}
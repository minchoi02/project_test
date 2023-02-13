package kr.co.o2i.dao;

import java.util.List;
import java.util.Map;
import kr.co.o2i.util.CommonMap;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public class JobOfferDAO extends DefaultDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> list(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("job_offer.list",param);
	}

	public int listCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("job_offer.listCount",param);
	}
	
	public int insert(@Param("param")CommonMap param){
		return (int)sqlSession.insert("job_offer.insert",param);
	}
	
	public int getMaxSeq(){
		return (int)sqlSession.selectOne("job_offer.getMaxSeq");
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> view(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("job_offer.view" ,param);
	}

	public void del(@Param("param")CommonMap param){
		sqlSession.selectOne("job_offer.del",param);
	}
	
	public void update(@Param("param")CommonMap param){
		sqlSession.selectOne("job_offer.update",param);
	}
 
}
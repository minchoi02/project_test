package kr.co.o2i.dao;

import java.util.List;
import java.util.Map;
import kr.co.o2i.util.CommonMap;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public class HuntJobDAO extends DefaultDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> list(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("hunt_job.list",param);
	}

	public int listCount(@Param("param")CommonMap param){
		return (int)sqlSession.selectOne("hunt_job.listCount",param);
	}
	
	public int insert(@Param("param")CommonMap param){
		return (int)sqlSession.insert("hunt_job.insert",param);
	}
	
	public int getMaxSeq(){
		return (int)sqlSession.selectOne("hunt_job.getMaxSeq");
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> view(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("hunt_job.view" ,param);
	}

	public void del(@Param("param")CommonMap param){
		sqlSession.selectOne("hunt_job.del",param);
	}
	
	public void update(@Param("param")CommonMap param){
		sqlSession.selectOne("hunt_job.update",param);
	}
	
	public int hunt_job_edu_insert(@Param("param")CommonMap param){
		return (int)sqlSession.insert("hunt_job.hunt_job_edu_insert",param);
	}
	
	public int hunt_job_career_insert(@Param("param")CommonMap param){
		return (int)sqlSession.insert("hunt_job.hunt_job_career_insert",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> edu_list(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("hunt_job.edu_list",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> career_list(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("hunt_job.career_list",param);
	}
	
	public void hunt_job_edu_del(@Param("param")CommonMap param){
		sqlSession.selectOne("hunt_job.hunt_job_edu_del",param);
	}
	
	public void hunt_job_career_del(@Param("param")CommonMap param){
		sqlSession.selectOne("hunt_job.hunt_job_career_del",param);
	}
 
}
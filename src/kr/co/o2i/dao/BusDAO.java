package kr.co.o2i.dao;

import java.util.List;
import java.util.Map;
import kr.co.o2i.util.CommonMap;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public class BusDAO extends DefaultDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getStationList(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("bus.getStationList",param);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getStationOne(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("bus.getStationOne" ,param);
	}
	
	public int location_insert(@Param("param")CommonMap param){
		return (int)sqlSession.insert("bus.location_insert",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> busTest(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("bus.busTest",param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getBusStation(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("bus.getBusStation",param);
	}

 
}
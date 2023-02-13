package kr.co.o2i.dao;

import java.util.Map;
import kr.co.o2i.util.CommonMap;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO extends DefaultDAO{

	@SuppressWarnings("unchecked")
	public Map<String, Object> memberLogin(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("login.memberLogin" ,param);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> memberLoginCrypt(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("login.memberLoginCrypt" ,param);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> loginPro(@Param("param")CommonMap param){
		return (Map<String, Object>)sqlSession.selectOne("login.loginPro" ,param);
	}

}
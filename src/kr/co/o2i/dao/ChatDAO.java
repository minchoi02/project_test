package kr.co.o2i.dao;

import java.util.List;
import java.util.Map;
import kr.co.o2i.util.CommonMap;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAO extends DefaultDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectChatConf(@Param("param")CommonMap param){
		return (List<Map<String, Object>>)sqlSession.selectList("chat.selectChatConf",param);
	}
	
	public void update(@Param("param")CommonMap param){
		sqlSession.selectOne("chat.updateStartTime",param);
		sqlSession.selectOne("chat.updateEndTime",param);
		sqlSession.selectOne("chat.updateChatUse",param);
	}
}
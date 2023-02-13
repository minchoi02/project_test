package kr.co.o2i.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class DefaultDAO {

	@Autowired
	@Resource(name="sqlSession")
	public SqlSession sqlSession;
	
	@Autowired
	@Resource(name="sqlSession2")
	public SqlSession sqlSession2;
}

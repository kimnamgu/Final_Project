package com.company.persistence;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.domain.BoardVO; 

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession  session;
	private static String namespace = "com.company.mapper.BoardMapper";
	
	@Override
	public void create(BoardVO vo) throws Exception {
		session.insert(namespace + ".create" , vo);
	}

	@Override
	public List<BoardVO> readAll() throws Exception {
		return session.selectList(namespace + ".readAll");
	}

	@Override
	public BoardVO read(int bno) throws Exception { 
		return session.selectOne(namespace + ".read" , bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		session.update(namespace + ".update" , vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		session.delete(namespace + ".delete" , bno);
		
	}

	@Override
	public BoardVO readWho(BoardVO vo) throws Exception {
		return session.selectOne(namespace + ".read_who", vo);
	}

	@Override
	public void update_bhit(int bno) throws Exception {
		session.update(namespace  + ".update_bhit" , bno);
	} 
}

 
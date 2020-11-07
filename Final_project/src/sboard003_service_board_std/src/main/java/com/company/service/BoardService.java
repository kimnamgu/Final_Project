package com.company.service;

import java.util.List;

import com.company.domain.BoardVO;

public interface BoardService {
	/** create */ 
	public void create(BoardVO vo) throws Exception;
	
	/** read */  
	public List<BoardVO> readAll() throws Exception;
	public BoardVO read(int bno) throws Exception;
	public BoardVO read_who(BoardVO vo) throws Exception;
	
	/** update */ 
	public int update(BoardVO vo) throws Exception;
	public void update_bhit(int bno) throws Exception;
	
	/** delete */
	public int delete(BoardVO vo) throws Exception;
}



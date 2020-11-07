package com.company.persistence;

import java.util.List;

import com.company.domain.BoardVO;

public interface BoardDAO {
	public void create(BoardVO  vo) throws Exception;
	public List<BoardVO> readAll( ) throws Exception;
	public BoardVO read(int bno) throws Exception;
	public void update(BoardVO  vo) throws Exception;
	public void delete(int bno) throws Exception;	 
	public BoardVO readWho(BoardVO vo) throws Exception ;
	public void update_bhit(int bno) throws Exception;
}

 

 
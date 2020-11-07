package com.company.service;

import java.net.InetAddress;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.domain.BoardVO;
import com.company.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	private BoardDAO dao;
	
	@Override
	public void create(BoardVO vo) throws Exception {
		vo.setBip( InetAddress.getLocalHost().getHostAddress()  );
		dao.create(vo); 
	}
	@Override
	public List<BoardVO> readAll() throws Exception {
		return dao.readAll();
	
	}
	@Override
	public BoardVO read(int bno) throws Exception {
		return dao.read(bno);
		
	}
	@Override
	public BoardVO read_who(BoardVO vo) throws Exception {
		 return dao.readWho(vo);
		
	}
	@Override
	public int update(BoardVO vo) throws Exception {	 
		BoardVO boardpass =  dao.readWho(vo);
		String userpass = vo.getBpass(); 
		int result = -1;
		if( userpass.equals(boardpass.getBpass()) ) { result = 1; dao.update(vo); }
		return result;	
	}
	@Override
	public void update_bhit(int bno) throws Exception {
		dao.update_bhit(bno);
		
	}
	@Override
	public int delete(BoardVO vo) throws Exception {
		BoardVO boardpass =  dao.readWho(vo);
		String userpass = vo.getBpass(); 
		int result = -1;
		if( userpass.equals(boardpass.getBpass()) ) { result = 1;  dao.delete(vo.getBno()); }
		return result;	
	}

}

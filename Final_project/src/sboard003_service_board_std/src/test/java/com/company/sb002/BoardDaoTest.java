package com.company.sb002;

import java.net.InetAddress;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.company.domain.BoardVO;
import com.company.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardDaoTest {
	@Inject
	private BoardDAO dao;
	/*
  	@Test
	public void  testCreateBoard() throws Exception {
		BoardVO vo = new BoardVO();
		vo.setBname("first");	vo.setBemail("first@gmail.com");
		vo.setBpass("1111");	vo.setBtitle("첫번째 글쓰기입니다-제목");
		vo.setBcontent("첫번째 글쓰기입니다-내용");
		vo.setBip( InetAddress.getLocalHost().getHostAddress()  );
		dao.create(vo); 
	}  
	*/
	/*
  	@Test
	public void  testReadAllBoard() throws Exception {
		List<BoardVO>  list = dao.readAll();
		System.out.println( list.get(0).getBtitle());
	} 
	
 	@Test
	public void  testReadBoard() throws Exception {
		 BoardVO vo = dao.read(1);		 System.out.println( vo.getBtitle());
	}
 
   @Test
	public void  testUpdateBoard() throws Exception {
		 	BoardVO vo = new BoardVO();
			vo.setBtitle("첫번째 글쓰기입니다-제목-best");		vo.setBcontent("첫번째 글쓰기입니다-내용-best");	vo.setBno(1);
			dao.update(vo); 
	}
   
	@Test
	public void  testReadwhoBoard() throws Exception {
		BoardVO vo =  new BoardVO();	vo.setBno(1);
		BoardVO result =  dao.readWho(vo);
		System.out.println(result.getBpass());
	}  
	*//* 
	@Test
	public void  testUpdate_bhitBoard() throws Exception {
			 dao.update_bhit(1);		BoardVO vo = dao.read(1);
			 System.out.println( vo.getBhit()); 
	}
	
	@Test
	public void  testDeleteBoard() throws Exception {
		  	dao.delete(1);  
	}
	*/
}














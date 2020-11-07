package com.company.sb003;

import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.BoardVO;
import com.company.service.BoardService; 

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService service;
	
	@RequestMapping(value= "/board_write", method = RequestMethod.GET)
	public String board_write_get() {
		logger.info("::::::::::::::::board-GET-글쓰기폼");
		return "/board/board_write";
		
	}
	@RequestMapping(value="/board_write", method= RequestMethod.POST) 
	public String board_write(BoardVO vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		logger.info("::::::::::::::board-POST-글쓰기");
		request.setCharacterEncoding("utf-8");
		rttr.addFlashAttribute("success", "글쓰기 성공");
		service.create(vo);
		return "redirect:/board/list";
		 
	}
 
	@RequestMapping(value="/list", method = {RequestMethod.POST, RequestMethod.GET})
	public void board_list(Model model, Locale locale) throws Exception {
		logger.info("::::::::::::::::board-리스트 폼");
		List<BoardVO> list = service.readAll();
		model.addAttribute("list", list);
		
	}
	@RequestMapping(value="/board_detail", method = RequestMethod.GET)
	public void board_content_view(@RequestParam("bno") int bno, Model model ) throws Exception {
		logger.info("::::::::::::::::board-상세보기 폼");
		service.update_bhit(bno);
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value="/board_delete", method = RequestMethod.GET)
	public void board_delelte_view(@RequestParam("bno") int bno,   Model model) throws Exception {
		logger.info("::::::::::::::::board-삭제 폼");
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value="/board_delete", method = RequestMethod.POST) 
	public void board_delete(HttpServletResponse response, 
			                 HttpServletRequest request, 
							@RequestParam("bno") int bno, 
							Locale locale, 
							BoardVO vo      ) throws Exception {
		
		response.setContentType("text/html; charset=utf-8");
		logger.info("::::::::::::::::board-삭제");
		PrintWriter out = response.getWriter();
		if( service.delete(vo) !=  -1) {	 
			out.println("<script>alert('삭제에 성공했습니다'); "
								+ "location.href='"+request.getContextPath()+"/board/list'</script>");
			out.flush();
			out.close();
			
		} else {
			out.println("<script>alert('비밀번호가 틀렸습니다'); history.go(-1);</script>");
			out.flush();
			out.close();
		}
		
	}
	
	@RequestMapping(value="/board_modify", method = RequestMethod.GET)
	public void board_modify_view(int bno, Model model ) throws Exception {
		logger.info("::::::::::::::::board-수정 폼");
		model.addAttribute(service.read(bno));
	}
	@RequestMapping(value="/board_modify", method = RequestMethod.POST)
	public void board_modify(BoardVO vo, 	@RequestParam("bno") int bno, 
			HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		
		response.setContentType("text/html; charset=utf-8");
		logger.info("::::::::::::::::board-수정");
		PrintWriter out = response.getWriter();

		response.setContentType("text/html; charset=utf-8");
		logger.info("::::::::::::::::board-수정"); 
		if( service.update(vo) !=  -1) {	 
			out.println("<script>alert('수정에 성공했습니다'); "
							+ "location.href='"+request.getContextPath()+"/board/list'</script>");
			out.flush();
			out.close();
		} else {
			out.println("<script>alert('비밀번호가 틀렸습니다'); history.go(-1);</script>");
			out.flush();
			out.close();
		}
		
	}
}

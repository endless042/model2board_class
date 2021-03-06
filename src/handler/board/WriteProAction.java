package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;
import controller.CommandHandler;

public class WriteProAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {

		 String boardid=req.getParameter("boardid");
	     if(boardid==null) boardid="1";
	     String pageNum=req.getParameter("pageNum");
	     if(pageNum==null||pageNum==""){pageNum="1";}
		
	    
	     BoardDataBean article=new BoardDataBean();
	     
	     if(req.getParameter("num")!=null&& !req.getParameter("num").equals("")) {
	    	 
	    	  article.setNum(Integer.parseInt(req.getParameter("num")));
	 	     article.setRef(Integer.parseInt(req.getParameter("ref")));
	 	     article.setRe_step(Integer.parseInt(req.getParameter("re_step")));
	 	     article.setRe_level(Integer.parseInt(req.getParameter("re_level")));
	     }
	     
	   
	     article.setWriter(req.getParameter("writer"));
	     article.setEmail(req.getParameter("email"));
	     article.setSubject(req.getParameter("subject"));
	     article.setPasswd(req.getParameter("passwd"));
	     article.setContent(req.getParameter("content"));
	     article.setBoardid(req.getParameter("boardid"));

	     article.setIp(req.getRemoteAddr());
	     
	    

	      BoardDBBean dbPro=BoardDBBean.getInstance();
	      
	      dbPro.insertArticle(article);
	      System.out.println(article); 
		
	
	      req.setAttribute("pageNum", pageNum);
	     res.sendRedirect(req.getContextPath()+"/board/list?pageNum="+pageNum+"&boardid="+boardid);
	      


		return null;
	}

}

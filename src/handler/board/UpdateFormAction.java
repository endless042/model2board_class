package handler.board;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;
import controller.CommandHandler;

public class UpdateFormAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {

		 
		    String boardid=req.getParameter("boardid");
		    if(boardid==null){
		    	boardid="1";
		    }
		 
			int num=Integer.parseInt(req.getParameter("num"));
			String pageNum=req.getParameter("pageNum");
			if(pageNum==null||pageNum==""){
				pageNum="1";}
			
			
			try{
				BoardDBBean dbPro=BoardDBBean.getInstance();
				BoardDataBean article=dbPro.getArticle(num,boardid,"update");
				
				
				   req.setAttribute("pageNum", pageNum);
				 req.setAttribute("article", article);
				 
			}catch(Exception e) {}
		
		return "/view/updateForm.jsp";
	}
	

}

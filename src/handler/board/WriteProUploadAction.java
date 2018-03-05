package handler.board;

import java.io.File;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.BoardDBBean;
import board.BoardDataBean;
import controller.CommandHandler;

public class WriteProUploadAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
			

		
		
		
	     
	     String realFolder = ""; // 웹 어플리케이션상의 절대 경로
			String encType = "utf-8"; // 엔코딩 타입
			int maxSize = 5 * 1024 * 1024; // 최대 업로드될 파일크기 5MB
			ServletContext context = req.getServletContext();
			realFolder = context.getRealPath("fileSave");
			MultipartRequest multi = null;
			multi = new MultipartRequest(req, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
		
			String filename = "";
			File file = null;
			
			/*파일이 여러개면 while*/ 
			if(files.hasMoreElements()) {
				String name=(String)files.nextElement();
				filename=multi.getFilesystemName(name);		/* DefaultFileRenamePolicy가 적용된 이름	*/
				String original=multi.getOriginalFileName(name);   /* 파일의 원래 이름을 알 수 있음 */
				String type=multi.getContentType(name);			 	/* 파일의 타입을 알 수 있음 */	
				file=multi.getFile(name);
			}
	     
			 String boardid=multi.getParameter("boardid");
		     if(boardid==null) boardid="1";
		     String pageNum=multi.getParameter("pageNum");
		     if(pageNum==null||pageNum==""){pageNum="1";}
			
			
	     BoardDataBean article=new BoardDataBean();
	     
	     if(multi.getParameter("num")!=null&& !multi.getParameter("num").equals("")) {
	    	 
	    	  article.setNum(Integer.parseInt(multi.getParameter("num")));
	 	     article.setRef(Integer.parseInt(multi.getParameter("ref")));
	 	     article.setRe_step(Integer.parseInt(multi.getParameter("re_step")));
	 	     article.setRe_level(Integer.parseInt(multi.getParameter("re_level")));
	     }
	     
	   
	     article.setWriter(multi.getParameter("writer"));
	     article.setEmail(multi.getParameter("email"));
	     article.setSubject(multi.getParameter("subject"));
	     article.setPasswd(multi.getParameter("passwd"));
	     article.setContent(multi.getParameter("content"));
	     article.setBoardid(multi.getParameter("boardid"));
	    

	     article.setIp(req.getRemoteAddr());
	     
	     if(file!=null) {
	    	 article.setFilename(filename);
	    	 article.setFilesize((int)file.length());
	     }else {
	    	 article.setFilename(" ");
	    	 article.setFilesize(0);
	     }

	      BoardDBBean dbPro=BoardDBBean.getInstance();
	      
	      dbPro.insertArticle(article);
	      System.out.println(article); 
		

	      req.setAttribute("pageNum", pageNum);
	     res.sendRedirect(req.getContextPath()+"/board/list?pageNum="+pageNum+"&boardid="+boardid);
	      


		return null;
		
	}

	
}

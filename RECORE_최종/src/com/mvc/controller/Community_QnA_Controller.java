package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.mvc.dao.CommunityDaoImpl;
import com.mvc.vo.Vo_Account;
import com.mvc.vo.Vo_Product;
import com.mvc.vo.Vo_QnA;
import com.mvc.vo.Vo_QnA_Paging;
import com.mvc.vo.Vo_Review;

@WebServlet("/Community_QnA_Controller")
public class Community_QnA_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommunityDaoImpl dao = new CommunityDaoImpl();

	public Community_QnA_Controller() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = "";

		command = request.getParameter("command");
		
		if (command.equals("qna_list")) {
			/**
			 * command 설명: QnA 글 전체 리스트 로드 
			 * 작성자: 주희진
			 * Date: 2019. 12. 30.
			 */

			
			/* QnA list catd(카테고리),searchsubject(검색조건),keyword(키워드) 값 Load*/
			String catd = null;
			String searchsubject = null;
			String keyword = null;
			catd = (String)request.getParameter("catd");
			searchsubject = (String)request.getParameter("searchsubject");
			keyword = (String)request.getParameter("keyword");
			
			/*Page Code*/
			int page = 1;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			Vo_QnA_Paging paging = new Vo_QnA_Paging();
			paging.setPage(page);

			/* QnA list Total Row Load */
			int totalCount = dao.Cq_selectAllCount(catd, searchsubject, keyword);
			paging.setTotalCount(totalCount);

			/* QnA list Load & RequestSet */
			List<Vo_QnA> list = dao.Cq_selectAll(paging, catd, searchsubject, keyword);
			request.setAttribute("list", list);
			request.setAttribute("paging", paging);
			request.setAttribute("catd", catd);
			request.setAttribute("searchsubject", searchsubject);
			request.setAttribute("keyword", keyword);
			
			
			/*Redirect dispatch Method Call*/
			dispatch("/RECOREMain/RECORECommunity/qna_manager/qna/qna_board.jsp", request, response);
			
		} else if (command.equals("qna_viewcount")) {
			/**
			 * command 설명: QnA 글 조회수 증가 
			 * 작성자: 주희진
			 * Date: 2019. 12. 30.
			 */
			
			/*QnA 글번호 Get*/
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));  //수정필요함.
			
			/*QnA 글 ViewCount update*/
			dao.Cq_updateViewCount(qna_no);
			
			/*QnA 글 Load*/
			Vo_QnA qnaVo = dao.Cq_selectOne(qna_no);
			
			/*Ajax Code*/
			JSONObject obj = new JSONObject();
			obj.put("qna_view_count", qnaVo.getQna_view_count());
			obj.put("qna_no", qna_no);
			PrintWriter out = response.getWriter();
			out.println(obj.toJSONString());
			
			
			
		} else if (command.equals("qna_answerwriteform")) {
			/**
			 * command 설명: QnA 답글 작성 폼으로 이동
			 * 작성자: 주희진
			 * Date: 2019. 12. 30.
			 */

			/* 부모글 qna_no Get */
			int parent_pno = Integer.parseInt(request.getParameter("qna_pno"));

			/* 부모글 정보 Load */
			Vo_QnA parent_qnaVo = dao.Cq_selectOne(parent_pno);

			/* 부모글 정보 Set */
			request.setAttribute("parent", parent_qnaVo);

			/* Redirect dispatch Method Call*/
			dispatch("/RECOREMain/RECORECommunity/qna_manager/qna/qna_boardanswerwrite.jsp", request, response);

		} else if (command.equals("qna_answerwrite")) {
			/**
			 * command 설명: QnA 답글 작성 폼 데이터 저장
			 * 작성자: 주희진
			 * Date: 2019. 12. 30.
			 */
			
			/*답글 데이터 Get*/
			int parent_pno = Integer.parseInt(request.getParameter("qna_pno"));
			String qna_title = request.getParameter("title");
			String qna_content = request.getParameter("content");

			/*부모글 정보 Load*/
			Vo_QnA parent_qnaVo = dao.Cq_selectOne(parent_pno);
			
			/*LoginSession Load*/
			HttpSession getSession = request.getSession(false);
			Vo_Account sessionVo = (Vo_Account) getSession.getAttribute("vo");

			/*답글 생성자 Load*/
			Vo_QnA qnaVo = new Vo_QnA(parent_qnaVo.getCatd_no(), parent_qnaVo.getQna_seq_no(), sessionVo.getAcc_no(),
					parent_qnaVo.getQna_front_img(), qna_title, qna_content, parent_qnaVo.getQna_con_count(),
					parent_pno, sessionVo.getAcc_id(), parent_qnaVo.getQna_prod_no());

			/*답글 insert*/
			boolean res = dao.Cq_insert_re(qnaVo);

			if (res) {
				jsResponse("글 작성이 완료되었습니다.", "qna.do?command=qna_list&catd=all", response);
			} else {
				jsResponse("글 작성에 실패하였습니다. 다시 시도해주세요.", "qna.do?command=qna_list&catd=all", response);
			}

		}else if(command.equals("qna_answerupdateform")) {
			/**
			 * command 설명: QnA 답글 수정 폼으로 이동
			 * 작성자: 주희진
			 * Date: 2019. 12. 30.
			 */
			
			/*답글 qna_no Get*/
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));

			/*답글 정보 Load*/
			Vo_QnA qnaVo = dao.Cq_selectOne(qna_no);

			/*답글 정보 RequestSet*/
			request.setAttribute("qnaVo", qnaVo);

			/*Redirect dispatch Method Call*/
			dispatch("/RECOREMain/RECORECommunity/qna_manager/qna/qna_boardanswerupdate.jsp", request, response);
			
			
		}else if(command.equals("qna_answerupdate")) {
			/**
			 * command 설명: QnA 답글 수정 폼 데이터 저장
			 * 작성자: 주희진
			 * Date: 2019. 12. 30.
			 */
			
			/* 답글 데이터 Get */
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));
			String qna_title = request.getParameter("title");
			String qna_content = request.getParameter("content");
			/*답글 생성자 Load*/
			Vo_QnA qnaVo = new Vo_QnA(qna_no, qna_title, qna_content);

			/*답글 update*/
			boolean res = dao.Cq_update(qnaVo);

			if (res) {
				jsResponse("글 수정이 완료되었습니다.", "qna.do?command=qna_list&catd=all", response);
			} else {
				jsResponse("글 수정에 실패하였습니다. 다시 시도해주세요.", "qna.do?command=qna_list&catd=all", response);
			}
			
		}else if (command.equals("qna_writeform")) {
			/**
			 * command 설명: QnA 글 작성 폼으로 이동
			 * 작성자: 주희진
			 * Date: 2019. 12. 30.
			 */
			
			/*Redirect dispatch Method Call*/
			dispatch("/RECOREMain/RECORECommunity/qna_manager/qna/qna_boardwrite.jsp", request, response);

		} else if (command.equals("qna_write")) {
			/**
			 * command 설명: QnA 글 작성 폼 데이터 저장
			 * 작성자: 주희진
			 * Date: 2019. 12. 30.
			 */
			
			/* 글 데이터 Get */
			String qna_title = request.getParameter("title");
			String qna_content = request.getParameter("content");
			String qna_front_img = request.getParameter("qna_front_img");
			int qna_seq_no = Integer.parseInt(request.getParameter("qna_seq_no"));
			int catd_no = Integer.parseInt(request.getParameter("catd_no"));
			
			/* 작성자 Session Load */
			HttpSession getSession = request.getSession(false);
			Vo_Account sessionVo = (Vo_Account) getSession.getAttribute("vo");

			/*글 생성자 Load*/
			Vo_QnA qnaVo = new Vo_QnA(catd_no, qna_seq_no, sessionVo.getAcc_no(), qna_front_img, qna_title, qna_content, sessionVo.getAcc_id());
			
			/*글 insert*/
			boolean res = dao.Cq_insert(qnaVo);

			if (res) {
				jsResponse("글 작성이 완료되었습니다.", "qna.do?command=qna_list&catd=all", response);
			} else {
				jsResponse("글 작성에 실패하였습니다. 다시 시도해주세요.", "qna.do?command=qna_list&catd=all", response);
			}

		}else if(command.equals("qna_updateform")) {
			/**
			 * command 설명: QnA 글 수정 폼으로 이동
			 * 작성자: 주희진
			 * Date: 2019. 12. 30.
			 */
			
			/*글 qna_no Get*/
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));

			/*글 정보 Load*/
			Vo_QnA qnaVo = dao.Cq_selectOne(qna_no);

			/*글 정보 RequestSet*/
			request.setAttribute("qnaVo", qnaVo);

			/*Redirect dispatch Method Call*/
			dispatch("/RECOREMain/RECORECommunity/qna_manager/qna/qna_boardupdate.jsp", request, response);
			
		}else if(command.equals("qna_update")) {
			/**
			 * command 설명: QnA 글 수정 폼 데이터 저장
			 * 작성자: 주희진
			 * Date: 2019. 12. 30.
			 */
			
			/*글 qna_no Get*/
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));
			String qna_title = request.getParameter("title");
			String qna_content = request.getParameter("content");
			
			/*글 생성자 Load*/
			Vo_QnA qnaVo = new Vo_QnA(qna_no, qna_title, qna_content);
			
			
			/*글 update*/
			boolean res = dao.Cq_update(qnaVo);

			if (res) {
				jsResponse("글 작성이 완료되었습니다.", "qna.do?command=qna_list&catd=all", response);
			} else {
				jsResponse("글 작성에 실패하였습니다. 다시 시도해주세요.", "qna.do?command=qna_list&catd=all", response);
			}
			
		}else if(command.equals("qna_delete")) {
			/**
			 * command 설명: QnA 글 삭제
			 * 작성자: 주희진
			 * Date: 2019. 12. 30.
			 */
			
			/*글 qna_no Get*/
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));
			String reply = request.getParameter("reply");
			
			/*글 delete*/
			boolean res = dao.C_delete(qna_no, reply);
			
			if (res) {
				jsResponse("글이 삭제되었습니다.", "qna.do?command=qna_list&catd=all", response);
			} else {
				jsResponse("글 삭제에 실패하였습니다. 다시 시도해주세요.", "qna.do?command=qna_list&catd=all", response);
			}
			
			
		}else if (command.equals("qna_searchboardlist")) {
			/**
			 * command 설명: QnA SearchBoard List 이동
			 * 작성자: 주희진
			 * Date: 2019. 12. 30.
			 */
			
			/*Keyword Data Get*/
			String keyword = request.getParameter("keyword");
			if (keyword == null || keyword == "") {
				keyword = "";
			}

			/*PageCode*/
			int page = 1;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			Vo_QnA_Paging paging = new Vo_QnA_Paging();
			paging.setPage(page);

			/* QnA list Total Row Load */
			int totalCount = dao.Cp_selectAllCount(keyword);
			paging.setTotalCount(totalCount);

			/* QnA list Load & RequestSet */
			List<Vo_Product> list = dao.Cp_selectAll(paging, keyword);
			request.setAttribute("list", list);
			request.setAttribute("paging", paging);
			request.setAttribute("keyword", keyword);
			
			/*Redirect dispatch Method Call*/
			dispatch("/RECOREMain/RECORECommunity/qna_manager/qna/qna_searchboardlist.jsp", request, response);

		} else if (command.equals("review_list")) {
			/**
			 * command 설명: Review 리스트로 이동
			 * 작성자: 주희진
			 * Date: 2019. 12. 30.
			 */
			
			/* QnA list catd(카테고리),searchsubject(검색조건),keyword(키워드) 값 Load*/
			String catd = (String)request.getParameter("catd");
			String searchsubject = (String)request.getParameter("searchsubject");
			String keyword = (String)request.getParameter("keyword");
			
			/*Page Code*/
			int page = 1;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			Vo_QnA_Paging paging = new Vo_QnA_Paging();
			paging.setPage(page);

			/* QnA list Total Row Load */
			int totalCount = dao.Cr_selectAllCount(catd, searchsubject, keyword);
			paging.setTotalCount(totalCount);

			/* QnA list Load & RequestSet */
			List<Vo_Review> list = dao.Cr_selectAll(paging, catd, searchsubject, keyword);
			request.setAttribute("list", list);
			request.setAttribute("paging", paging);
			request.setAttribute("catd", catd);
			request.setAttribute("searchsubject", searchsubject);
			request.setAttribute("keyword", keyword);
			
			
			/*Redirect dispatch Method Call*/
			dispatch("/RECOREMain/RECORECommunity/qna_manager/review/review_board.jsp", request, response);

		} else if (command.equals("manager_list")) {
			dispatch("/qna_manager/manager/manager.jsp", request, response);
		}else if (command.equals("prod_detail_qna")) {
			
		}

	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		try {
			dispatch.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public static boolean isMultipartRequest(HttpServletRequest request) {
		boolean retBool = false;

		String contentType = request.getHeader("Content-Type");

		if (contentType != null && contentType.indexOf("multipart/form-data") > -1) {
			retBool = true;
		}

		return retBool;
	}

	private void jsResponse(String msg, String url, HttpServletResponse response) {
		String s = "<script type='text/javascript'>" + "alert('" + msg + "');" + "location.href='" + url + "';"
				+ "</script>";
//		String s = "<script type='text/javascript'>"+
//				   "modal({" +
//				   "type: 'info'," +
//				   "title: 'info'," +
//				   "text: "+msg +
//				   "});" +
//				   "location.href='"+url+"';"+
//				   "</script>";

		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(s);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}

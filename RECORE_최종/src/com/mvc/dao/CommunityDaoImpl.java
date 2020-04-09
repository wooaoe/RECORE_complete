package com.mvc.dao;

import static common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.mvc.vo.Vo_Account; //임시 테스트용
import com.mvc.vo.Vo_Product;
import com.mvc.vo.Vo_QnA;
import com.mvc.vo.Vo_QnA_Paging;
import com.mvc.vo.Vo_Review;

public class CommunityDaoImpl implements CommunityDao{

	
	/**
	 * Method 설명: QnA 글 전체 리스트 로드
	 * 작성자: 주희진
	 * Date: 2019. 12. 30.
	 */
	@Override
	public List<Vo_QnA> Cq_selectAll(Vo_QnA_Paging paging, String catd, String searchsubject, String keyword) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		Properties prop = new Properties();
		String filePath = properties("query_community.properties");
		String sql = "";
		ResultSet rs = null;
		List<Vo_QnA> list = null;
		
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
				
		try {
			prop.load(new FileInputStream(filePath));
			if(searchsubject==null || keyword==null) {
				if(catd.equals("all")) {
					sql = prop.getProperty("qna_selectAll");
				}else if(catd.equals("product")) {
					sql = prop.getProperty("qna_selectProduct");
				}else if(catd.equals("delivery")) {
					sql = prop.getProperty("qna_selectDelivery");
				}else if(catd.equals("etc")) {
					sql = prop.getProperty("qna_selectEtc");
				}
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startNum);
				pstmt.setInt(2, endNum);
			}else {
				if(catd.equals("all")) { 
					sql = prop.getProperty("qna_searchselectAll") + " "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO IN (14,15,16) ORDER BY QNA_PNO DESC, QNA_NO) QNA) WHERE row_num >= ?) WHERE row_num <= ? ";
				}else if(catd.equals("product")) {
					sql = prop.getProperty("qna_searchselectAll") + " "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO=16 ORDER BY QNA_PNO DESC, QNA_NO) QNA) WHERE row_num >= ?) WHERE row_num <= ? ";
				}else if(catd.equals("delivery")) {
					sql = prop.getProperty("qna_searchselectAll") + " "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO=14 ORDER BY QNA_PNO DESC, QNA_NO) QNA) WHERE row_num >= ?) WHERE row_num <= ? ";
				}else if(catd.equals("etc")) {
					sql = prop.getProperty("qna_searchselectAll") + " "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO=15 ORDER BY QNA_PNO DESC, QNA_NO) QNA) WHERE row_num >= ?) WHERE row_num <= ? ";
				}
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				pstmt.setInt(2, startNum);
				pstmt.setInt(3, endNum);
			}
			
			rs = pstmt.executeQuery();
			if(rs != null) {
				list = new ArrayList<Vo_QnA>();
				while(rs.next()){
					Vo_QnA tmp = new Vo_QnA();
					tmp.setQna_acc_id(rs.getString(2));
					tmp.setQna_no(rs.getInt(3));
					tmp.setCatd_no(rs.getInt(4));
					tmp.setQna_seq_no(rs.getInt(5));
					tmp.setQna_acc_no(rs.getInt(6));
					tmp.setQna_front_img(rs.getString(7));
					tmp.setQna_title(rs.getString(8));
					tmp.setQna_content(rs.getString(9));
					tmp.setQna_con_count(rs.getInt(10));
					tmp.setQna_regdate(rs.getDate(11));
					tmp.setQna_re_yn(rs.getString(12));
					tmp.setQna_view_count(rs.getInt(13));
					tmp.setQna_pno(rs.getInt(14));
					
					list.add(tmp);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, con);
		}
		return list;
	}

	/**
	 * Method 설명: QnA 글 한개 로드
	 * 작성자: 주희진
	 * Date: 2019. 12. 30.
	 */
	@Override
	public Vo_QnA Cq_selectOne(int qna_no) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		Properties prop = new Properties();
		String filePath = properties("query_community.properties");
		ResultSet rs = null;
		Vo_QnA res = new Vo_QnA();
		
		try {
			prop.load(new FileInputStream(filePath));
			String sql = prop.getProperty("qna_selectOne");
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qna_no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				res.setQna_acc_id(rs.getString(1));
				res.setQna_no(rs.getInt(2));
				res.setCatd_no(rs.getInt(3));
				res.setQna_seq_no(rs.getInt(4));
				res.setQna_acc_no(rs.getInt(5));
				res.setQna_front_img(rs.getString(6));
				res.setQna_title(rs.getString(7));
				res.setQna_content(rs.getString(8));
				res.setQna_con_count(rs.getInt(9));
				res.setQna_regdate(rs.getDate(10));
				res.setQna_re_yn(rs.getString(11));
				res.setQna_view_count(rs.getInt(12));
				res.setQna_pno(rs.getInt(13));
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, con);
		}
		
		return res;
	}

	/**
	 * Method 설명: QnA 조회 글 전체 Row 개수 Count
	 * 작성자: 주희진
	 * Date: 2019. 12. 27.
	 */
	@Override
	public int Cq_selectAllCount(String catd, String searchsubject, String keyword) {

		Connection con = getConnection();
		PreparedStatement pstmt = null;
		Properties prop = new Properties();
		String filePath = properties("query_community.properties");
		String sql="";
		ResultSet rs = null;
		int res = 0;
		try {
			prop.load(new FileInputStream(filePath));
			if(searchsubject==null || keyword==null) {
				if(catd.equals("all")) {
					sql = prop.getProperty("qna_selectAllCount");
				}else if(catd.equals("product")) {
					sql = prop.getProperty("qna_selectProductAllCount");
				}else if(catd.equals("delivery")) {
					sql = prop.getProperty("qna_selectDeliveryAllCount");
				}else if(catd.equals("etc")) {
					sql = prop.getProperty("qna_selectEtcAllCount");
				}
				pstmt = con.prepareStatement(sql);
			}else {
				
				if(catd.equals("all")) {
					sql = prop.getProperty("qna_searchAllCount") +" "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO IN (14,15,16))";
				}else if(catd.equals("product")) {
					sql = prop.getProperty("qna_searchAllCount") +" "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO=16)";
				}else if(catd.equals("delivery")) {
					sql = prop.getProperty("qna_searchAllCount") +" "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO=14)";
				}else if(catd.equals("etc")) {
					sql = prop.getProperty("qna_searchAllCount") +" "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO=15)";
				}
				
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				res = rs.getInt(1);
			}
				
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	/**
	 * Method 설명: QnA 글 추가
	 * 작성자: 주희진
	 * Date: 2019. 12. 30.
	 */
	@Override
	public boolean Cq_insert(Vo_QnA qnaVo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		Properties prop = new Properties();
		String filePath = properties("query_community.properties");
		int res = 0;
		try {
			prop.load(new FileInputStream(filePath));
			String sql = prop.getProperty("qna_insert");
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qnaVo.getCatd_no());
			pstmt.setInt(2, qnaVo.getQna_seq_no());
			pstmt.setInt(3,qnaVo.getQna_acc_no());
			pstmt.setString(4, qnaVo.getQna_front_img());
			pstmt.setString(5, qnaVo.getQna_title());
			pstmt.setString(6, qnaVo.getQna_content());
			
			res = pstmt.executeUpdate();
			
			if(res > 0) {
				commit(con);
			}
			
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, con);
		}
		
		
		return (res > 0)? true:false;
	}
	

	/**
	 * Method 설명: QnA 댓글 추가
	 * 작성자: 주희진
	 * Date: 2019. 12. 30.
	 */
	@Override
	public boolean Cq_insert_re(Vo_QnA qnaVo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		Properties prop = new Properties();
		String filePath = properties("query_community.properties");
		int res = 0;
		try {
			prop.load(new FileInputStream(filePath));
			String sql = prop.getProperty("qna_insertRe");
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qnaVo.getCatd_no());
			pstmt.setInt(2, qnaVo.getQna_seq_no());
			pstmt.setInt(3,qnaVo.getQna_acc_no());
			pstmt.setString(4, qnaVo.getQna_title());
			pstmt.setString(5, qnaVo.getQna_content());
			pstmt.setInt(6, qnaVo.getQna_con_count());
			pstmt.setInt(7, qnaVo.getQna_pno());
			
			res = pstmt.executeUpdate();
			
			if(res > 0) {
				commit(con);
			}
			
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, con);
		}
		
		
		return (res > 0)? true:false;
	}
	/**
	 * Method 설명: QnA 글 & 댓글 수정
	 * 작성자: 주희진
	 * Date: 2019. 12. 27.
	 */
	@Override
	public boolean Cq_update(Vo_QnA qnaVo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		Properties prop = new Properties();
		String filePath = properties("query_community.properties");
		int res = 0;
		
		try {
			prop.load(new FileInputStream(filePath));
			String sql = prop.getProperty("qna_updateRe");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qnaVo.getQna_title());
			pstmt.setString(2, qnaVo.getQna_content());
			pstmt.setInt(3, qnaVo.getQna_no());
			
			res = pstmt.executeUpdate();
			
			if(res>0) {
				commit(con);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, con);
		}
		
		return (res > 0)? true:false;
	}
	/**
	 * Method 설명: QnA 글 & 댓글 삭제
	 * 작성자: 주희진
	 * Date: 2019. 12. 31.
	 */
	@Override
	public boolean C_delete(int qna_no, String reply) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		Properties prop = new Properties();
		String filePath = properties("query_community.properties");
		
		int res = 0;
		try {
			prop.load(new FileInputStream(filePath));
			if(reply.equals("y")) {
				String sql = prop.getProperty("qna_delete_re");
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, qna_no);
				pstmt.setInt(2, qna_no);
			}else {
				String sql = prop.getProperty("qna_delete");
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, qna_no);
			}
			
			res = pstmt.executeUpdate();
			
			if(res > 0) {
				commit(con);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, con);
		}
		
		return (res > 0) ? true:false;
	}
	

	/**
	 * Method 설명: Review 글 전체 리스트 로드
	 * 작성자: 
	 * 2019. 12. 27.
	 */
	@Override
	public List<Vo_Review> Cr_selectAll(Vo_QnA_Paging paging, String catd, String searchsubject, String keyword) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		Properties prop = new Properties();
		ResultSet rs = null;
		String filePath = properties("query_community.properties");
		String sql = "";
		List<Vo_Review> list = null;
		
		int catdNum = 0;
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		
		try {
			prop.load(new FileInputStream(filePath));
			/*
			 * sql = prop.getProperty("review_selectAll");
			 * 
			 * pstmt = con.prepareStatement(sql); pstmt.setInt(1, startNum); pstmt.setInt(2,
			 * endNum);
			 */
			 
			if(searchsubject==null || keyword==null) {
				if(catd.equals("all")) {
					sql = prop.getProperty("review_selectAll");
				}else if(catd.equals("bag_acc")) {
					sql = prop.getProperty("review_selectCategoryAll");
					catdNum = 6;
				}else if(catd.equals("outer")) {
					sql = prop.getProperty("review_selectCategoryAll");
					catdNum = 7;
				}else if(catd.equals("top")) {
					sql = prop.getProperty("review_selectCategoryAll");
					catdNum = 8;
				}else if(catd.equals("bottom")) {
					sql = prop.getProperty("review_selectCategoryAll");
					catdNum = 9;
				}else if(catd.equals("wallet")) {
					sql = prop.getProperty("review_selectCategoryAll");
					catdNum = 10;
				}else if(catd.equals("office")) {
					sql = prop.getProperty("review_selectCategoryAll");
					catdNum = 11;
				}else if(catd.equals("home")) {
					sql = prop.getProperty("review_selectCategoryAll");
					catdNum = 12;
				}else if(catd.equals("furniture")) {
					sql = prop.getProperty("review_selectCategoryAll");
					catdNum = 13;
				}
				
				if(catdNum > 0){
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, catdNum);
					pstmt.setInt(2, startNum);
					pstmt.setInt(3, endNum);
				}else{
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, startNum);
					pstmt.setInt(2, endNum);
				}
			}else {
				if(catd.equals("all")) { 
					sql = prop.getProperty("review_searchselectAll") + " WHERE "+searchsubject+" LIKE '%' || ? || '%' ORDER BY REVIEW_REGDATE DESC) REVIEW) WHERE row_num >= ?) WHERE row_num <= ?";
				}else if(catd.equals("bag_acc")) {
					sql = prop.getProperty("review_searchselectAll") + " WHERE "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO = 6 ORDER BY REVIEW_REGDATE DESC) REVIEW) WHERE row_num >= ?) WHERE row_num <= ?";
				}else if(catd.equals("outer")) {
					sql = prop.getProperty("review_searchselectAll") + " WHERE "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO = 7 ORDER BY REVIEW_REGDATE DESC) REVIEW) WHERE row_num >= ?) WHERE row_num <= ?";
				}else if(catd.equals("top")) {
					sql = prop.getProperty("review_searchselectAll") + " WHERE "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO = 8 ORDER BY REVIEW_REGDATE DESC) REVIEW) WHERE row_num >= ?) WHERE row_num <= ?";
				}else if(catd.equals("bottom")) {
					sql = prop.getProperty("review_searchselectAll") + " WHERE "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO = 9 ORDER BY REVIEW_REGDATE DESC) REVIEW) WHERE row_num >= ?) WHERE row_num <= ?";
				}else if(catd.equals("wallet")) {
					sql = prop.getProperty("review_searchselectAll") + " WHERE "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO = 10 ORDER BY REVIEW_REGDATE DESC) REVIEW) WHERE row_num >= ?) WHERE row_num <= ?";
				}else if(catd.equals("office")) {
					sql = prop.getProperty("review_searchselectAll") + " WHERE "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO = 11 ORDER BY REVIEW_REGDATE DESC) REVIEW) WHERE row_num >= ?) WHERE row_num <= ?";
				}else if(catd.equals("home")) {
					sql = prop.getProperty("review_searchselectAll") + " WHERE "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO = 12 ORDER BY REVIEW_REGDATE DESC) REVIEW) WHERE row_num >= ?) WHERE row_num <= ?";
				}else if(catd.equals("furniture")) {
					sql = prop.getProperty("review_searchselectAll") + " WHERE "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO = 13 ORDER BY REVIEW_REGDATE DESC) REVIEW) WHERE row_num >= ?) WHERE row_num <= ?";
				}
						
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				pstmt.setInt(2, startNum);
				pstmt.setInt(3, endNum);
			}
			

			rs = pstmt.executeQuery();
			if(rs != null) {
				list = new ArrayList<Vo_Review>();
				while(rs.next()) {
					Vo_Review reviewVo = new Vo_Review();
					reviewVo.setProd_no(rs.getInt(2));
					reviewVo.setCatd_no(rs.getInt(3));
					reviewVo.setProd_name(rs.getString(4));
					reviewVo.setProd_front_img(rs.getString(5));
					reviewVo.setAcc_id(rs.getString(6));
					reviewVo.setOrder_no(rs.getInt(7));
					reviewVo.setProd_id(rs.getInt(8));
					reviewVo.setReview_title(rs.getString(9));
					reviewVo.setReview_content(rs.getString(10));
					reviewVo.setReview_rate(rs.getInt(11));
					reviewVo.setReview_regdate(rs.getDate(12));
					reviewVo.setReview_recon(rs.getString(13));
					
					list.add(reviewVo);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, con);
		}
		
		return list;
	}
	/**
	 * Method 설명: Review 조회 글 전체 Row 개수 Count
	 * 작성자: 주희진
	 * Date: 2020. 01. 03.
	 */
	@Override
	public int Cr_selectAllCount(String catd, String searchsubject, String keyword) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		Properties prop = new Properties();
		String filePath = properties("query_community.properties");
		String sql="";
		ResultSet rs = null;
		int res = 0;
		
		try {
			prop.load(new FileInputStream(filePath));
			//sql = prop.getProperty("review_selectAllCount");
			if(searchsubject==null || keyword==null) {
				if(catd.equals("all")) {
					sql = prop.getProperty("review_selectAllCount") + ")";
				}else if(catd.equals("bag_acc")) {
					sql = prop.getProperty("review_selectCategoryAllCount")+" WHERE CATD_NO = 6)";
				}else if(catd.equals("outer")) {
					sql = prop.getProperty("review_selectCategoryAllCount")+" WHERE CATD_NO = 7)";
				}else if(catd.equals("top")) {
					sql = prop.getProperty("review_selectCategoryAllCount")+" WHERE CATD_NO = 8)";
				}else if(catd.equals("bottom")) {
					sql = prop.getProperty("review_selectCategoryAllCount")+" WHERE CATD_NO = 9)";
				}else if(catd.equals("wallet")) {
					sql = prop.getProperty("review_selectCategoryAllCount")+" WHERE CATD_NO = 10)";
				}else if(catd.equals("office")) {
					sql = prop.getProperty("review_selectCategoryAllCount")+" WHERE CATD_NO = 11)";
				}else if(catd.equals("home")) {
					sql = prop.getProperty("review_selectCategoryAllCount")+" WHERE CATD_NO = 12)";
				}else if(catd.equals("furniture")) {
					sql = prop.getProperty("review_selectCategoryAllCount")+" WHERE CATD_NO = 13)";
				}
				
				pstmt = con.prepareStatement(sql);
				
				
			}else {
				
				if(catd.equals("all")) {
					sql = prop.getProperty("review_searchselectAllCount") +" "+searchsubject+" LIKE '%' || ? || '%')";
				}else if(catd.equals("bag_acc")) {
					sql = prop.getProperty("review_searchselectAllCount") +" "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO=6)";
				}else if(catd.equals("outer")) {
					sql = prop.getProperty("review_searchselectAllCount") +" "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO=7)";
				}else if(catd.equals("top")) {
					sql = prop.getProperty("review_searchselectAllCount") +" "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO=8)";
				}else if(catd.equals("bottom")) {
					sql = prop.getProperty("review_searchselectAllCount") +" "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO=9)";
				}else if(catd.equals("wallet")) {
					sql = prop.getProperty("review_searchselectAllCount") +" "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO=10)";
				}else if(catd.equals("office")) {
					sql = prop.getProperty("review_searchselectAllCount") +" "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO=11)";
				}else if(catd.equals("home")) {
					sql = prop.getProperty("review_searchselectAllCount") +" "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO=12)";
				}else if(catd.equals("furniture")) {
					sql = prop.getProperty("review_searchselectAllCount") +" "+searchsubject+" LIKE '%' || ? || '%' AND CATD_NO=13)";
				}
				
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				res = rs.getInt(1);
			}
				
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public boolean Cr_insert(Vo_Review rev) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean Cr_update(Vo_Review rev) {
		// TODO Auto-generated method stub
		return false;
	}


	/*
	 	@ 기능: 로그인 유저 정보 (임시)
	*/
	public Vo_Account getAccount(int acc_no) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM ACCOUNT WHERE ACC_NO=?";
		Vo_Account res = new Vo_Account();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, acc_no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				res.setAcc_no(rs.getInt(1));
				res.setAcc_id(rs.getString(2));
				res.setAcc_pw(rs.getString(3));
				res.setAcc_name(rs.getString(4));
				res.setAcc_birth(rs.getString(5));
				res.setAcc_email(rs.getString(6));
				res.setAcc_phone(rs.getString(7));
				res.setAcc_zipcode(rs.getString(8));
				res.setAcc_addr(rs.getString(9));
				res.setAcc_addr2(rs.getString(10));
				res.setAcc_isReg(rs.getString(11));
				res.setAcc_point(rs.getInt(12));
				res.setAcc_m_c(rs.getString(13));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, con);
		}
		
		return res;
	}
	/**
	 * Method 설명: product search 리스트 로드
	 * 작성자: 주희진
	 * Date: 2019. 12. 30.
	 */
	@Override
	public List<Vo_Product> Cp_selectAll(Vo_QnA_Paging paging, String keyword) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		Properties prop = new Properties();
		ResultSet rs = null;
		List<Vo_Product> list = new ArrayList<Vo_Product>();
		
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		
		String filePath = properties("query_community.properties");
		try {
			prop.load(new FileInputStream(filePath));
			String sql = prop.getProperty("qna_pro_selectAll");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Vo_Product tmp = new Vo_Product();
				tmp.setProd_no(rs.getInt(2));
				tmp.setProd_catd(rs.getInt(3));
				tmp.setProd_front_img(rs.getString(4));
				tmp.setProd_name(rs.getString(5));
				
				list.add(tmp);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, con);
		}
		
		return list;
	}
	
	/**
	 * Method 설명: Product search 리스트 전체  Row 개수 Count
	 * 작성자: 주희진
	 * Date: 2019. 12. 27.
	 */
	@Override
	public int Cp_selectAllCount(String keyword) {

		Connection con = getConnection();
		PreparedStatement pstmt = null;
		Properties prop = new Properties();
		String filePath = properties("query_community.properties");
		ResultSet rs = null;
		int res = 0;
		//SELECT * FROM (SELECT * FROM (SELECT ROWNUM row_num, PROD_NO, CATD_NO, PROD_FRONT_IMG, PROD_NAME FROM (SELECT PROD_NO, PROD_ID, CATD_NO, PROD_FRONT_IMG, PROD_NAME FROM PRODUCT JOIN PROD_OPTION USING(PROD_NO) WHERE PROD_NAME LIKE '%' || ? || '%' ORDER BY PROD_NO) PRODUCT) WHERE row_num >= ?) WHERE row_num <= ?
		//SELECT COUNT(*) AS COUNT FROM (SELECT ROWNUM row_num, PROD_NO, CATD_NO, PROD_FRONT_IMG, PROD_NAME FROM PRODUCT WHERE PROD_NAME LIKE '%' || ? || '%')
		try {
			prop.load(new FileInputStream(filePath));
			String sql = prop.getProperty("qna_pro_selectAllCount");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				res = rs.getInt(1);
			}
				
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}

	/**
	 * Method 설명: QnA 글 조회수
	 * 작성자: 주희진
	 * Date: 2019. 12. 27.
	 */
	@Override
	public void Cq_updateViewCount(int qna_no) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		Properties prop = new Properties();
		String filePath = properties("query_community.properties");
		int res = 0;
		
		try {
			prop.load(new FileInputStream(filePath));
			String sql = prop.getProperty("qna_updateViewCount");
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qna_no);
			res = pstmt.executeUpdate();
			
			if(res > 0) {
				commit(con);
			}else {
				rollback(con);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, con);
		}
		
	}

	@Override
	public List<Vo_QnA> Pd_selectAll(int pseq) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		Properties prop = new Properties();
		String filePath = properties("query_community.properties");
		String sql = "";
		ResultSet rs = null;
		List<Vo_QnA> list = null;
		
		//int startNum = paging.getStartNum();
		//int endNum = paging.getEndNum();
		
		try {
			prop.load(new FileInputStream(filePath));
			sql = prop.getProperty("prod_singleDetail_qna_selectAll");
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pseq);
			
			rs = pstmt.executeQuery();
			if(rs != null) {
				list = new ArrayList<Vo_QnA>();
				while(rs.next()) {
					Vo_QnA tmp = new Vo_QnA();
					tmp.setQna_acc_id(rs.getString(1));
					tmp.setQna_no(rs.getInt(2));
					tmp.setCatd_no(rs.getInt(3));
					tmp.setQna_seq_no(rs.getInt(4));
					tmp.setQna_acc_no(rs.getInt(5));
					tmp.setQna_front_img(rs.getString(6));
					tmp.setQna_title(rs.getString(7));
					tmp.setQna_content(rs.getString(8));
					tmp.setQna_con_count(rs.getInt(9));
					tmp.setQna_regdate(rs.getDate(10));
					tmp.setQna_re_yn(rs.getString(11));
					tmp.setQna_view_count(rs.getInt(12));
					tmp.setQna_pno(rs.getInt(13));
					list.add(tmp);
					
				}
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}








}

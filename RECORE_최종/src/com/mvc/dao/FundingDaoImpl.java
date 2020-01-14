package com.mvc.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import static common.JDBCTemplate.*;

import com.mvc.vo.Vo_Funding;
import com.mvc.vo.Vo_Funding_Payment;
import com.mvc.vo.Vo_Product;


public class FundingDaoImpl implements FundingDao {

	@Override
	public List<Vo_Funding> F_selectAll() {
		
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Vo_Funding> list = new ArrayList<Vo_Funding>();
		
		
		try {

			
			
			Properties prop = new Properties();
			String filePath = properties("query_funding.properties");
			prop.load(new FileInputStream(filePath));
			String sql = prop.getProperty("selectAllFunding");

			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Vo_Funding tmp = new Vo_Funding(rs.getInt(1), rs.getString(2), rs.getString(3),
						rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getDate(8), rs.getDate(9),
						rs.getString(10),rs.getInt(11));
				
				list.add(tmp);
				
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pstmt,con);
		}
		
		return list;
	}
	
	
	
	
	@Override
	public Vo_Funding F_selectOne(int fseq) {
		
		
		
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Vo_Funding vo = null;
		
		try {
			Properties prop = new Properties();
			String filePath = properties("query_funding.properties");
			prop.load(new FileInputStream(filePath));
			String sql = prop.getProperty("selectOneFunding");
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, fseq);
			System.out.println("펀딩 시퀀스"+fseq);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new Vo_Funding(rs.getInt(1), rs.getString(2), rs.getString(3),
						rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getDate(8), rs.getDate(9),
						rs.getString(10),rs.getInt(11));
			}

			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pstmt,con);
		}

		return vo;
	}

	@Override
	public boolean F_insert(Vo_Funding reg) {

		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;
		
		
		try {
			Properties prop = new Properties();
			String filePath = properties("query_funding.properties");
			prop.load(new FileInputStream(filePath));
			String sql = prop.getProperty("insertFunding");
			
			pstmt = con.prepareStatement(sql);
			
			
			pstmt.setString(1, reg.getFund_title());
			pstmt.setString(2, reg.getFund_creator());
			pstmt.setInt(3, reg.getFund_con_count());
			pstmt.setInt(4, reg.getFund_target_price());
			pstmt.setDate(5, reg.getFund_deadline());
			
			
			res = pstmt.executeUpdate();
			
			if(res>0) {
				System.out.println("insert 성공");
				commit(con);
			}
			
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
		
		return res>0 ? true : false;
	}
	@Override
	public boolean F_insert(Vo_Funding_Payment fvo2) {
	      //펀딩 참여하기-카드정보 입력
	      Connection con = getConnection();
	      PreparedStatement pstmt = null;
	      int res = 0;
	      
	      try {
	         Properties prop = new Properties();
	         String filePath = properties("query_funding.properties");
	         prop.load(new FileInputStream(filePath));
	         String sql = prop.getProperty("payFunding");
	         
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, fvo2.getFund_no());
	         pstmt.setInt(2, fvo2.getAcc_no());
	         pstmt.setInt(3, fvo2.getFpm_price());
	         pstmt.setString(4, fvo2.getFpm_card_name());
	         
	         pstmt.setString(5, fvo2.getFpm_card_pw());
	         pstmt.setString(6, fvo2.getFpm_card_valid());
	         pstmt.setString(7, fvo2.getFpm_card_cvc());
	         
	         res = pstmt.executeUpdate();
	         
	         if(res>0) {
	            System.out.println("펀딩 참여 성공");
	            commit(con);
	         }
	         
	         
	      } catch (IOException e) {
	         e.printStackTrace();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt, con);
	      }
	      
	      return res>0 ? true : false;
	}

	

	@Override
	public boolean F_delete(int fseq) {

		
		
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;
		
		
		try {
			Properties prop = new Properties();
			String filePath = properties("query_funding.properties");
			prop.load(new FileInputStream(filePath));
			String sql = prop.getProperty("deleteFunding");
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, fseq);

			
			res = pstmt.executeUpdate();
			
			if(res>0) {
				System.out.println("delete 성공");
				commit(con);
			}

			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
		
		return res>0 ? true : false;
	}
	

	

	@Override
	public boolean F_expire(Vo_Funding sof) {

		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;

		try {
			Properties prop = new Properties();
			String filePath = properties("query_funding.properties");
			prop.load(new FileInputStream(filePath));
			String sql = prop.getProperty("fundingSOF");
			
			pstmt = con.prepareStatement(sql);
			res = pstmt.executeUpdate();
				commit(con);
		
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
		
		return res>0 ? true : false;
	}




	@Override
	public Vo_Funding F_fundingIt(int fseq) {
		
		

		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Vo_Funding fvo = new Vo_Funding();

		try {

			Properties prop = new Properties();
			String filePath = properties("query_funding.properties");
			prop.load(new FileInputStream(filePath));
			String sql = prop.getProperty("fundingIt");

			pstm = con.prepareStatement(sql);
			pstm.setInt(1, fseq);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				fvo = new Vo_Funding(rs.getInt(1), rs.getString(2), rs.getString(3),
						rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getDate(8), rs.getDate(9),
						rs.getString(10),rs.getInt(11));
			}
			

		} catch (IOException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		} 
		
		finally {

			close(rs, pstm, con);

		}

		return fvo;
	}
	@Override
	public int F_getSeqCurrval() {
		
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int f_seq = 0;
		
		
		try {
			Properties prop = new Properties();
			String filePath = properties("query_funding.properties");
			prop.load(new FileInputStream(filePath));
			
			String sql = prop.getProperty("selectFund_seq");
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				f_seq = rs.getInt(1);
				
			}
			
			f_seq--;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}  catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs,pstmt,con);
		}
		
		return f_seq;
	}




	@Override
	public boolean F_total(Vo_Funding tot) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;	
		int res = 0;
		
		try {
			Properties prop = new Properties();
			String filePath = properties("query_funding.properties");
			prop.load(new FileInputStream(filePath));
			String sql = prop.getProperty("totalFundingPayment");
			
			pstmt = con.prepareStatement(sql);
			
			
			pstmt.setInt(1, tot.getFund_total());
			
			
			
			res = pstmt.executeUpdate();
			
			if(res>0) {
				commit(con);
			}
			
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
		
		return res>0 ? true : false;
	}




	@Override
	public boolean F_updateSOF() { //from 김성일
		
		Connection con = getConnection();
		PreparedStatement pstmt = null;	
		int res = 0;
		
		try {
			Properties prop = new Properties();
			String filePath = properties("query_funding.properties");
			prop.load(new FileInputStream(filePath));
			String sql = prop.getProperty("updateSOF");
			
			pstmt = con.prepareStatement(sql);
			res = pstmt.executeUpdate();
			
			if(res>0) {
				commit(con);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
		
		
		return (res>0)? true:false;
	}
	
	   @Override
	   public List<Vo_Funding_Payment> F_join_selectAll(int fund_no) {
	      
	      Connection con = getConnection();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      List<Vo_Funding_Payment> list = new ArrayList<Vo_Funding_Payment>();
	      
	      
	      try {
	         
	         Properties prop = new Properties();
	         String filePath = properties("query_funding.properties");
	         prop.load(new FileInputStream(filePath));
	         String sql = prop.getProperty("selectJoinAllFunding");

	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, fund_no);
	         
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            Vo_Funding_Payment tmp = 
	                  new Vo_Funding_Payment(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4),
	                  rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
	            
	            list.add(tmp);
	         }
	      } catch (IOException e) {
	         e.printStackTrace();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rs,pstmt,con);
	      }
	      
	      return list;
	   }
	
	
}



	






	


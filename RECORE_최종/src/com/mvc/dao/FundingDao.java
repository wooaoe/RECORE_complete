package com.mvc.dao;

import java.util.List;

import com.mvc.vo.Vo_Funding;
import com.mvc.vo.Vo_Funding_Payment;


public interface FundingDao {

	public List<Vo_Funding> F_selectAll(); //펀딩 내역 전체 조회

	public List<Vo_Funding_Payment> F_join_selectAll(int fund_no); //펀딩 참여 내역 전체 조회
	
	public Vo_Funding F_selectOne(int fseq); //펀딩 선택 조회

	public boolean F_insert(Vo_Funding reg); //펀딩 등록
	
	public boolean F_insert(Vo_Funding_Payment fvo2); //펀딩 참여 내역 / 카드정보 입력받기

	public boolean F_expire(Vo_Funding sof); // 펀딩 성공/실패 여부 판단
	
	public Vo_Funding F_fundingIt(int fseq); //펀딩하기 버튼 눌렀을떄 작동하는 기능
	
	public boolean F_delete(int fseq);//삭제기능(테스트용)
	
	public int F_getSeqCurrval(); //현재 시퀀스 번호 가져오기
	
	public boolean F_total(Vo_Funding tot); //펀딩내역 총액 계산 실시간 업데이트
	
	public boolean F_updateSOF(); //펀딩 목표 금액 달성시 DB내 성공여부 업데이트 //from 김성일
	
	
}

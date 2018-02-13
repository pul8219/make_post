package se.dku.simple.service;

import java.util.HashMap;
import java.util.List;

import se.dku.simple.vo.Member;


public interface MemberService 
{	
	// 로그인 처리를 위한 함수
	public boolean login(String id, String pwd);
	
	// 모든 회원의 정보를 조회하기 위한 함수 
	public List<HashMap<String, Object>> selectAll();
	
	// 파라미터로 전달받은 "id"에 해당하는 회원의 정보를 조회하기 위한 함수
	public HashMap<String, Object> getMemberInfo(String id) throws Exception;
	
	// 파라미터로 전달받은 회원정보를 등록하기 위한 함수
	public void registerMember(HashMap<String, Object> params);
	
	// 파라미터로 전달받은 회원정보를 수정하기 위한 함수
	public void updateMemberInfo(HashMap<String, Object> params) throws Exception;
	
	// 파라미터로 전달받은 "id"에 해당하는 회원을 삭제하기 위한 함수
	public void deleteMember(String id) throws Exception;
	
}

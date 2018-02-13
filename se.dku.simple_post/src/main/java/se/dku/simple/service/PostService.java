package se.dku.simple.service;

import java.util.HashMap;
import java.util.List;

import se.dku.simple.vo.Post;

public interface PostService {
	// 모든 게시물의 정보를 조회하기 위한 함수
	public List<HashMap<String, Object>> selectAll();
	
	// 파라미터로 전달받은 게시물정보를 등록하기 위한 함수 -> insert 쿼리 사용
	public void writePost(HashMap<String, Object> params);
	
	// 파라미터로 전달받은 "idx"에 해당하는 게시물의 정보를 조회하기 위한 함수
	public HashMap<String, Object> getPostInfo(String idx) throws Exception;
	
	// 파라미터로 전달받은 "idx"에 해당하는 게시물의 정보를 수정하기 위한 함수 -> update 쿼리 사용
	public void updatePost(HashMap<String, Object> params) throws Exception;
	
	// 파라미터로 전달받은 "idx"에 해당하는 게시물을 삭제하기 위한 함수 -> delete 쿼리 사용
	public void deletePost(String idx) throws Exception;
}

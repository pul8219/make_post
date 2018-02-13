package se.dku.simple.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import se.dku.simple.vo.Member;


@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@Override
	public boolean login(String id, String pwd) {
		// TODO Auto-generated method stub
		HashMap<String, Object> member = (HashMap<String, Object>) sqlSession.selectOne(
					"MemberMapper.GetMemberInfo", id);
		if(member == null)
            return false;
        else {
        	// 비밀번호가 일치하는 경우 로그인 성공
            if(member.get("pwd").equals(pwd))
                return true;
            // 비밀번호가 일치하지 않은 경우 로그인 실패
            else 
                return false;
        }
	}
	
	@Override
	public List<HashMap<String, Object>> selectAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("MemberMapper.GetMemberList");
	}
	
	@Override
	public HashMap<String, Object> getMemberInfo(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MemberMapper.GetMemberInfo", id);
	}
	
	@Override
	public void registerMember(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		if(params.get("pwd").equals(params.get("pwd_CHECK"))) 
			sqlSession.insert("MemberMapper.RegisterMemberInfo", params);
	}
	
	@Override
	public void updateMemberInfo(HashMap<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("MemberMapper.UpdateMemberInfo", params);
	}

	@Override
	public void deleteMember(String id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("MemberMapper.DeleteMember", id);
	}
}

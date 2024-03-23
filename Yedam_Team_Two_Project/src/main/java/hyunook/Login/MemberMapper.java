package hyunook.Login;

import java.util.List;

import common.Member;

public interface MemberMapper {
	//로그인
	Member selectMember(Member member);
	//아이디 조회
	List<Member> searchId(Member meber);
	//비밀번호 조회
	List<Member> searchPw(Member meber);
	//회원가입
	int insertMember(Member member);
    //중복아이디조회
	int sameId(String id);
	//중복이메일조회
	int sameEmail(String email);
	//중복전화번호조회
	int sameTel(String tel);
	
	int updateUserInfo(Member member);
}

package hyunook.Login;

import java.util.List;

import common.Member;

public interface MemberService {
	//로그인
    Member loginCheck(Member member);
    //아이디조회
    List<Member> searchId(Member member);
    //비밀번호
    List<Member> searchPw(Member member);
    //회원가입
    boolean addMember(Member member);
    //중복아이디조회
    public int sameId(String id);
    //중복이메일조회
    public int sameEmail(String email);
    //중복전화번호조회
    public int sameTel(String tel);
    // 회원정보 변경
    boolean updateUserInfo(Member member);

}



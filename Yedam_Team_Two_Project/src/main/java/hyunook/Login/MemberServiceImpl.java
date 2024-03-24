package hyunook.Login;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;
import common.Member;

public class MemberServiceImpl implements MemberService {
	SqlSession session = DataSource.getInstance().openSession(true);
	MemberMapper mapper = session.getMapper(MemberMapper.class);

	// 로그인
	public Member loginCheck(Member member) {
		return mapper.selectMember(member);
	}
    // 아이디조회
	public List<Member> searchId(Member member) {
		return mapper.searchId(member);
	}
	// 비밀번호조회
	public boolean searchPw(Member member) {
		 Integer result = mapper.searchPw(member);
		 System.out.println("야야야: "+result);
		 return result == 1;
	}
	// 회원가입
	public boolean addMember(Member member) {
		return mapper.insertMember(member) == 1;
	}

	// 중복아이디 조회
	public int sameId(String id) {
		int result = mapper.sameId(id);
		System.out.println("service=" + result);
		return result;
	}

	// 중복이메일 조회
	public int sameEmail(String email) {
		int result = mapper.sameEmail(email);
		System.out.println("이메일service=" + result);
		return result;
	}

	// 중복전화번호 조회
	public int sameTel(String tel) {
		int result = mapper.sameTel(tel);
		System.out.println("전화번호service=" + result);
		return result;
	}
	@Override
	public boolean updateUserInfo(Member member) {
		return mapper.updateUserInfo(member) == 1;
	}
}

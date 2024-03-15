package hyunook.Login;

import common.Member;

public interface MemberMapper {
	//로그인
	Member selectMember(Member member);
}

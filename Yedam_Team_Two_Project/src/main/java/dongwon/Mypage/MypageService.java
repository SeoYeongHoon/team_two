package dongwon.Mypage;

import java.util.List;

import common.Member;

public interface MypageService {
	List<Member> memberInfoList(String info);
	boolean modifyMember(Member member);
	
	boolean showMember(Member member);
}

package hyunook.Login;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;
import common.Member;

public class MemberServiceImpl implements MemberService{
      SqlSession session = DataSource.getInstance().openSession(true);
      MemberMapper mapper = session.getMapper(MemberMapper.class);
      
      public Member loginCheck(Member member) {
    	  return mapper.selectMember(member);
      }
}

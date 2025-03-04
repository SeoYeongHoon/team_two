package dongwon.Mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;
import common.Member;


public class MypageServiceImpl implements MypageService {

	SqlSession session = DataSource.getInstance().openSession(true);
	MypageMapper mapper = session.getMapper(MypageMapper.class);
	
	@Override
	public boolean modifyMember(Member member) {
		return mapper.modifyMember(member) == 1;
	}

	@Override
	public boolean showMember(Member member) {
		return mapper.showMember(member) == 1;
	}

	@Override
	public List<Member> memberInfoList(String info) {
		return null;
	}

}

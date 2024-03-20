package dongwon.Mypage;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;

public class MypageServiceImpl implements MypageService {

	SqlSession session = DataSource.getInstance().openSession(true);
	MypageMapper mapper = session.getMapper(MypageMapper.class);

}

package changoh.Download;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;
import common.Goods;
import common.Member;

public class DownloadServiceImpl implements DownloadService{
	SqlSession session = DataSource.getInstance().openSession(true); //자동 커밋
	DownloadMapper mapper = session.getMapper(DownloadMapper.class);
	
	@Override
	public List<Goods> getPurchasedGoodsList(Member member) {
		return mapper.getPurchasedGoodsList(member);
	}
}

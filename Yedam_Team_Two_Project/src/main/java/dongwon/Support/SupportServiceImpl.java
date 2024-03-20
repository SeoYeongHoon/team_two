package dongwon.Support;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;

public class SupportServiceImpl implements SupportService {

	SqlSession session = DataSource.getInstance().openSession(true);
	SupportMapper mapper = session.getMapper(SupportMapper.class);

}

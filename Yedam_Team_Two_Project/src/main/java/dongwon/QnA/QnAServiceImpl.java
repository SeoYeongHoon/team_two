package dongwon.QnA;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;
import common.TestMapper;

public class QnAServiceImpl implements QnAService {

	SqlSession session = DataSource.getInstance().openSession(true);
	QnAMapper mapper = session.getMapper(QnAMapper.class);

}

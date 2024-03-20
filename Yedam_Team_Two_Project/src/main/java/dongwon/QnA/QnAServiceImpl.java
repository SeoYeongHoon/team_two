package dongwon.QnA;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;

public class QnAServiceImpl implements QnAService {
	SqlSession session = DataSource.getInstance().openSession(true);
	QnAMapper mapper = session.getMapper(QnAMapper.class);
	
	@Override
	public QnA infoQnA(QnA qna) {
		return mapper.qnaInfo(qna);
	}

}

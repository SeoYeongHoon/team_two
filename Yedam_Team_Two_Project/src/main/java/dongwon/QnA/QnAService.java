package dongwon.QnA;


import org.apache.ibatis.session.SqlSession;

import common.DataSource;

public interface QnAService {
	SqlSession session = DataSource.getInstance().openSession(true);	
	QnAMapper mapper = session.getMapper(QnAMapper.class);
	
	QnA infoQnA(QnA qna);

	void insertQnA(String memberId, String title, String content);

}

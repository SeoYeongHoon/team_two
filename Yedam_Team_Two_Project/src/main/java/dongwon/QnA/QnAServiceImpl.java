package dongwon.QnA;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;

public class QnAServiceImpl implements QnAService {

    
    @Override
    public void insertQnA(String memberId, String title, String content) {
        SqlSession session = null;
        try {
            session = DataSource.getInstance().openSession(true);
            QnAMapper mapper = session.getMapper(QnAMapper.class);
            
            QnA qna = new QnA();
            qna.setMemberId(memberId);
            qna.setTitle(title);
            qna.setContent(content);
            
            mapper.insertQnA(qna);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    @Override
    public QnA infoQnA(QnA qna) {
        return null;
    }

}

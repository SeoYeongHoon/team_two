package dongwon.QnA;

public interface QnAService {
	QnA infoQnA(QnA qna);

	void insertQnA(String memberId, String title, String content);
}

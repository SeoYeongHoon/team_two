package dongwon.QnA;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class QnA {
	private int qnaId;
	private String title;
	private String content;
	private Date qnaDate;
	private int memberId;
	
}

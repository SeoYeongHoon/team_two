package dongwon.QnA;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QnA {
	private int qnaId;
	private Date qnaDate;
	private String memberId;
	private String title;
	private String content;
	
}

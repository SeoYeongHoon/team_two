package changoh.Magazine;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Magazine {
	private int magazineId;
	private String title;
	private String content;
	private String image;
	private String memberId;
	
}

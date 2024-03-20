package changoh.Magazine;

import java.text.SimpleDateFormat;
import java.util.Date;

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
	private String thumbnail;
	private String image;
	private Date createDate;
	private String memberId;
	private String mcName;
	
	public String getDateToString() {
		SimpleDateFormat fmt = new SimpleDateFormat("YYYY-MM-DD HH:mm");
		return fmt.format(createDate);
	}
}

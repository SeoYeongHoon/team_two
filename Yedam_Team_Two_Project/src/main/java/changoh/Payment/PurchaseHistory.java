package changoh.Payment;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PurchaseHistory {
	private String pId;
	private Date pDate;
	private int price;
	private String memberId;
}

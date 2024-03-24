package changoh.MyCart;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyCart {
	private int cartId;
	private int goodsId;
	private String memberId;
}

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

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
}

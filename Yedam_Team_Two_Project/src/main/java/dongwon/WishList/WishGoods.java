package dongwon.WishList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WishGoods {
	//이 클래스의 작성 목적 : 이 페이지의 요소이자, 함수의 반환타입으로 쓰기 위함
	private int wishGoodsId;
	private String memberId;
	private int goodsId;
	
	//재확인했으나 역시 롬복이 작동되지 않음
	
	public int getWishGoodsId() {
		return wishGoodsId;
	}
	public void setWishGoodsId(int wishGoodsId) {
		this.wishGoodsId = wishGoodsId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	
	
}

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
}

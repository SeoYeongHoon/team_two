package changoh.MyCart;

import java.util.List;

import common.Member;

public interface MyCartMapper {
	List<MyCart> getCartList(Member member);
	int removeMyCart(MyCart myCart);
}

package changoh.MyCart;

import java.util.List;

import common.Member;

public interface MyCartService {
	List<MyCart> getCartList(Member member);
	int removeMyCart(MyCart myCart);
}

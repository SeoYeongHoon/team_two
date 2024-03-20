package changoh.Payment;

import java.util.List;

import common.Goods;
import common.Member;

public interface PaymentService {
	Member getMember(Member member);
	Goods getGoods(Goods goods);
	List<Goods> getCartList(Member member);
}

package changoh.Payment;

import common.Goods;
import common.Member;

public interface PaymentService {
	Member getMember(Member member);
	Goods getGoods(Goods goods);
}

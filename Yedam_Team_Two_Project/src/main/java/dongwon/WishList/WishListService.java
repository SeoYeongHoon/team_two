package dongwon.WishList;

import java.util.List;

import common.Member;

public interface WishListService {
	List<WishGoods> getWishList(String memberId);
}

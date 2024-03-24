package youhwan.Product;

import java.util.List;

import common.CartList;
import common.Goods;
import common.WishList;

public interface ProductMapper {
	//List<Goods> ProductList(Goods goods);
	// 굿즈 데이터
	Goods selectGoods(int gid);
	// 리뷰 데이터
	List<Review> selectReview(int gid);
	
	// 리뷰 전체를 계산
	int selectCount(int gid);
	
	int insertWishList(WishList list);
	int insertCartList(CartList list);
}

package youhwan.Product;

import java.util.List;

import common.CartList;
import common.Goods;
import common.WishList;

public interface ProductService {
	//List<Goods> ProductList(Goods goods);
	// 굿즈 데이터
	Goods getGoods(int gid);
	// 리뷰 데이터
	List<Review> ProductReview(int gid);
	// 리뷰 전체 건수
	int totalCount(int gid);
    //조회수 확인 
	boolean viewCount(int gid);
	boolean insertWishList(WishList list);
	boolean insertCartList(CartList list);
}

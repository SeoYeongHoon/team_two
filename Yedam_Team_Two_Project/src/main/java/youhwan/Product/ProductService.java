package youhwan.Product;

import java.util.List;

import common.Goods;

public interface ProductService {
	//List<Goods> ProductList(Goods goods);
	// 굿즈 데이터
	Goods getGoods(int gid);
	// 리뷰 데이터
	List<Review> ProductReview(int gid);
	// 리뷰 전체 건수
	int totalCount(int gid);
}

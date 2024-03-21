package youhwan.Product;

import java.util.List;

import common.Goods;

public interface ProductMapper {
	//List<Goods> ProductList(Goods goods);
	// 굿즈 데이터
	Goods selectGoods(int gid);
	// 리뷰 데이터
	List<Review> selectReview(int gid);
	
	// 리뷰 전체를 계산
	int selectCount(int gid);
	
	
	
	
	
}

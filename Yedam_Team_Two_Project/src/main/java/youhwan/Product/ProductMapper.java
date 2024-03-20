package youhwan.Product;

import java.util.List;

import common.Goods;

public interface ProductMapper {
	List<Goods> ProductList(Goods goods);
	
	Goods selectGoods(int gid);
	
	
}

package youhwan.Product;

import java.util.List;

import common.Goods;

public interface ProductService {
	List<Goods> ProductList(Goods goods);
	
	Goods getGoods(int gid);
	
}

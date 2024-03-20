package hyunook.ProductList;


import java.util.List;

import common.Goods;

public interface GoodsListService {
    //개인판매 리스트

	List<Goods> privateProductList(String goods);
	
	List<Goods> goodsList();
	boolean addGoods(Goods goods);
	boolean removeGoods(String goodsId);
}

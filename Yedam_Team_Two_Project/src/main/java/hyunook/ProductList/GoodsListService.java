package hyunook.ProductList;


import java.util.List;

import common.Goods;

public interface GoodsListService {
    //개인판매 리스트

	List<Goods> privateProductList();
	List<Goods> privateProductList(Goods goods);
	
	List<Goods> goodsList();
	Goods getGoods(int goodsId);
	boolean addGoods(Goods goods);
	boolean modifyGoods(Goods goods);
	boolean removeGoods(int goodsId);
}

package hyunook.ProductList;


import java.util.List;

import common.Goods;

public interface GoodsListService {
    //개인판매 리스트

	List<Goods> privateProductList(GoodsSearch search);
	int privateCnt(GoodsSearch search);
	List<Goods> goodsList(GoodsSearch search);
	Goods getGoods(int goodsId);
	boolean addGoods(Goods goods);
	boolean modifyGoods(Goods goods);
	boolean removeGoods(int goodsId);
	
	int boardTotalCnt();
	
	boolean updateConfirm(Goods goods);
}

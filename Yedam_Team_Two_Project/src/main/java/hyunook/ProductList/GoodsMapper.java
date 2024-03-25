package hyunook.ProductList;


import java.util.List;

import common.Goods;

public interface GoodsMapper {
     //개인판매 리스트
	List<Goods> privateProductList(GoodsSearch search);
	int privateCnt(GoodsSearch search);
	List<Goods> goodsList(GoodsSearch search);
	Goods selectGoods(int goodsId);
	int insertGoods(Goods goods);
	int removeGoods(int goodsId);
	int updateGoods(Goods goods);
	
	int getTotalCnt();
	
	int updateConfirm(Goods goods);
}

package hyunook.ProductList;


import java.util.List;

import common.Goods;

public interface GoodsMapper {
     //개인판매 리스트
	List<Goods> privateProductList(String goods);
	
	List<Goods> goodsList();
	int insertGoods(Goods goods);
	int removeGoods(String goodsId);
}

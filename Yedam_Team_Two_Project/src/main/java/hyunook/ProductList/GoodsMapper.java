package hyunook.ProductList;


import java.util.List;

import common.Goods;

public interface GoodsMapper {
     //개인판매 리스트1
	List<Goods> privateProductList();

     //개인판매 리스트
	List<Goods> privateProductList(Goods goods);
	
	List<Goods> goodsList();
}

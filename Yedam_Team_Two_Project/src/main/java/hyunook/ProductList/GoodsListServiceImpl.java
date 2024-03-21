package hyunook.ProductList;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;
import common.Goods;

public class GoodsListServiceImpl implements GoodsListService {
	SqlSession session = DataSource.getInstance().openSession(true);
	GoodsMapper mapper = session.getMapper(GoodsMapper.class);


	@Override
	// 개인판매 리스트
	public List<Goods> privateProductList(GoodsSearch search) {
		return mapper.privateProductList(search);
	}

	@Override
	public boolean addGoods(Goods goods) {
		return mapper.insertGoods(goods) == 1;
	}

	@Override
	public boolean removeGoods(int goodsId) {
		return mapper.removeGoods(goodsId) == 1;
	}
  
  	@Override
	public List<Goods> goodsList() {
		return mapper.goodsList();
	}

	@Override
	public boolean modifyGoods(Goods goods) {
		return mapper.updateGoods(goods) == 1;
	}

	@Override
	public Goods getGoods(int goodsId) {
		return mapper.selectGoods(goodsId);
	}

}

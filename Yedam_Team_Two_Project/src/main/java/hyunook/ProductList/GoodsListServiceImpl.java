package hyunook.ProductList;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;
import common.Goods;

public class GoodsListServiceImpl implements GoodsListService {
	SqlSession session = DataSource.getInstance().openSession(true);
	GoodsMapper mapper = session.getMapper(GoodsMapper.class);

	// 개인상품 리스트
	public List<Goods> privateProductList(Goods goods) {
		return mapper.privateProductList(goods);
	}

	@Override
	public List<Goods> goodsList() {
		return mapper.goodsList();
	}

	@Override
	// 개인판매 리스트
	public List<Goods> privateProductList() {
		return mapper.privateProductList();
	}

	@Override
	public boolean addGoods(Goods goods) {
		return mapper.insertGoods(goods) == 1;
	}

	@Override
	public boolean removeGoods(String goodsId) {
		return mapper.removeGoods(goodsId) == 1;
	}

}

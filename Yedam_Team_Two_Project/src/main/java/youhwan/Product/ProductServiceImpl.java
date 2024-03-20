package youhwan.Product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;
import common.Goods;

public class ProductServiceImpl implements ProductService {
	
	SqlSession session = DataSource.getInstance().openSession(true);
	ProductMapper mapper = session.getMapper(ProductMapper.class);

	@Override
	public List<Goods> ProductList(Goods goods) {
		// TODO Auto-generated method stub
		return mapper.ProductList(goods);
	}
	
	@Override
	public Goods getGoods(int gid) {
		// TODO Auto-generated method stub
		return mapper.selectGoods(gid);
	}
	

}

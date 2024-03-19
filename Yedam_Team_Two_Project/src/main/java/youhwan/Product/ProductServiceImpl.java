package youhwan.Product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;

public class ProductServiceImpl implements ProductService {
	
	SqlSession session = DataSource.getInstance().openSession(true);
	ProductMapper mapper = session.getMapper(ProductMapper.class);
	
	@Override
	public List<String> ProductList() {
		// TODO Auto-generated method stub
		return mapper.ProductList();
	}
	
	

}

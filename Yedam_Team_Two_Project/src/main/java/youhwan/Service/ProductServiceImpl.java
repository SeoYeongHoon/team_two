package youhwan.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;
import youhwan.Mapper.ProductMapper;

public class ProductServiceImpl implements ProductService {
	
	SqlSession session = DataSource.getInstance().openSession(true);
	ProductMapper mapper = session.getMapper(ProductMapper.class);
	
	@Override
	public List<String> ProductList() {
		// TODO Auto-generated method stub
		return mapper.ProductList();
	}
	
	

}

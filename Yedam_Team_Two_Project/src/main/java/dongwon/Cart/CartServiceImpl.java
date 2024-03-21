package dongwon.Cart;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;

public class CartServiceImpl implements CartService {

	SqlSession session = DataSource.getInstance().openSession(true);
	CartMapper mapper = session.getMapper(CartMapper.class);

}

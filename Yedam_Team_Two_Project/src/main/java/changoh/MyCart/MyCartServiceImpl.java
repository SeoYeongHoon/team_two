package changoh.MyCart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;
import common.Member;

public class MyCartServiceImpl implements MyCartService{
	SqlSession session = DataSource.getInstance().openSession(true); //자동 커밋
	MyCartMapper mapper = session.getMapper(MyCartMapper.class);
	
	@Override
	public List<MyCart> getCartList(Member member) {
		return mapper.getCartList(member);
	}
	@Override
	public int removeMyCart(MyCart myCart) {
		return mapper.removeMyCart(myCart);
	}
}

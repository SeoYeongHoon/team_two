package hyunook.CartAdd;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;

public class CartAddServiceImpl implements CartAddService{
   
	SqlSession session = DataSource.getInstance().openSession(true);
	CartAddMapper mapper = session.getMapper(CartAddMapper.class);
	
	public boolean cartAdd(AddCart addcart) {
        return mapper.addCart(addcart) == 1;
	}
	public int cartCheck(AddCart addcart) {
		return mapper.checkCart(addcart);
	}
}

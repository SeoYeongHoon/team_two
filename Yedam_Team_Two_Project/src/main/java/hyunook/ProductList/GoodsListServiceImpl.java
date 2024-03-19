package hyunook.ProductList;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;
import common.Goods;

public class GoodsListServiceImpl implements GoodsListService{
   SqlSession session = DataSource.getInstance().openSession(true);
   GoodsMapper mapper = session.getMapper(GoodsMapper.class);
   
   //개인상품 리스트
   public List<Goods> privateProductList(){
	   return mapper.privateProductList();
   }


}

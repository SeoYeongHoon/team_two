package dongwon.WishList;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;

public class WishListServiceImpl implements WishListService {
	//로직을 최종적으로 구현해주는 구현클래스.
	//Control에서 사용했다. DB에서 쿼리문 실행 후 결과 가져오는 일을 결국 얘가 한다.
	
	//sql에 접근하기 위해 세션을 열고, 자동 커밋모드를 설정하는 코드.
	SqlSession session = DataSource.getInstance().openSession(true);
	
	//session 객체의 메소드로, ()안에 해당하는 Mapper를 가져와 mapper 변수에 저장.
	WishListMapper mapper = session.getMapper(WishListMapper.class);
	
	//가져온 해당 mapper(WishListMapper)의 getWishList 메소드를 사용한다.
	//WishListMapper 인터페이스는 java파일이지만, MyBatis에 의해 실제로는 xml파일의 쿼리가 실행됨.
	@Override
	public List<WishGoods> getWishList(String memberId) {
		return mapper.getWishList(memberId);
	}

}

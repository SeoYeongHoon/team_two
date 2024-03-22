package dongwon.WishList;

import java.util.List;

import common.Member;

public interface WishListMapper {
	//xml파일과 연결된 매퍼 파일이자, MyBatis를 통해 service interface와 내부적으로 연결되어 있음
	//이 매퍼의 존재로 인해, 최종적으로 serviceImple이 SQL문을 사용할 수 있게 됨
	List<WishGoods> getWishList(String memberId);
}

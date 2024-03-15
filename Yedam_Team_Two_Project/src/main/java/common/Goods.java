package common;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

enum GoodsState{
	SALE, //판매중
	SOLDOUT //비판매중
}

enum RequestType{
	NONE, //요청 없음
	ADD, //상품 추가 요청 시
	MODIFY, //상품 정보 변경 요청 시
	DELETE, //상품 삭제 요청 시
}
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Goods {
	private int goodsId;
	private String name;
	private String description;
	private int price;
	private String hashtag; //해쉬태그 => 
							//하나의 문자열 타입(예시 : "#기분좋음#~~함#~~~함" 방식으로 값 저장하고,
							//필요 시, substring을 통해 #을 기준으로 문자를 각각 잘라 배열에 저장해놓고 쓰는 방식으로 쓰기!)
	private int viewCnt;
	private String image; //이미지 이름 저장하는 변수(실제 이미지 파일은 저장되는 경로가 따로 있다.) => webapp/static/img 폴더 속
	private GoodsState goodsState;//상품 상태
	private RequestType reqType; //상품에 대한 요청 상태
	private Date reqDate;
	private Date respDate;
	private int categoryId;
	private String memberId; //해당 상품을 등록했던 판매자 아이디
	private int scoreId;
}

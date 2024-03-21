package common;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

enum GoodsState {
	SALE, // 판매중
	SOLDOUT // 비판매중
}

enum RequestType {
	NONE, // 요청 없음
	ADD, // 상품 추가 요청 시
	MODIFY, // 상품 정보 변경 요청 시
	DELETE, // 상품 삭제 요청 시
}

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Goods {
	private int goodsId;
	private String name;

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public GoodsState getGoodsState() {
		return goodsState;
	}

	public void setGoodsState(GoodsState goodsState) {
		this.goodsState = goodsState;
	}

	public RequestType getReqType() {
		return reqType;
	}

	public void setReqType(RequestType reqType) {
		this.reqType = reqType;
	}

	public Date getReqDate() {
		return reqDate;
	}

	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}

	public Date getRespDate() {
		return respDate;
	}

	public void setRespDate(Date respDate) {
		this.respDate = respDate;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getScoreId() {
		return scoreId;
	}

	public void setScoreId(int scoreId) {
		this.scoreId = scoreId;
	}

	private String description;
	private int price;
	private String hashtag; // 해쉬태그 =>
							// 하나의 문자열 타입(예시 : "#기분좋음#~~함#~~~함" 방식으로 값 저장하고,
							// 필요 시, substring을 통해 #을 기준으로 문자를 각각 잘라 배열에 저장해놓고 쓰는 방식으로 쓰기!)
	private int viewCnt;
	private String image; // 이미지 이름 저장하는 변수(실제 이미지 파일은 저장되는 경로가 따로 있다.) => webapp/static/img 폴더 속
	private GoodsState goodsState;// 상품 상태
	private RequestType reqType; // 상품에 대한 요청 상태
	private Date reqDate;
	private Date respDate;
	private int categoryId;
	private String memberId; // 해당 상품을 등록했던 판매자 아이디
	private int scoreId;
}

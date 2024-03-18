package common;

import lombok.Data;

@Data
public class PageDTO {
	private int page;
	private int starPage, endPage;
	private boolean prev, next;
	
	//현재 페이지, 목록 총 개수, 한 페이징 당 보여줄 목록 개수, 보여줄 페이징 목록 묶음 개수
	public PageDTO(int _page, int _totalCnt, int boardCountInPage) {
		this.page = _page;
		
		//최대 페이징 목록 계산
		int realEnd = (int) Math.ceil(_totalCnt / boardCountInPage * 1.0);
		
		//페이징 최소/ 최대 목록 계산
		this.endPage = (int) Math.ceil(page/ 5.0) * 5;
		this.starPage = this.endPage - 4;
		
		this.endPage = this.endPage > realEnd ? realEnd : this.endPage;
		
		this.prev = this.starPage > 1;
		this.next = this.endPage < realEnd;
	}
}
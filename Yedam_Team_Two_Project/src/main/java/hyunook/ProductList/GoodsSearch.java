
package hyunook.ProductList;

import lombok.Data;

@Data
public class GoodsSearch {
	private String category;
	private String order;
	private String sl;
	private String memberId;
	private int price1;
	private int price2;
	private int page;
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public int getPrice1() {
		return price1;
	}
	public void setPrice1(int price1) {
		this.price1 = price1;
	}
	public int getPrice2() {
		return price2;
	}
	public void setPrice2(int price2) {
		this.price2 = price2;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getSl() {
	    return sl;
	}
	public void setSl(String sl) {
		this.sl = sl;
	}
	
	
}


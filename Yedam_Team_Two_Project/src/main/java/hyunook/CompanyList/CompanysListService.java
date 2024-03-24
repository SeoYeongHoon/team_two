package hyunook.CompanyList;


import java.util.List;

import common.Goods;

public interface CompanysListService {
    //개인판매 리스트

	List<Goods> companyProductList(CompanySearch search);
	int companyCnt(CompanySearch search);
	
}

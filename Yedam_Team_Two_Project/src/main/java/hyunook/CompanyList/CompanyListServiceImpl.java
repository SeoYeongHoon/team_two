package hyunook.CompanyList;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;
import common.Goods;

public class CompanyListServiceImpl implements CompanysListService {
	SqlSession session = DataSource.getInstance().openSession(true);
	CompanyMapper mapper = session.getMapper(CompanyMapper.class);

	@Override
	// 개인판매 리스트

	public List<Goods> companyProductList(CompanySearch search) {
		return mapper.companyProductList(search);
    
	}
    public int companyCnt(CompanySearch search) {
    	return mapper.companyCnt(search);
    }
	

}

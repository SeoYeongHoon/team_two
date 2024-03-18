package youhwan.Company;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;

public class CompanyServiceImpl implements CompanyService {
	
	SqlSession session = DataSource.getInstance().openSession(true);
	CompanyMapper mapper = session.getMapper(CompanyMapper.class);
	
	@Override
	public List<String> CompanyList() {
		return mapper.CompanyList();
	}
	
	
}

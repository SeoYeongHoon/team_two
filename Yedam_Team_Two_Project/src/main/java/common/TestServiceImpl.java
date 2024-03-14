package common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class TestServiceImpl implements TestService{
	
	SqlSession session = DataSource.getInstance().openSession(true); //자동 커밋
	TestMapper mapper = session.getMapper(TestMapper.class);
	
	@Override
	public List<String> showTestList() {
		return mapper.showTestList();
	}
}

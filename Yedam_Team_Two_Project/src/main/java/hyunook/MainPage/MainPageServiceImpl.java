package hyunook.MainPage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;
import common.Goods;

public class MainPageServiceImpl implements MainPageService{
	SqlSession session = DataSource.getInstance().openSession(true);
	MainPageMapper mapper = session.getMapper(MainPageMapper.class);
	
	@Override
	public List<Goods> mainPageList() {
		  System.out.println("mapper"+mapper.mainPageList());
	      return mapper.mainPageList();
	}
}

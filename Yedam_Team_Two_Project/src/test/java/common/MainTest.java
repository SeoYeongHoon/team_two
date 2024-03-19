package common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import changoh.Magazine.Magazine;
import changoh.Magazine.MagazineMapper;

public class MainTest {
	public static void main(String[] args) {
		SqlSession session = DataSource.getInstance().openSession(true); //자동 커밋
		MagazineMapper mapper = session.getMapper(MagazineMapper.class);
		
		List<Magazine> list = mapper.getMagazineList(Integer.parseInt("3"));
		list.forEach(item -> System.out.println(item.toString()));
		System.out.println(mapper.getTotalCount());
	}
}

package changoh.Magazine;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;

public class MagazineServiceImpl implements MagazineService{
	SqlSession session = DataSource.getInstance().openSession(true); //자동 커밋
	MagazineMapper mapper = session.getMapper(MagazineMapper.class);
	
	@Override
	public List<Magazine> getMagazineList(int page) {
		return mapper.getMagazineList(page);
	}
	@Override
	public Magazine getMagazine(int magazineId) {
		return mapper.getMagazine(magazineId);
	}
	@Override
	public int getTotalCount() {
		return mapper.getTotalCount();
	}
}

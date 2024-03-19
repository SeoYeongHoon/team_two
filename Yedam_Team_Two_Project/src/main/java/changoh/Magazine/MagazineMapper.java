package changoh.Magazine;

import java.util.List;

public interface MagazineMapper {
	List<Magazine> getMagazineList(int page);
	Magazine getMagazine(int magazineId);
	int getTotalCount();
}

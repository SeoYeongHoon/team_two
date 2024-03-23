package changoh.Download;

import java.util.List;

import common.Goods;
import common.Member;

public interface DownloadService {
	List<Goods> getPurchasedGoodsList(Member member);
}

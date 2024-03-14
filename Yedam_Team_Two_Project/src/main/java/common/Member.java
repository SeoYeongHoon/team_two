package common;

import lombok.AllArgsConstructor;
import lombok.Data;

enum MemberType{
	CLIENT, //고객
	SELLER, //개인 판매자
	MANAGER //관리자
}
@Data
@AllArgsConstructor
public class Member {
	private int memberId;
	private MemberType memberType;
	private String name;
	private String password;
	private String email;
	private String tel;
}

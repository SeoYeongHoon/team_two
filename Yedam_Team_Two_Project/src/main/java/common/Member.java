package common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

enum MemberType {
	CLIENT, // 고객
	SELLER, // 개인 판매자
	MANAGER // 관리자
}

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private String memberId;
	private MemberType memberType;
	private String name;
	private String password;
	private String email;
	private String tel;

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public MemberType getMemberType() {
		return memberType;
	}

	public void setMemberType(MemberType memberType) {
		this.memberType = memberType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public enum MemberType {
		CLIENT, // 고객
		SELLER, // 개인 판매자
		MANAGER // 관리자
	}
}

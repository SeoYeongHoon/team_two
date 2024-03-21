package common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private String memberId;	
	private MemberType memberType;
	private String name;
	private String password;
}

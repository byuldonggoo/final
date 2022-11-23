package com.spring.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import com.spring.domain.MemberVO;

import lombok.Getter;

@Getter
public class CustomUser extends User { 

	private static final long serialVersionUID = 1L;

	private MemberVO member;
	
	//부모 클래스의 생성자 호출해야
	public CustomUser(String username, String password, 
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public CustomUser(MemberVO vo) {

		super(vo.getUserid(), vo.getUserpw(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));//AutoVO 인스턴스는 GrantedAuthority객체로 변환해야 하므로

		this.member = vo;
	}
}

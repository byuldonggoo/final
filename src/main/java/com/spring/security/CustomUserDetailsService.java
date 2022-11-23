package com.spring.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import com.spring.domain.MemberVO;
import com.spring.mapper.MemberMapper;
import com.spring.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService { //UserDetailsService 구현(시큐리티 커스터마이징)

	@Setter(onMethod_ = { @Autowired }) //주입
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {

		log.warn("Load User By UserName : " + userName);
		
		//userName 은 userid의미
		MemberVO vo = memberMapper.read(userName); //MemberVO조회

		log.warn("쿼리적용된 MemberVO: " + vo);

		return vo == null ? null : new CustomUser(vo); //CustomerUser타입 객체로 변환해서 반환
		
	} 

}

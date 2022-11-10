package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.mapper.BoardAttachMaper;
//import com.spring.domain.Criteria;
import com.spring.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service																						
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_ =@Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private BoardAttachMaper attachMaper;

	@Transactional
	@Override
	public void register(BoardVO board) {
		log.info("register......." + board);
		//먼저 main_board에 게시물 등록
		mapper.insertSelectKey(board);
		
		if(board.getAttachList()==null|| board.getAttachList().size()<=0) {
			return;
		}
		
		board.getAttachList().forEach(attach->{
			
			//게시물 번호 세팅
			attach.setBdnum(board.getBdnum());
			//tbl_attach테이블에 데이터 추가
			attachMaper.insert(attach);
		});
	}

	@Override
	public BoardVO get(Long bdnum) {
		log.info("get......" + bdnum);
		
		return mapper.read(bdnum);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("modify.........."+board);
		return mapper.update(board)==1;
	}

	@Override
	public boolean remove(Long bdnum) {
		log.info("remove......" + bdnum);
		return mapper.delete(bdnum)==1;
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("get List with criteria: " + cri);
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	
	

	/*
	@Override
	public List<BoardVO> getList() {
		log.info("getList.........");
		return mapper.getList();
	}
	*/
	
	
	
}

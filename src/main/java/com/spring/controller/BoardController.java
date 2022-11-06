package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.domain.PageDTO;
import com.spring.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list: "+cri);
		model.addAttribute("list",service.getList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total=service.getTotal(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker",new PageDTO(cri, total));
	}
	
	@GetMapping("/register")
	public void register() {
		//입력페이지를 보여주는 역할만을 하기 때문에 별도의 처리가 필요하지 않음.
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register:" + board);
		service.register(board);
		rttr.addFlashAttribute("result",board.getBdnum());
		return "redirect:/board/list";
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bdnum")Long bdnum, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("/get or modify");
		model.addAttribute("board",service.get(bdnum));
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify" + board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result","success");
		}
		/*
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		*/
		
		return "redirect:/board/list" + cri.getListLink();
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bdnum") Long bdnum, @ModelAttribute("cri") Criteria cri ,RedirectAttributes rttr) {
		log.info("remove..." + bdnum);
		if(service.remove(bdnum)) {
			rttr.addFlashAttribute("result","success");
		}
		/*
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		*/
		return "redirect:/board/list" + cri.getListLink();
	}

}

package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.BoardVO;
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
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list",service.getList());
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
	public void get(@RequestParam("bdnum")Long bdnum, Model model) {
		
		log.info("/get or modify");
		model.addAttribute("board",service.get(bdnum));
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		log.info("modify" + board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bdnum") Long bdnum, RedirectAttributes rttr) {
		log.info("remove..." + bdnum);
		if(service.remove(bdnum)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/board/list";
	}

}

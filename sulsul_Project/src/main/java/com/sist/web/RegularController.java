package com.sist.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.RegularDAO;
import com.sist.vo.RegularBoardVO;
import com.sist.vo.RegularVO;

@Controller
public class RegularController {
	@Autowired
	private RegularDAO dao;

	// regular 메인페이지 - 정기모임 리스트 ////////////
	@GetMapping("regular/regular.do")
	public String regular_list(Model model) {
		List<RegularVO> rList = dao.regularListData();
		model.addAttribute("rList", rList);

		return "regular/regular";
	}

	// regular 정기모임 생성 ////////////
	@GetMapping("regular/insert.do")
	public String insert() {
		return "regular/insert";
	}

	
	  // regular 정기모임 디테일 ////////////
	  @GetMapping("regular/detail.do") public String detail(Model model, int no) {
	  RegularVO vo = dao.regularDetailData(no); model.addAttribute("vo", vo);
	  return "regular/detail"; }
	 
//	// regular 정기모임 글쓰기 ////////////
//	@PostMapping("regular/insert_ok.do")
//	public String regular_insert_ok(RegularBoardVO vo) {
//		System.out.println("인서트오케이");
//		List<MultipartFile> list = vo.getFiles();
//		if(list==null) { //업로드 안된상태
//			vo.setFilename("");
//			vo.setFilesize("");
//			vo.setFilecount(0);
//		}else { // 업로드가 된상태
//			String fn = "";
//			String fs = "";
//			for(MultipartFile mf:list) {
//				String of = mf.getOriginalFilename();
//				fn+=of+","; // 데이터베이스 첨부
//				File file = new File("c:\\download\\"+of);//업로드
//				fs+=mf.getSize()+",";
//				try {
//					mf.transferTo(file);
//				}catch(Exception e) {}
//			}
//			vo.setFilename(fn.substring(0,fn.lastIndexOf(","))); // 마지막에 있는 "," 지우기 위해 쓴것
//			vo.setFilesize(fs.substring(0,fs.lastIndexOf(",")));
//			vo.setFilecount(list.size());
//		}
//		System.out.println("vo.content:"+vo.getContent());
//		System.out.println("vo.getFilename:"+vo.getFilename());
//		System.out.println("vo.getFilesize:"+vo.getFilesize());
//		System.out.println("vo.getFilecount:"+vo.getFilecount());
//		dao.regularBoardInsert(vo);
//		return "redirect:detail.do?no="+vo.getRno();
//	}



}

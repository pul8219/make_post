package se.dku.simple;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.apache.log4j.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import se.dku.simple.service.PostService;
import se.dku.simple.vo.Post;

//session -> 로그인 만들 때 활용하기

/**
 * [참고자료]
 * http://sosohantalk.tistory.com/9 
 * http://iotsw.tistory.com/65
 * 
 * [Controller의 반환 타입별 특징]
 * - ModelAndView: Model과 View의 정보를 담아서 리턴.
 * - String: View에 대한 정보를 담아서 리턴. Model에 대한 정보 리턴시 "@ModelAttribute" 어노테이션 사용.
 * - void: View에 대한 정보가 자동으로 추출되어 리턴. Model에 대한 정보 리턴시 "@ModelAttribute" 어노테이션 사용.
 * 
 */

@Controller
public class HomeController{
	
	@Resource(name = "postService")
	private PostService service;
	
	//로그를 달 경우 사용하는 변수
	private static final Logger logger = Logger.getLogger(HomeController.class);
	

	
	/**
	 * 게시물 리스트 페이지 (모든 게시물의 정보를 보여달라는 요청)
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/index")
	public String index(Model model, HttpSession session) throws Exception{
		model.addAttribute("postList", service.selectAll()); // 쿼리문으로 받아온 모든 게시물의 정보를 postList에 넣는다.
		return "index"; // 데이터를 담은 index.jsp 페이지를 뿌려준다.
	}
	
	/**
	 * 게시물 작성 페이지 (게시물 작성 페이지를 달라는 요청)
	 */
	@RequestMapping(value="/writePostForm")
	public void writePostForm(){
	}
	
	/**
	 * 게시물 작성 페이지 (작성한 게시물 등록 처리를 해달라는 요청)
	 * @param params
	 * @return
	 */
	@RequestMapping(value="/writePost") // writePost form action을 받아온 것
	public String writePost(@RequestParam HashMap<String, Object> params){
		// 파라미터로 전달받은 게시물 정보 데이터를 등록한다.
		service.writePost(params);
		return "redirect:index"; // 작성된 게시물 등록 후 index 페이지로 리다이렉트한다.
	}
	
	/**
	 * 게시물 조회 페이지 (게시물 조회 페이지를 달라는 요청)
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/viewPost", method=RequestMethod.GET)
	public String viewPost(@RequestParam HashMap<String, Object> params, Model model, HttpSession session) throws Exception{
		String idx = params.get("idx").toString();
		logger.debug(idx); // idx가 파라미터로 잘 넘어오는지 확인하기 위한 로그
		
		//HashMap<String, Object> viewPostList = service.getPostInfo(idx);
		//logger.debug(viewPostList); // idx에 해당하는 데이터가 잘 넘어오는지 확인 -> 잘 넘어옴
		
		model.addAllAttributes(service.getPostInfo(idx)); // idx에 해당하는 게시물 정보를 가져온다.
		return "viewPost"; // 데이터를 담은 viewPost.jsp 화면을 뿌려준다.	
	}
	
	/**
	 * 게시물 수정 페이지 (게시물 수정 페이지를 달라는 요청)
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editPostForm", method=RequestMethod.GET)
	public String editPostForm(@RequestParam HashMap<String, Object> params, Model model, HttpSession session) throws Exception{
		String idx = params.get("idx").toString(); // 파라미터로 넘겨진 idx의 값을 params에 넣고 문자열로 바꾸어 idx에 저장
		model.addAllAttributes(service.getPostInfo(idx)); // idx에 해당하는 게시물 정보를 가져온다.
		return "editPostForm"; // 데이터를 담은 editPostForm.jsp 화면을 뿌려준다.
	}
	
	/**
	 * 게시물 수정 페이지 (게시물의 수정을 처리해달라는 요청)
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editPost", method=RequestMethod.POST)
	public String editPost(@RequestParam HashMap<String, Object> params, HttpSession session) throws Exception{
		// 입력된 수정 내용을 HashMap 파라미터로 받는다.
		
		String idx = params.get("idx").toString();
		
		service.updatePost(params); // 전달 받은 게시물 정보 데이터를 업데이트한다.
		return "redirect:viewPost?idx="+idx; // get방식으로 idx를 전달하면서, viewPost.jsp 페이지로 리다이렉트한다.
	}
	
	
	/**
	 * 게시물 삭제 페이지 (게시물을 삭제 처리해달라는 요청)
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deletePost")
	public String deletePost(@RequestParam HashMap<String, Object> params, HttpSession session) throws Exception{
		// 삭제할 게시물의 idx를 파라미터로 받는다.
		
		String idx = params.get("idx").toString();
		
		service.deletePost(idx); // idx를 파라미터로 넘겨주어 해당 게시물을 삭제하는 서비스를 요청한다.	
		return "redirect:index";
	}
	

}
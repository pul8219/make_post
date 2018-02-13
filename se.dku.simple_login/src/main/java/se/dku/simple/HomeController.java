package se.dku.simple;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import se.dku.simple.service.MemberService;
import se.dku.simple.vo.Member;

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
public class HomeController {

	@Resource(name = "memberService")
	private MemberService service;

	// 로그를 달 경우 사용하는 변수
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * 로그인 페이지 (로그인 처리를 해달라는 요청)
	 * @param session
	 * @param id
	 * @param pwd
	 * @return
	 */
	@RequestMapping(value="/login")
	public ModelAndView login(HttpSession session, String id, String pwd) {
		ModelAndView mav = new ModelAndView();
		
		if (service.login(id, pwd)) {
			// 로그인 성공시, main페이지로 리다이렉트하고, 세션을 설정한다.
			session.setAttribute("userid", id);
			mav.setViewName("redirect:main");
		} else {
			// 로그인 실패 시, 로그인 페이지로 리다이렉트 한다.
			mav.setViewName("redirect:loginForm");
		}
		return mav;

	}
	
	/** 
	 * 로그인 페이지 (로그인 페이지를 달라는 요청)
	 * @return
	 */
	@RequestMapping(value="/loginForm")
	public String loginForm() {
		return "loginForm";
	}
	
	/** 
	 * 메인 페이지 (메인 페이지를 달라는 요청)
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/main")
	public String main(Model model, HttpSession session) throws Exception {
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			// 세션 정보를 잃은 경우, 로그인 페이지로 리다이렉트 한다.
			return "redirect:loginForm";
		}
		else {
			// 세션 정보가 유지되는 경우, 해당 사용자에 대한 정보를 보여준다.
			model.addAllAttributes(service.getMemberInfo(userid));
			return "main";
		}

	}

	/**
	 * 회원 가입 페이지 (회원 가입 처리를 해달라는 요청)
	 * @param params
	 * @return
	 */
	@RequestMapping(value="/join")
	public String join(@RequestParam HashMap<String, Object> params) {
		// 파라미터로 전달받은 회원 정보 데이터를 등록한다.  
		service.registerMember(params);
		return "redirect:loginForm";
	}
	
	/** 
	 * 회원 가입 페이지 (회원 가입 페이지를 달라는 요청)
	 */
	@RequestMapping(value="/joinForm")
	public void joinForm() {
	}

	/**
	 * 회원 정보 조회 페이지 (모든 회원의 정보를 보여주는 페이지를 달라는 요청)
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/memberList")
	public String memberList(Model model, HttpSession session) throws Exception {
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			// 세션 정보를 잃은 경우, 로그인 페이지로 리다이렉트 한다.
			return "redirect:loginForm";
		}
		else {
			// 세션 정보가 유지되는 경우, 모든 사용자의 정보를 보여준다.
			model.addAttribute("memberList", service.selectAll());
			return "memberList";
		}

	}
	
	/**
	 * 회원 정보 수정 페이지 (회원 정보 수정 처리를 해달라는 요청)
	 * @param params
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/memberUpdate")
	public String memberUpdate(@RequestParam HashMap<String, Object> params) throws Exception {
		
		HashMap<String, Object> memberInfo = new HashMap<String, Object>();
		memberInfo.put("userid", params.get("userid"));
		memberInfo.put("name", params.get("name"));
		memberInfo.put("email", params.get("email"));
		memberInfo.put("pwd", params.get("pwd"));
		
		// 뷰로부터 전달(파라미터를 이용함)받은 회원 정보 데이터를 업데이트한다.  
		service.updateMemberInfo(memberInfo);
		return "redirect:main";
	}

	/**
	 * 회원정보 수정 페이지 (회원 정보 수정 페이지를 달라는 요청)
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/memberUpdateForm")
	public String memberUpdateForm(Model model, HttpSession session) throws Exception {
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			// 세션 정보를 잃은 경우, 로그인 페이지로 리다이렉트 한다.
			return "redirect:loginForm";
		}
		// 세션 정보가 유지되는 경우, 해당 회원의 정보를 뷰에 넘겨준다. 
		model.addAllAttributes(service.getMemberInfo(userid));
		return "memberUpdateForm";
	}

	/**
	 * 회원 탈퇴 페이지 (회원 탈퇴 처리를 해달라는 요청)
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/memberDelete")
	public String memberDelete(HttpSession session) throws Exception {
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			// 세션 정보를 잃은 경우, 로그인 페이지로 리다이렉트 한다.
			return "redirect:loginForm";
		}
		// 회원 탈퇴한 이후, 로그인 페이지로 리다이렉트 한다.
		service.deleteMember(userid);
		return "redirect:loginForm";
	}
	
	/**
	 * 로그아웃 (로그아웃을 해달라는 요청)
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		// 로그아웃 할 경우, 세션 정보를 상실하게 한다.
		session.removeAttribute("userid");
		return "redirect:loginForm";

	}

}

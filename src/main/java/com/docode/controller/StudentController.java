/**
 * Copyright (c) ${year}, FandaSoft and/or its affiliates. All rights reserved.
 * FandaSoft PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */
package com.docode.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.docode.bean.Student;
import com.docode.service.IStudentService;

/**
 * @Title:StudentController
 * @Description: 控制器
 * @Copyright:Copyright (c) 2013
 * @Date:2013-3-11
 * @author lik
 * @version 1.0
 */
@Controller
public class StudentController {

	@Resource
	private IStudentService studentService;

	/**
	 * @Title: login
	 * @Description: 登录界面显示
	 * @return String 返回类型
	 * @throws
	 */
	@RequestMapping(value = "/index")
	public String index() {
		return "login";
	}

	/**
	 * @Title: login
	 * @Description: 登录控制器
	 * @Date: 2013-8-16 下午12:37:10
	 * @author: kael
	 * @return: void 返回类型
	 * @throws:
	 */
	@RequestMapping(value = "/login")
	public void login(HttpServletResponse response, HttpServletRequest request, HttpSession httpSession) {
		try {
			response.setContentType("application/json;charset=utf-8");
			String username = request.getParameter("username");
			String pwd = request.getParameter("pwd");
			Student student = new Student();
			student.setName(username);
			Student stu = studentService.getStudent(student);
			if (null == stu) {
				// no user
				response.getWriter().print("{\"result\":\"no_user\"}");
			} else {
				if (pwd.equals(stu.getPwd())) {
					httpSession.setAttribute("currentUser", stu);
					response.getWriter().print("{\"result\":\"ok\"}");
				} else {
					response.getWriter().print("{\"result\":\"error_pwd\"}");
				}
			}
		} catch (Exception e) {
			try {
				response.getWriter().print("{\"result\":\"error\"}");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}

	/**
	 * @Title: studentlist
	 * @Description: 学生列表控制器
	 * @Date: 2013-8-16 下午12:37:23
	 * @author: kael
	 * @return: String 返回类型
	 * @throws:
	 */
	@RequestMapping(value = "/studentlist")
	public String studentlist(HttpServletResponse response, HttpServletRequest request, HttpSession httpSession) {
		Student student = (Student) httpSession.getAttribute("currentUser");
		if (null == student) {
			// session timeout
			return "redirect:/index?timeout=true";
		} else {
			if ("0".equals(student.getIsadmin())) {
				// no admin
				return "welcome";
			} else {
				List<Student> list = studentService.getStudentList(new HashMap<String, Object>());
				httpSession.setAttribute("stuList", list);
				return "studentlist";
			}
		}
	}

	/**
	 * @Title: add
	 * @Description: 添加学生界面显示
	 * @Date: 2013-8-16 下午12:37:34
	 * @author: kael
	 * @return: String 返回类型
	 * @throws:
	 */
	@RequestMapping(value = "/add")
	public String add() {
		return "add";
	}

	/**
	 * @Title: addStudent
	 * @Description: 添加学生信息
	 * @Date: 2013-8-16 下午12:39:18
	 * @author: kael
	 * @return: String 返回类型
	 * @throws:
	 */
	@RequestMapping(value = "addStudent")
	@ResponseBody
	public String addStudent(Student student, HttpServletResponse response) {
		String result = "";
		try {
			int flag = studentService.insertStudent(student);
			if (flag == 1) {
				result = "yes";
			} else {
				result = "no";
			}
		} catch (Exception e) {
			result = "error";
		}
		return result;
	}

	/**
	 * @Title: edit
	 * @Description: 根据id获取单个学生信息返回编辑界面
	 * @Date: 2013-8-16 下午12:38:16
	 * @author: kael
	 * @return: String 返回类型
	 * @throws:
	 */
	@RequestMapping(value = "/edit")
	public String edit(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		int id = Integer.parseInt(request.getParameter("stuid"));
		Student student = new Student();
		student.setId(id);
		Student stu = studentService.getStudent(student);
		session.setAttribute("student", stu);
		return "edit";
	}

	/**
	 * @Title: editStudent
	 * @Description: 编辑学生信息
	 * @Date: 2013-8-16 下午12:39:29
	 * @author: kael
	 * @return: String 返回类型
	 * @throws:
	 */
	@RequestMapping(value = "editStudent")
	@Transactional(rollbackFor = Exception.class)
	@ResponseBody
	public String editStudent(Student student, HttpServletResponse response) {
		String result = "";
		try {
			int flag = studentService.updateStudent(student);
			int i = 1 / 0;
			if (flag == 1) {
				result = "yes";
			} else {
				result = "no";
			}
		} catch (Exception e) {
			result = "error";
		}
		return result;
	}

	/**
	 * @Title: del
	 * @Description: 根据id删除学生
	 * @Date: 2013-8-16 下午12:39:06
	 * @author: kael
	 * @return: void 返回类型
	 * @throws:
	 */
	@RequestMapping(value = "/del")
	@Transactional
	public void del(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setContentType("application/json;charset=utf-8");
			int id = Integer.parseInt(request.getParameter("stuid"));
			int flag = studentService.deleteById(id);
			if (flag == 1) {
				response.getWriter().print("{\"result\":\"ok\"}");
			} else {
				response.getWriter().print("{\"result\":\"error\"}");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @Title: search
	 * @Description: 根据姓名和地址搜索控制器
	 * @Date: 2013-8-16 下午12:37:55
	 * @author: kael
	 * @return: String 返回类型
	 * @throws:
	 */
	@RequestMapping(value = "/search")
	public String search(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String key = request.getParameter("key");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("key", key);
		List<Student> stuList = studentService.getStudentList(map);
		session.setAttribute("stuList", stuList);
		return "studentlist";
	}

	/**
	 * @Title: logout
	 * @Description: 安全退出
	 * @Date: 2013-8-16 下午12:39:39
	 * @author: kael
	 * @return: String 返回类型
	 * @throws:
	 */
	@RequestMapping(value = "/logout")
	public String logout(HttpSession httpSession) {
		Student student = (Student) httpSession.getAttribute("currentUser");
		if (null != student) {
			httpSession.removeAttribute("currentUser");
		}
		return "redirect:/index";
	}

}

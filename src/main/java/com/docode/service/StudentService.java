/**
 * Copyright (c) 2013, Dream-Fly and/or its affiliates. All rights reserved.
 * Dream-Fly PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */
package com.docode.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.docode.bean.Student;
import com.docode.dao.StudentMapper;

@Service
public class StudentService implements IStudentService {

	@Resource
	private StudentMapper studentMapper;

	public List<Student> getStudentList(Map<String, Object> map) {
		return studentMapper.getStudentList(map);
	}

	public Student getStudent(Student student) {
		return studentMapper.getStudent(student);
	}

	public int insertStudent(Student student) {
		return studentMapper.insertStudent(student);
	}

	public int updateStudent(Student student) {
		return studentMapper.updateStudent(student);
	}

	public int deleteById(int id) {
		return studentMapper.deleteById(id);
	}

}

/**
 * Copyright (c) 2013, Dream-Fly and/or its affiliates. All rights reserved.
 * Dream-Fly PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */
package com.docode.dao;

import java.util.List;
import java.util.Map;

import com.docode.bean.Student;

public interface StudentMapper {

	public List<Student> getStudentList(Map<String, Object> map);

	public Student getStudent(Student student);

	public int insertStudent(Student student);

	public int updateStudent(Student student);

	public int deleteById(int id);

}

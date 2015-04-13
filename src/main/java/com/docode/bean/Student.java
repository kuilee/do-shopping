package com.docode.bean;

/**
 * Copyright (c) 2013, Dream-Fly and/or its affiliates. All rights reserved.
 * Dream-Fly PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */

import java.io.Serializable;

public class Student implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7470729700406989112L;

	private int id;
	private String name;
	private String pwd;
	private int age;
	private String address;
	private String isadmin;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getIsadmin() {
		return isadmin;
	}

	public void setIsadmin(String isadmin) {
		this.isadmin = isadmin;
	}

}

package com.go.client.main.model;

import org.apache.ibatis.type.Alias;

/**
 * 门户信息实体类
 * @author chenhb
 */
@Alias("Go_Portal_Info")
public class Go_Portal_Info {
	private Integer id ;		//id主键
	private Integer departmentid;	//部门ID
	private String surname;		//姓
	private String name;	//名
	private String companyname;	//公司名称
	private String email;	//邮件地址
	private String addressone;	//地址1
	private String addresstwo;	//地址2
	private String city;	//城市
	private String downtown;	//州/区
	private String zip;	//邮编
	private String telephone;	//电话号码
	private String password;	//密码
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getDepartmentid() {
		return departmentid;
	}
	public void setDepartmentid(Integer departmentid) {
		this.departmentid = departmentid;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddressone() {
		return addressone;
	}
	public void setAddressone(String addressone) {
		this.addressone = addressone;
	}
	public String getAddresstwo() {
		return addresstwo;
	}
	public void setAddresstwo(String addresstwo) {
		this.addresstwo = addresstwo;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDowntown() {
		return downtown;
	}
	public void setDowntown(String downtown) {
		this.downtown = downtown;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}

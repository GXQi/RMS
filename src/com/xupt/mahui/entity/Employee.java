package com.xupt.mahui.entity;
/**
 * 员工实体
 * @author mahui
 *
 */
public class Employee {
	/**
	 * 登录手机号
	 */
	private String phoneNumber;
	/**
	 * 登录密码
	 */
	private String passWord;
	/**
	 * 用户昵称
	 */
	private String nickName;
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
}

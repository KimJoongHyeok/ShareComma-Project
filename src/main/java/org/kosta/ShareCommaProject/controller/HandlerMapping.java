package org.kosta.ShareCommaProject.controller;

public class HandlerMapping {
	private static HandlerMapping instance=new HandlerMapping();
	private HandlerMapping() {}
	public static HandlerMapping getInstance() {
		return instance;
	}
	public Controller create(String command) throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		//Reflection API를 이용해 런타임시에 동적으로 컨트롤러 객체를 생성 
		String packageInfo=this.getClass().getPackage().getName();
		String classInfo=new StringBuilder(packageInfo).append(".").append(command).toString();
		return (Controller)Class.forName(classInfo).newInstance();
	}
}

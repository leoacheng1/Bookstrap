package com.bookstrap.harry.security;

import org.springframework.beans.factory.annotation.Autowired;

public class PasswordEncrypt {

	

	String pa1 = "abc123";
	String pa2 = "def456";
	String pa3 = "ghi789";
	String pa4 = "jkl123";
	String pa5 = "123abc";
	String pa6 = "456def";
	String pa7 = "789ghi";
	String pa8 = "123jkl";

	public  void doEn() {
		String npa1 = CipherUtils.getStringSHA512(pa1);
		String npa2 = CipherUtils.getStringSHA512(pa2);
		String npa3 = CipherUtils.getStringSHA512(pa3);
		String npa4 = CipherUtils.getStringSHA512(pa4);
		String npa5 = CipherUtils.getStringSHA512(pa5);
		String npa6 = CipherUtils.getStringSHA512(pa6);
		String npa7 = CipherUtils.getStringSHA512(pa7);
		String npa8 = CipherUtils.getStringSHA512(pa8);
		
	System.out.println("1:" + npa1);
	System.out.println("2:" + npa2);
	System.out.println("3:" + npa3);
	System.out.println("4:" + npa4);
	System.out.println("5:" + npa5);
	System.out.println("6:" + npa6);
	System.out.println("7:" + npa7);
	System.out.println("8:" + npa8);
	
	}
	public static void main(String[] args) {
		PasswordEncrypt passwordEncrypt = new PasswordEncrypt();
		passwordEncrypt.doEn();
	}
	
}

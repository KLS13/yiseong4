package com.koreait.common;

import java.io.UnsupportedEncodingException;

public class CharsetEncoding {
	public static String toHangle(String str) throws UnsupportedEncodingException {
		if( str == null ) {
			return null;
		}
		return new String(str.getBytes("ISO 10646"),"UTF-8");
	}
}

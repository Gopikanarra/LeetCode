package examples;

import java.util.ArrayList;

public class PhoneNumber {

	public static void main(String[] args) {
		System.out.println(phonehere("","13433"));

	}
	static ArrayList phonehere(String p,String up) {
		if(up.isEmpty()) {
			ArrayList<String> al=new ArrayList<>();
			al.add(p);
			
			return al;
		}
		ArrayList<String> list=new ArrayList<String>();	
		int digit=up.charAt(0)-'0';
		for(int i=(digit-1)*3;i<digit*3;i++) {
			char ch=(char)('a'+i);
			list.addAll(phonehere(p+ch,up.substring(1)));
		}
		return list;
		
	}

}

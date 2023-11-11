package examples;

import java.util.ArrayList;
import java.util.Arrays;

public class PermutationsRecurse {

	public static void main(String[] args) {
		permu("","abc");
		System.out.println(permuArray("","abs"));
		System.out.println(permuCount("","abcd"));

	}
	static void permu(String p,String up) {
		if(up.isEmpty()) {
			System.out.println(p);
			return ;
			
		}
		char ch=up.charAt(0);
		for(int i=0;i<=p.length();i++) {
			String first=p.substring(0,i);
			String second=p.substring(i,p.length());
			permu(first+ch+second,up.substring(1));
			
		}
	}
	static ArrayList<String> permuArray(String p,String up) {
		ArrayList<String> list=new ArrayList<String>();
		if(up.isEmpty()) {
			list.add(p);
			return list;
			
		}
		char ch=up.charAt(0);
		ArrayList<String> al=new ArrayList<String>();
		for(int i=0;i<=p.length();i++) {
			String first=p.substring(0,i);
			String second=p.substring(i,p.length());
			al.addAll(permuArray(first+ch+second,up.substring(1)));
			
		}
		return al;
	}
	static int permuCount(String p,String up) {
		
		if(up.isEmpty()) {
			System.out.println(p);
			return 1;
			
		}
		int count=0;
		char ch=up.charAt(0);
		for(int i=0;i<=p.length();i++) {
			String first=p.substring(0,i);
			String second=p.substring(i,p.length());
			count=count+permuCount(first+ch+second,up.substring(1));
			
		}
		return count;
	}

}

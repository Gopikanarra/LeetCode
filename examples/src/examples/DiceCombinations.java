package examples;

import java.util.ArrayList;

public class DiceCombinations {
	public static void main(String [] args) {
		System.out.println(comb("",4));
	}
	static ArrayList<String> comb(String s,int num) {
		if(num==0) {
			ArrayList<String> al=new ArrayList<String>();
			al.add(s);
			System.out.println(s);
			return al;
		}
		ArrayList<String> list=new ArrayList<String>();
		for(int i=1;i<6&&i<=num;i++) {
			list.addAll(comb(s+i,num-i)); 
		}
		return list;
	}
}

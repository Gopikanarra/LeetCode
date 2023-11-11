package examples;

import java.util.ArrayList;
import java.util.Arrays;

public class SubStrings {

	public static void main(String[] args) {
		sequence("abc","");
		System.out.println(sequencearray("abc",""));
		System.out.println(sequenceAscii("abcd",""));
		
		
	}
	static void  sequence(String fs,String ls) {
		if(fs.isEmpty()) {
			System.out.println(ls);
			return;
		}
		else {
			sequence(fs.substring(1),ls);
			sequence(fs.substring(1),ls+fs.charAt(0));
			sequence(fs.substring(1),ls+(fs.charAt(0)+0));
			 
			 
		}
	}
	static ArrayList<String> sequencearray(String s1,String s2) {
		ArrayList<String> list=new ArrayList<String>();
		if(s1.isEmpty()) {
			list.add(s2);
			return list;
		}
		ArrayList<String> left=sequencearray(s1.substring(1),s2+s1.charAt(0));
		ArrayList<String> right=sequencearray(s1.substring(1),s2);
		
		left.addAll(right);
		return left;
	}
	static ArrayList<String> sequenceAscii(String s1,String s2){
		ArrayList<String> list=new ArrayList<String>();
		if(s1.isEmpty()) {
			list.add(s2);
			return list;
		}
		ArrayList<String> left=sequenceAscii(s1.substring(1),s2+(s1.charAt(0)+0));
		ArrayList<String> right=sequenceAscii(s1.substring(1),s2);
		left.addAll(right);
		return left;
	}

}

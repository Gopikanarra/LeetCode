package examples;

public class SubsetsRecurse {
	public static void main(String[] args) {
		String s="goopikaaawewe";
		subrecursing(s,"");
		System.out.println(recurse(s));
		System.out.println(substringhere("appledemoappleheresunny"));
		System.out.println(substringapp("appledemoapplehereappsunny"));
	}
	static void subrecursing(String f,String l) {
		if(f.isEmpty()) {
			System.out.println(l);
			return ;
		}
		char ch=f.charAt(0);
		if(ch=='a') {
			subrecursing(f.substring(1),l);
		}else {
			subrecursing(f.substring(1),l+ch);
		}
	}
	static String recurse(String s) {
		
		if(s.isEmpty()) {
			return "";
		}
		char ch=s.charAt(0);
		if(ch=='a') {
			
			return recurse(s.substring(1));
		}
		else {
			
			return ch+recurse(s.substring(1));
		}
	}
	static String substringhere(String s) {
		if(s.isEmpty()) {
			return "";
		}
		if(s.startsWith("apple")) {
			return substringhere(s.substring(5));
		}
		else {
			return s.charAt(0)+substringhere(s.substring(1));
		}
	}
	static String substringapp(String s) {
		if(s.isEmpty()) {
			return "";
		}
		if(s.startsWith("app") && !s.startsWith("apple")) {
			return substringhere(s.substring(3));
		}
		else {
			return s.charAt(0)+substringhere(s.substring(1));
		}
	}
}

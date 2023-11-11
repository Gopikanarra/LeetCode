package examples;

public class PalindromeDemo {
	public static void main(String [] args) {
		String s1="java";
		String reverse="";
		boolean flag=false;
		int n=s1.length()-1;
		for(int i=0;i<s1.length();i++) {
			reverse=reverse+s1.charAt(i);
		}
		for(int i=0;i<reverse.length();i++) {
			System.out.println(reverse.charAt(i));
		}
		for(int i=0;i<s1.length();i++) {
			if(s1.charAt(i)!=(reverse.charAt(n-i))) {
				flag=false;
			}
			else {
				flag=true;
			}
		}
		if(flag==true) {
			System.out.println("Palindrome");
		}
		else {
			System.out.println("Not Palindrome");
		}
	}
}
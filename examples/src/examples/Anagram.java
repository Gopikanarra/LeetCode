package examples;

public class Anagram {

	public static void main(String[] args) {
		String s1="gopika";
		String s2="kapigo";
		if(s1.length()!=s2.length()) {
			System.out.println("sry :D");
			System.exit(1);
		}
		char [] c1=sort(s1.toCharArray());
		char [] c2=sort(s2.toCharArray());
		
		for(int i=0;i<c1.length;i++) {
			if(c1[i]!=c2[i]) {
				System.out.println("Not Anagrams");
				System.exit(1);
			}
			
		}
		System.out.println("Anagrams");
		
	}	
	
	public static char[] sort(char[] cs) {
		char temp='\0';
		for(int i=0;i<cs.length;i++) {
			for(int j=0;j<cs.length-1;j++) {
				if(cs[i]<cs[j]) {
					temp=cs[i];
					cs[i]=cs[j];
					cs[j]=temp;
				}
			}
		}
		return cs;
		
	}

}

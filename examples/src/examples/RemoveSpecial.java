package examples;

import java.util.Scanner;

public class RemoveSpecial {

	public static void main(String[] args) {
//		char [] c= {'!','@','#','$','^','&','*','(',')','_','-','+','{','}','<','>','?','/','"',':',';','|',',','.'};
//		String s="!@#$%^7z*()_-><:;/.>S";
//		String demo="";
//		for(int i=0;i<c.length;i++) {
//			System.out.println("c[i]="+c[i]);
//			for(int j=0;j<s.length();j++) {
//				System.out.println(c[i]!=s.charAt(j));
//				if(c[i]==s.charAt(j)) {
//					demo=demo+s.charAt(j);
//				}
//				
//				
//			}
//			
//				
//			
//		}
//		System.out.println(demo.length());
		Scanner scan = new Scanner(System.in);
		String s = scan.nextLine();
        s = s.replaceAll("[!?#$>&<{},%^*()-._\\s'@]+","").trim();
        System.out.println(s);
        if (s.length()==0){
            System.out.println("0");
        } else{ 
        String[] Tokens = s.split(" ");
       System.out.println(Tokens.length);

    for (int i = 0; i < Tokens.length; ++i) {
      System.out.println(Tokens[i]);
    }

	}

}
}

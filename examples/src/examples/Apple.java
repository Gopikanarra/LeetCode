package examples;

import java.util.Scanner;

public class Apple {
public static void main(String [] args) {
	Scanner sc=new Scanner(System.in);
	
//	for(int i=5;i>0;i--) {
//	    for(int j=1;j<=i;j++) {
//	       System.out.print("*");
//	     
//	    }
//	    System.out.println();
//	}
//for(int i=1;i<5;i++) {
//	    	 for(int j=1;j<=i+1;j++) {
//	    		 System.out.print("*");
//	    	 }
//	    	 System.out.println();
//	    	 
//
//}
	int T=sc.nextInt();
	String ans;
	for(int i=0;i<T;i++) {
		String s = null;
		boolean found=false;
		for(int j=0;j<6;j++) {
			s+=sc.next();
		}
		char [] arr=s.toCharArray();
		for(int j=1;j<arr.length-2;j++) {
			if(arr[j]=='W' && arr[j-1]=='W' && arr[j+1]=='W') {
				 found = true;
				break;
			}	
		}
		if(found==true) 
			System.out.println("YES");
		else
			System.out.println("NO");
	}
	}
}

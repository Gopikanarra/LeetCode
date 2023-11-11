package examples;

import java.io.*;
import java.util.*;

import java.util.Scanner;

public class StringDemo {

    public static String getSmallestAndLargest(String s, int k) {
        String smallest = "";
        String largest = "";
        String temp="";
//        String [] list=new String[s.length()];
//        int i=0;
        
//        while(k<(s.length()-1)){
//            list[i]=s.substring(i,k);
//            i++;
//            k++;
//        }
        
        String[] list = new String [s.length()+1-k];
        for (int i = 0; k + i <= s.length(); i++) {
            list[i] = s.substring(i,k+i);
        }
        
        
//        for(int j=0;j<list.length;j++){
//            for(int q=0;q<list.length-1;q++){
//                if(list[q].compareTo(list[q+1])>0){
//                    temp=list[q];
//                    list[q]=list[q+1];
//                    list[q+1]=temp;
//                }
//            }
//        }
        
        
        smallest = list[0];
        for (String items : list){
            if (smallest.compareTo(items) > 0){
                smallest = items;
            }
        }
        
        largest = list[0];
        for (String items : list){
            if (largest.compareTo(items) < 0){
                largest = items;
            }
        
        
        
//        smallest=list[0];
//        largest=list[list.length-1];
       
    }
        return smallest + "\n" + largest;
    }
    public static void main(String[] args) {
    	String s="sandhya";
    	System.out.println(getSmallestAndLargest(s,3));
    	
    	
    	
    }
}
    
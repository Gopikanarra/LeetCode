package Sortings;

import java.util.Arrays;

public class QuickSortzdemo {

	public static void main(String[] args) {
		int arr[]= {2,3,88,0,43,-9};
		quickHere(arr,0,arr.length-1);
		
		System.out.println(Arrays.toString(arr));

	}
	static void quickHere(int arr[],int start,int end) {
		if(start>=end) {
			return;
		}
		int s=start;
		int e=end;
		int pvt=arr[s+(e-s)/2];
		while(s<=e) 
		{
		while(arr[s]<pvt) {
			s++;
		}
		while(arr[e]>pvt) {
			e--;
		}
		if(s<=e) {
			int temp=arr[s];
			arr[s]=arr[e];
			arr[e]=temp;
			s++;
			e--;
	}
	}
		quickHere(arr,start,e);
		quickHere(arr,s,end);
}	
}

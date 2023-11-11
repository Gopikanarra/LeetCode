package Sortings;

import java.util.Arrays;

public class BubbleSortDemo {

	public static void main(String[] args) {
		int arr[]= {34,9,0,-3,11};
		bubble(arr,0,arr.length-1);
		System.out.println(Arrays.toString(arr));
		
	}static void bubble(int arr[],int start,int end) {
		if(end==0) {
			return;
		}
		if(start<end) {
		if(arr[start]>arr[start+1]) {
			int temp=arr[start];
			arr[start]=arr[start+1];
			arr[start+1]=temp;
		}
		bubble(arr,start+1,end);
	}
		else {
			bubble(arr,end-1,0);
		}
	}
}

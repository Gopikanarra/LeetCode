package Sortings;

import java.util.Arrays;

public class SelectionSort {

	public static void main(String[] args) {
		int arr[]= {78,0,-5,88,2,1};
		Demo(arr);
		System.out.println(Arrays.toString(arr));
	}static void Demo(int arr[]) {
		for(int i=0;i<arr.length;i++) {
			int last=arr.length-i-1;
			int max=maxi(arr,0,last);
			swapArray(arr,max,last);
			
		}
	}
	static int maxi(int arr[],int start,int end) {
		int max=start;
		for(int i=start;i<=end;i++) {
			if(arr[max]<arr[i]) {
				max=i;
			}
		}
		return max;
	}
	static void swapArray(int arr[],int index1,int index2) {
		int temp=arr[index1];
		arr[index1]=arr[index2];
		arr[index2]=temp;
		
	}

}

package Sortings;

import java.util.Arrays;

public class InsertionSortDemo {

	public static void main(String[] args) {
		int arr[]= {45,7,0,-4,22,-1};
		int temp=0;
		int j=0;
		for(int i=1;i<arr.length;i++) {
			temp=arr[i];
			j=i-1;
			while(j>=0 && arr[j]>temp) {
				arr[j+1]=arr[j];
				j--;
			}
			arr[j+1]=temp;
		}
		System.out.println(Arrays.toString(arr));
	
	}

}

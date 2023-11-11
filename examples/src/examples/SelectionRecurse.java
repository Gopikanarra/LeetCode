package examples;

import java.util.Arrays;

public class SelectionRecurse {

	public static void main(String[] args) {
		int arr[]= {12,42,107,24,-1};
		selection(arr,0,arr.length-1,0);
		System.out.println(Arrays.toString(arr));
		
		}
static void selection(int arr[],int start,int end,int max) {
	if(end==0) {
		return;
	}
	if(start<end) {
		if(arr[max]<arr[start]) {
			selection(arr,start+1,end,start);
		}
		else {
			selection(arr,start+1,end,max);
		}
	}
	else {
		int temp=arr[max];
		arr[max]=arr[end];
		arr[end]=temp;
		selection(arr,0,end-1,0);
	}

}
}

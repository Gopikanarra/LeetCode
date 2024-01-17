package Sortings;

import java.util.Arrays;

public class MergeSortDemo {

	public static void main(String[] args) {
		int arr[]= {5,78,2,0,8,4};
		int [] ans=merging(arr);
		System.out.println(Arrays.toString(ans));

	}
	static int[] merging(int arr[]) {
		if(arr.length==1) {
			return arr;
		}
		int mid=arr.length/2;
		int [] left=merging(Arrays.copyOfRange(arr, 0, mid));
		int [] right=merging(Arrays.copyOfRange(arr, mid, arr.length));
		
		return merge(left,right);		
	
	}
	static int[] merge(int left[],int right[]) {
		int total[]=new int[left.length+right.length];
		int i=0;
		int j=0;
		int k=0;
		while(i<left.length && j<right.length) {
			if(left[i]<right[j]) {
				total[k]=left[i];
				i++;
			}
			else {
				total[k]=right[j];
				j++;
			}
			k++;
		}
		while(i<left.length) {
			total[k]=left[i];;
			k++;
			i++;
			
		}
		while(j<right.length) {
			total[k]=right[j];
			k++;
			j++;
			
		}
		return total;	
		
	}

}

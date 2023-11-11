package Sortings;

public class BinarySearch {

	public static void main(String[] args) {
		int arr[]= {45,67,0,-5,11,3};
		System.out.println(binary(arr,0,arr.length-1,-5));
	}
	static int binary(int arr[],int first,int last,int target) {
		if(first<=last) {
			int mid=first+(last-first)/2;
		if(arr[mid]==target) {
			return mid;
		}
		if(arr[mid]<target) {
			return binary(arr,mid+1,last,target);
		}
		if(arr[mid]>target) {
			return binary(arr,first,mid-1,target);
		}
		}
		return -1;
	}
}
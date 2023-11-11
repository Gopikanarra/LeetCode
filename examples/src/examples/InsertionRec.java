package examples;
import java.util.ArrayList;
import java.util.List;
public class InsertionRec {
	
	static ArrayList<Integer> list=new ArrayList<>();
public static void main(String [] args) {
	int arr[]= {45,23,11,9,0,1,-1,9};
	int target=9;
	int ans=searching(arr,target,0);
	System.out.println(ans);
	System.out.println(search(arr,target,0));
	System.out.println(backsearch(arr,target,arr.length-1));
	System.out.println(ArrayDemo(arr,target,0));
	System.out.println(dynamicArray(arr,target,0));
}

static int searching(int arr[],int target,int index) {
	if(index==arr.length-1) {
		return 0;
		
	}
	if(arr[index]==target) {
		return index;
	}
	return searching(arr,target,index+1);
	
}
static boolean search(int arr[],int target,int index) {
	if(index==arr.length) {
		return false;
	}
	return(arr[index]==target || search(arr,target,index+1));
}

static int backsearch(int arr[],int target,int index) {
	if(index==-1) {
		return -1;
	}
	if(arr[index]==target) {
		return index;
	}else {
	
		return backsearch(arr,target,index-1);
	}
}
static List ArrayDemo(int arr[],int target,int index){
	if(index==arr.length) {
		return list;
	}
	if(arr[index]==target) {
		list.add(index);
	}
	return ArrayDemo(arr,target,index+1);
}

static ArrayList<Integer> dynamicArray(int arr[],int target,int index) {
	ArrayList<Integer> list=new ArrayList<Integer>();
	if(index==arr.length) {
		return list;
	}
	if(arr[index]==target) {
		list.add(index);
	}
	ArrayList<Integer> al=dynamicArray(arr,target,index+1);
	list.addAll(al);
	return list;
}





}

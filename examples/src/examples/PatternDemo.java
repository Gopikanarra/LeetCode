package examples;

public class PatternDemo {
	public static void main(String [] args) {
		triangle(4,0);
	}
	static void triangle(int r,int c) {
		if(c<r) {
			System.out.print("*");
			triangle(r,c+1);
			System.out.println("\n");
			
		}else {
			System.out.println("\n");
		triangle(r-1,0);

		}
		if(r==0) {
			triangle(r+1,0);
		}
		else {
			System.out.println();
		}
		
		
	}
}

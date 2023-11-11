package examples;

public class Recurse {
	static int revi=0;
	static int rem=0;
	public static void main(String[] args) {
		fun(12300066);
		
		System.out.println(revi);

	}
static void  fun(int n) {
	if(n%10==n) {
		return;

	}
	rem=n%10;
	revi=revi*10+rem;
	fun(n/10);
}
}

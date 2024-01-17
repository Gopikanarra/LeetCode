import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class LinearDiophantine extends JFrame {

    private JLabel label1,label2,label3;
    private JTextField textfield1,textfield2,textfield3;
    private JButton submit;
    
    public LinearDiophantine() {
    	setTitle("linear diphantine app");
    	setSize(300,500);
    	setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    	
    	label1=new JLabel("coefficient a:");
    	label2=new JLabel("coefficient b:");
    	label3=new JLabel("constant c:");
    	
    	
    	textfield1=new JTextField(10);
    	textfield2=new JTextField(10);
    	textfield3=new JTextField(10);
    	
    	submit=new JButton("submit");
    	
    	setLayout(new GridLayout(4,2));
    	
    	
    	add(label1);
    	add(textfield1);
    	add(label2);
    	add(textfield2);
    	add(label3);
    	add(textfield3);
    	
    	add(new JLabel());
    	
    	add(submit);
    	
    	submit.addActionListener(new ActionListener() {
    		@Override
    		public void actionPerformed(ActionEvent e) {
    			display_solution();
    		}
    	});
    	
    }
    
    private void display_solution() {
    	
    	try {
    		int a=Integer.parseInt(textfield1.getText());
    		int b=Integer.parseInt(textfield2.getText());
    		int c=Integer.parseInt(textfield3.getText());
    		
    		int [] result=solve_LinearDiophantine(a,b,c);
    		
    		JOptionPane.showMessageDialog(this,"Particular solution: x="+result[1]+",y="+result[2]+"\n General solution : x="+result[1]+"+"+(b/result[0])+"t,y="+result[2]+"-"+(a/result[0])+"t","Result",JOptionPane.INFORMATION_MESSAGE);
    	
    	
    	}catch(NumberFormatException e) {
    		JOptionPane.showMessageDialog(this,"Invalid input. Please enter valid integers....","Error",JOptionPane.ERROR_MESSAGE);
    	}
    	
    	
    	
    	
    }
    
    private int[] solve_LinearDiophantine(int a,int b,int c) {
    	int gcd[]=extendedGCD(a,b);
    	if(c%gcd[0]==0) {
    		int x0=gcd[1]*(c/gcd[0]);
    		int y0=gcd[2]*(c/gcd[0]);
    		return new int[] {gcd[0],x0,y0};
    	}
    	else {
    		return new int[] {1,0,0};
    	}
    }
    
    private int [] extendedGCD(int a ,int b) {
    	int s1=1,s2=0,t1=0,t2=1,s=0,t=0,r1=a,r2=b,q,r;
    	
    	while(r2!=0) {
    		q=r1/r2;
    		r=r1-q*r2;
    		r1=r2;
    		r2=r;
    		t=t1-q*t2;
    		s=s1-q*s2;
    		s1=s2;
    		s2=s;
    		t1=t2;
    		t2=t;
    	}
    	return new int[]{Math.abs(r1),s1,t1};
    }
public static void main(String [] args) {
	SwingUtilities.invokeLater(new Runnable() {
	@Override
	public void run() {
		new LinearDiophantine().setVisible(true);
	}
});
    }
    
    
    
}

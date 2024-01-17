import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;

public class MuliplicativeInverseApp extends JFrame {

    private JLabel labelNumber, labelModulus;
    private JTextField textFieldNumber, textFieldModulus, resultTextField;
    private JButton calculateButton;

    public MuliplicativeInverseApp() {
        setTitle("Multiplicative Inverse Calculator");
        setSize(300, 150);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        // Initialize components
        labelNumber = new JLabel("Enter Number:");
        labelModulus = new JLabel("Enter Modulus:");

        textFieldNumber = new JTextField(10);
        textFieldModulus = new JTextField(10);

        calculateButton = new JButton("Calculate");

        resultTextField = new JTextField(20);
        resultTextField.setEditable(false);

        // Set layout manager
        setLayout(new GridLayout(4, 2));

        // Add components to the frame
        addComponents(labelNumber, textFieldNumber);
        addComponents(labelModulus, textFieldModulus);
        add(new JLabel()); // Empty label for spacing

        // Directly add the ActionListener to the calculateButton
        calculateButton.addActionListener((e) -> {
            try {
                int number = Integer.parseInt(textFieldNumber.getText());
                int modulus = Integer.parseInt(textFieldModulus.getText());

                int inverse = calculateInverse(number, modulus);

                resultTextField.setText(inverse != -1 ? String.valueOf(inverse) : "No multiplicative inverse (not coprime)");
            } catch (NumberFormatException ex) {
                showErrorDialog("Invalid input. Please enter valid integers.");
            }
        });

        add(calculateButton);

        add(new JLabel("Multiplicative Inverse:"));
        add(resultTextField);
    }

    private void addComponents(JComponent component1, JComponent component2) {
        add(component1);
        add(component2);
    }

    private int calculateInverse(int number, int modulus) {
        ExtendedGCDResult result = extendedGCD(number, modulus);

        int inverse = result.x % modulus;
        return (inverse < 0) ? inverse + modulus : inverse;
    }
    private ExtendedGCDResult extendedGCD(int a, int b) {
        int s1 = 1, s2 = 0, t1 = 0, t2 = 1, s = 0, t = 0, r1 = a, r2 = b, q, r;

        while (r2 != 0) {
            q = r1 / r2;
            r = r1 - q * r2;
            r1 = r2;
            r2 = r;
            t = t1 - q * t2;
            s = s1 - q * s2;
            s1 = s2;
            s2 = s;
            t1 = t2;
            t2 = t;
        }

        return new ExtendedGCDResult(Math.abs(r1), s1, t1);
    }

    private void showErrorDialog(String message) {
        JOptionPane.showMessageDialog(this, message, "Error", JOptionPane.ERROR_MESSAGE);
    }

    private static class ExtendedGCDResult {
        int gcd;
        int x;
        int y;

        ExtendedGCDResult(int gcd, int x, int y) {
            this.gcd = gcd;
            this.x = x;
            this.y = y;
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new MuliplicativeInverseApp().setVisible(true));
    }
}

// TipCalculator.java
import java.util.Scanner;

public class TipCalculator {
    private static Scanner scanner = new Scanner(System.in);

    private static double getDouble(String prompt) {
        while (true) {
            System.out.print(prompt);
            if (scanner.hasNextDouble()) {
                double val = scanner.nextDouble();
                if (val >= 0) return val;
            } else {
                scanner.next(); // consume invalid token
            }
            System.out.println("Invalid input. Please enter a positive number.");
        }
    }

    private static int getInt(String prompt) {
        while (true) {
            System.out.print(prompt);
            if (scanner.hasNextInt()) {
                int val = scanner.nextInt();
                if (val > 0) return val;
            } else {
                scanner.next();
            }
            System.out.println("Invalid input. Please enter a positive integer.");
        }
    }

    public static void main(String[] args) {
        System.out.println("=== Tip Calculator ===");
        double bill = getDouble("Enter bill amount: ");
        double tipPercent = getDouble("Enter tip percentage (e.g., 15 for 15%): ");
        int people = getInt("Enter number of people: ");

        double tip = bill * (tipPercent / 100);
        double total = bill + tip;
        double tipPerPerson = tip / people;
        double totalPerPerson = total / people;

        System.out.println("\n--- Result ---");
        System.out.printf("Bill: $%.2f%n", bill);
        System.out.printf("Tip (%.0f%%): $%.2f%n", tipPercent, tip);
        System.out.printf("Total: $%.2f%n", total);
        System.out.printf("Split among %d people:%n", people);
        System.out.printf("Tip per person: $%.2f%n", tipPerPerson);
        System.out.printf("Total per person: $%.2f%n", totalPerPerson);

        scanner.close();
    }
}

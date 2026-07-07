// TipCalculator.cs
using System;

class TipCalculator
{
    static double GetDouble(string prompt)
    {
        while (true)
        {
            Console.Write(prompt);
            string input = Console.ReadLine();
            if (double.TryParse(input, out double result) && result >= 0)
                return result;
            Console.WriteLine("Invalid input. Please enter a positive number.");
        }
    }

    static int GetInt(string prompt)
    {
        while (true)
        {
            Console.Write(prompt);
            string input = Console.ReadLine();
            if (int.TryParse(input, out int result) && result > 0)
                return result;
            Console.WriteLine("Invalid input. Please enter a positive integer.");
        }
    }

    static void Main()
    {
        Console.WriteLine("=== Tip Calculator ===");
        double bill = GetDouble("Enter bill amount: ");
        double tipPercent = GetDouble("Enter tip percentage (e.g., 15 for 15%): ");
        int people = GetInt("Enter number of people: ");

        double tip = bill * (tipPercent / 100);
        double total = bill + tip;
        double tipPerPerson = tip / people;
        double totalPerPerson = total / people;

        Console.WriteLine("\n--- Result ---");
        Console.WriteLine($"Bill: ${bill:F2}");
        Console.WriteLine($"Tip ({tipPercent:F0}%): ${tip:F2}");
        Console.WriteLine($"Total: ${total:F2}");
        Console.WriteLine($"Split among {people} people:");
        Console.WriteLine($"Tip per person: ${tipPerPerson:F2}");
        Console.WriteLine($"Total per person: ${totalPerPerson:F2}");
    }
}

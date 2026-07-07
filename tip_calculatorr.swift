// tip_calculator.swift
import Foundation

func getDouble(prompt: String) -> Double {
    while true {
        print(prompt, terminator: "")
        if let input = readLine(), let value = Double(input), value >= 0 {
            return value
        }
        print("Invalid input. Please enter a positive number.")
    }
}

func getInt(prompt: String) -> Int {
    while true {
        print(prompt, terminator: "")
        if let input = readLine(), let value = Int(input), value > 0 {
            return value
        }
        print("Invalid input. Please enter a positive integer.")
    }
}

print("=== Tip Calculator ===")
let bill = getDouble(prompt: "Enter bill amount: ")
let tipPercent = getDouble(prompt: "Enter tip percentage (e.g., 15 for 15%): ")
let people = getInt(prompt: "Enter number of people: ")

let tip = bill * (tipPercent / 100)
let total = bill + tip
let tipPerPerson = tip / Double(people)
let totalPerPerson = total / Double(people)

print("\n--- Result ---")
print(String(format: "Bill: $%.2f", bill))
print(String(format: "Tip (%.0f%%): $%.2f", tipPercent, tip))
print(String(format: "Total: $%.2f", total))
print("Split among \(people) people:")
print(String(format: "Tip per person: $%.2f", tipPerPerson))
print(String(format: "Total per person: $%.2f", totalPerPerson))

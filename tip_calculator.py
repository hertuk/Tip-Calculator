# tip_calculator.py
import sys

def get_float(prompt):
    while True:
        try:
            return float(input(prompt))
        except ValueError:
            print("Invalid input. Please enter a number.")

def get_int(prompt):
    while True:
        try:
            val = int(input(prompt))
            if val <= 0:
                print("Must be positive.")
                continue
            return val
        except ValueError:
            print("Invalid input. Please enter an integer.")

def main():
    print("=== Tip Calculator ===")
    bill = get_float("Enter bill amount: ")
    tip_percent = get_float("Enter tip percentage (e.g., 15 for 15%): ")
    people = get_int("Enter number of people: ")

    tip = bill * (tip_percent / 100)
    total = bill + tip
    tip_per_person = tip / people
    total_per_person = total / people

    print("\n--- Result ---")
    print(f"Bill: ${bill:.2f}")
    print(f"Tip ({tip_percent:.0f}%): ${tip:.2f}")
    print(f"Total: ${total:.2f}")
    print(f"Split among {people} people:")
    print(f"Tip per person: ${tip_per_person:.2f}")
    print(f"Total per person: ${total_per_person:.2f}")

if __name__ == "__main__":
    main()

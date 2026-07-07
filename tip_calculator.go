// tip_calculator.go
package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
    "strings"
)

func main() {
    reader := bufio.NewReader(os.Stdin)

    fmt.Print("Enter bill amount: ")
    billStr, _ := reader.ReadString('\n')
    bill, err := strconv.ParseFloat(strings.TrimSpace(billStr), 64)
    if err != nil {
        fmt.Println("Invalid bill amount.")
        return
    }

    fmt.Print("Enter tip percentage (e.g., 15 for 15%): ")
    tipStr, _ := reader.ReadString('\n')
    tipPercent, err := strconv.ParseFloat(strings.TrimSpace(tipStr), 64)
    if err != nil {
        fmt.Println("Invalid tip percentage.")
        return
    }

    fmt.Print("Enter number of people: ")
    peopleStr, _ := reader.ReadString('\n')
    people, err := strconv.Atoi(strings.TrimSpace(peopleStr))
    if err != nil || people <= 0 {
        fmt.Println("Invalid number of people.")
        return
    }

    tipAmount := bill * (tipPercent / 100)
    total := bill + tipAmount
    tipPerPerson := tipAmount / float64(people)
    totalPerPerson := total / float64(people)

    fmt.Printf("\n--- Result ---\n")
    fmt.Printf("Bill: $%.2f\n", bill)
    fmt.Printf("Tip (%.0f%%): $%.2f\n", tipPercent, tipAmount)
    fmt.Printf("Total: $%.2f\n", total)
    fmt.Printf("Split among %d people:\n", people)
    fmt.Printf("Tip per person: $%.2f\n", tipPerPerson)
    fmt.Printf("Total per person: $%.2f\n", totalPerPerson)
}

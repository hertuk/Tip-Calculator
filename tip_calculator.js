// tip_calculator.js
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function askQuestion(query) {
    return new Promise(resolve => rl.question(query, resolve));
}

async function getNumber(prompt, isInt = false) {
    while (true) {
        const input = await askQuestion(prompt);
        const val = isInt ? parseInt(input) : parseFloat(input);
        if (!isNaN(val) && val >= 0 && (isInt ? Number.isInteger(val) && val > 0 : true)) {
            return val;
        }
        console.log('Invalid input. Please enter a valid number.');
    }
}

async function main() {
    console.log('=== Tip Calculator ===');
    const bill = await getNumber('Enter bill amount: ');
    const tipPercent = await getNumber('Enter tip percentage (e.g., 15 for 15%): ');
    const people = await getNumber('Enter number of people: ', true);

    const tip = bill * (tipPercent / 100);
    const total = bill + tip;
    const tipPerPerson = tip / people;
    const totalPerPerson = total / people;

    console.log('\n--- Result ---');
    console.log(`Bill: $${bill.toFixed(2)}`);
    console.log(`Tip (${tipPercent.toFixed(0)}%): $${tip.toFixed(2)}`);
    console.log(`Total: $${total.toFixed(2)}`);
    console.log(`Split among ${people} people:`);
    console.log(`Tip per person: $${tipPerPerson.toFixed(2)}`);
    console.log(`Total per person: $${totalPerPerson.toFixed(2)}`);

    rl.close();
}

main().catch(console.error);

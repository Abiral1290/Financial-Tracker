import 'dart:math';

class Transaction {
  final String description;
  final double amount;
  final DateTime date;



  Transaction({required this.description, required this.amount, required this.date});
}

List<Transaction> generateMockTransactions() {
  return List.generate(10, (index) {
    return Transaction(
      description: "Transaction $index",
      amount: Random().nextDouble() * 100, // Random amount between 0-100
      date: DateTime.now().subtract(Duration(days: Random().nextInt(30))),
    );
  });
}



import 'package:flutter/material.dart';

class BudgetingPage extends StatefulWidget {
  @override
  _BudgetingPageState createState() => _BudgetingPageState();
}

class _BudgetingPageState extends State<BudgetingPage> {
  final _formKey = GlobalKey<FormState>();
  final _incomeController = TextEditingController();
  final _fixedExpensesController = TextEditingController();
  final _weeklySpendingController = TextEditingController();
  final _subscriptionsController = TextEditingController();
  final _savingsGoalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budgeting'),
        backgroundColor: Color(0xFF145DA0), // Theme color
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Page Title
              Text(
                'Set Up Your Budget',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Answer a few questions to create your budget.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 24),

              // Monthly Income Question
              _buildInputField(
                controller: _incomeController,
                label: "What is your monthly income?",
                hintText: "e.g., 3000",
                prefixIcon: Icons.attach_money,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your monthly income';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Fixed Expenses Question
              _buildInputField(
                controller: _fixedExpensesController,
                label: "What are your fixed expenses (e.g., rent, bills)?",
                hintText: "e.g., 1200",
                prefixIcon: Icons.home,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your fixed expenses';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Weekly Spending Question
              _buildInputField(
                controller: _weeklySpendingController,
                label: "How much do you spend weekly?",
                hintText: "e.g., 200",
                prefixIcon: Icons.shopping_cart,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your weekly spending';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Subscriptions Question
              _buildInputField(
                controller: _subscriptionsController,
                label: "How much do you spend on subscriptions?",
                hintText: "e.g., 50",
                prefixIcon: Icons.subscriptions,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your subscription costs';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Savings Goal Question
              _buildInputField(
                controller: _savingsGoalController,
                label: "What is your savings goal?",
                hintText: "e.g., 500",
                prefixIcon: Icons.savings,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your savings goal';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _showSummaryDialog();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Color(0xFF145DA0),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget: Input Field
  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required IconData prefixIcon,
    required TextInputType keyboardType,
    required String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: Icon(prefixIcon, color: Colors.grey[700]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      validator: validator,
    );
  }

  // Show Summary Dialog
  void _showSummaryDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Budget Summary'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Monthly Income: \$${_incomeController.text}'),
            Text('Fixed Expenses: \$${_fixedExpensesController.text}'),
            Text('Weekly Spending: \$${_weeklySpendingController.text}'),
            Text('Subscriptions: \$${_subscriptionsController.text}'),
            Text('Savings Goal: \$${_savingsGoalController.text}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}

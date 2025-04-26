import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../../aipage.dart';
import '../../Investment/ui/InvestmentPage.dart';
import '../../budget/ui/BudgetingPage.dart';
import '../../debtManagement/ui/debtManagementScreen.dart';
import '../../financial/ui/FinancialPage.dart';
import '../../loginIn/provider/AuthenticationProvider.dart';

// 1. Add OpenAIPage for interacting with OpenAI API
// class OpenAIPage extends StatelessWidget {
//   final TextEditingController _controller = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("OpenAI Chatbot"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 labelText: "Enter your query",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 // You can integrate OpenAI API call here using your OpenAIService
//                 // For now, this is just a placeholder for interaction
//                 String query = _controller.text;
//                 if (query.isNotEmpty) {
//                   // Assuming a function like OpenAIService().fetchFinancialAdvice(query)
//                   // await OpenAIService().fetchFinancialAdvice(query);
//                   print("Query: $query");
//                   // You can then display the OpenAI response in a dialog, Text widget, etc.
//                 }
//               },
//               child: Text("Ask OpenAI"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../Investment/ui/InvestmentPage.dart';
import '../../budget/ui/BudgetingPage.dart';
import '../../debtManagement/ui/debtManagementScreen.dart';
import '../../financial/ui/FinancialPage.dart';
import '../../loginIn/provider/AuthenticationProvider.dart';
import '../../openAi/ui.dart';

// 1. Add OpenAIPage for interacting with OpenAI API
class OpenAIPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OpenAI Chatbot"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Enter your query",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // You can integrate OpenAI API call here using your OpenAIService
                // For now, this is just a placeholder for interaction
                String query = _controller.text;
                if (query.isNotEmpty) {
                  // Assuming a function like OpenAIService().fetchFinancialAdvice(query)
                  // await OpenAIService().fetchFinancialAdvice(query);
                  print("Query: $query");
                  // You can then display the OpenAI response in a dialog, Text widget, etc.
                }
              },
              child: Text("Ask OpenAI"),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<AuthenticationProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: Text("Capital Compass"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF8A2387).withOpacity(0.9),
                Color(0xFFE94057).withOpacity(0.8),
                Color(0xFFF27121).withOpacity(0.7),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF8A2387).withOpacity(0.6),
              Color(0xFFE94057).withOpacity(0.5),
              Color(0xFFF27121).withOpacity(0.4),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Message
                Text(
                  "Welcome back, ${userName?.email ?? "User"}! 👋",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),

                // Quick Overview
                Card(
                  elevation: 8,
                  shadowColor: Colors.black26,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFFFFFFF), Color(0xFFF3F5FF)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Financial Overview",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6A11CB),
                          ),
                        ),




                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _financialOverviewItem("Savings", "\$15,000"),
                            _financialOverviewItem("Debt", "\$3,500"),
                            _financialOverviewItem("Income", "\$5,000"),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Financial Goals",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF37474F),
                          ),
                        ),
                        SizedBox(height: 8),
                        LinearPercentIndicator(
                          lineHeight: 20,
                          percent: 0.7,
                          backgroundColor: Color(0xFFe4e8fc),
                          progressColor: Color(0xFF6A11CB),
                          center: Text(
                            "70%",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          barRadius: Radius.circular(10),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Budgetingpage()), // Replace with your target page
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.blueGrey, // Customize button color
                  ),
                  child: Text(
                    "Connect with the bank ",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                // Core Features
                Text(
                  "Core Features",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    _featureCard(
                      context,
                      icon: Icons.account_balance_wallet,
                      label: "Budgeting",
                      gradientColors: [
                        Color(0xFF6A11CB).withOpacity(0.9),
                        Color(0xFF2575FC).withOpacity(0.8),
                      ],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BudgetingPage(),
                        ),
                      ),
                    ),
                    _featureCard(
                      context,
                      icon: Icons.credit_card,
                      label: "Debt Management",
                      gradientColors: [
                        Color(0xFFFF7043).withOpacity(0.9),
                        Color(0xFFF27121).withOpacity(0.8),
                      ],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DebtManagementPage(),
                        ),
                      ),
                    ),
                    _featureCard(
                      context,
                      icon: Icons.trending_up,
                      label: "Investments",
                      gradientColors: [
                        Color(0xFF4CAF50).withOpacity(0.9),
                        Color(0xFF81C784).withOpacity(0.8),
                      ],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InvestmentPage(),
                        ),
                      ),
                    ),
                    _featureCard(
                      context,
                      icon: Icons.school,
                      label: "Financial Education",
                      gradientColors: [
                        Color(0xFF9C27B0).withOpacity(0.9),
                        Color(0xFFCE93D8).withOpacity(0.8),
                      ],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FinancialPage(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // 2. Add FloatingActionButton to navigate to OpenAIPage
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(),
            ),
          );
        },
        backgroundColor: Color(0xFF6A11CB),
        child: Icon(Icons.chat),
      ),
    );
  }

  Widget _financialOverviewItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _featureCard(BuildContext context,
      {required IconData icon,
        required String label,
        required List<Color> gradientColors,
        required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 12,
        shadowColor: Colors.black38,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: Colors.white),
              SizedBox(height: 16),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

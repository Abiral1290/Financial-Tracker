import 'package:flutter/material.dart';

class FinancialPage extends StatefulWidget {
  @override
  _InvestmentPageState createState() => _InvestmentPageState();
}

class _InvestmentPageState extends State<FinancialPage> {
  String dailyTip = "Invest consistently to take advantage of compounding."; // Example daily tip

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Investment Portfolio'),
        backgroundColor: Color(0xFF145DA0), // Theme color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Investment Overview Section
              _buildInvestmentOverview(),
              SizedBox(height: 24),

              // Portfolio Breakdown Section
              _buildPortfolioBreakdown(),
              SizedBox(height: 24),

              // Recent Investments Section
              _buildRecentInvestments(),
              SizedBox(height: 24),

              // Financial Education Section
              _buildFinancialEducationSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget: Investment Overview
  Widget _buildInvestmentOverview() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Total Investments',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 8),
            Text(
              '\$45,250.00',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Portfolio Growth: +8.2%',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget: Portfolio Breakdown
  Widget _buildPortfolioBreakdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Portfolio Breakdown',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 16),
        Column(
          children: [
            _buildPortfolioTile('Stocks', 60, Colors.green),
            _buildPortfolioTile('Bonds', 20, Colors.blueAccent),
            _buildPortfolioTile('Real Estate', 15, Colors.orangeAccent),
            _buildPortfolioTile('Crypto', 5, Colors.redAccent),
          ],
        ),
      ],
    );
  }

  // Helper Widget: Recent Investments
  Widget _buildRecentInvestments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Investments',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purpleAccent,
                child: Icon(Icons.trending_up, color: Colors.white),
              ),
              title: Text('Invested in Tesla Stocks'),
              subtitle: Text('Date: Jan 15, 2025'),
              trailing: Text(
                '\$5,000.00',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // Helper Widget: Financial Education Section
  Widget _buildFinancialEducationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Financial Education',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 16),

        // Daily Tip
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          color: Colors.blue[50],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.lightbulb, color: Colors.amber, size: 28),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    dailyTip,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),

        // Explore Topics
        ElevatedButton(
          onPressed: () {
            // Navigate to Topic Explorer Page
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF145DA0),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text('Explore Topics', style: TextStyle(fontSize: 16)),
        ),
        SizedBox(height: 16),

        // Interactive Quiz Button
        ElevatedButton.icon(
          onPressed: () {
            // Navigate to Quiz Page
          },
          icon: Icon(Icons.quiz, color: Colors.white),
          label: Text('Take a Quiz'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  // Helper Widget: Portfolio Tile
  Widget _buildPortfolioTile(String category, int percentage, Color color) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      leading: CircleAvatar(
        backgroundColor: color,
        child: Icon(Icons.pie_chart, color: Colors.white),
      ),
      title: Text(
        category,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        '$percentage%',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}

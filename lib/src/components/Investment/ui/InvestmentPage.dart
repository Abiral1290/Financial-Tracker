import 'package:flutter/material.dart';

class InvestmentPage extends StatelessWidget {

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
              // Investment Overview Card
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
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
              ),
              SizedBox(height: 16),

              // Portfolio Breakdown Section
              Text(
                'Portfolio Breakdown',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 16),

              // Portfolio Breakdown List
              Column(
                children: [
                  _buildPortfolioTile('Stocks', 60, Colors.green),
                  _buildPortfolioTile('Bonds', 20, Colors.blueAccent),
                  _buildPortfolioTile('Real Estate', 15, Colors.orangeAccent),
                  _buildPortfolioTile('Crypto', 5, Colors.redAccent),
                ],
              ),
              SizedBox(height: 24),

              // Recent Investments Section
              Text(
                'Recent Investments',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 16),

              // Recent Investments List
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
              SizedBox(height: 24),

              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigate to Add Investment Page
                    },
                    icon: Icon(Icons.add),
                    label: Text('Add Investment'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF145DA0),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigate to View Analytics Page
                    },
                    icon: Icon(Icons.analytics),
                    label: Text('View Analytics'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF145DA0),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget for Portfolio Breakdown Tiles
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

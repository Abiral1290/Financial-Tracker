import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DataSecurityPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          AnimatedContainer(
            duration: Duration(seconds: 3),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF8A2387).withOpacity(0.9), // Purple
                  Color(0xFFE94057).withOpacity(0.8), // Reddish-pink
                  Color(0xFFF27121).withOpacity(0.7), // Orange
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Center(
                      child: Text(
                        "Data Security Policy",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Description
                    Text(
                      "We value your privacy and are committed to protecting your personal information. This page outlines how we collect, use, and secure your data.",
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                    SizedBox(height: 24),

                    // Sections in Cards
                    _buildSection(
                      "1. Data Collection",
                      "We collect the following types of data when you use our application:\n"
                          "- Personal information (e.g., name, email)\n"
                          "- Usage data (e.g., app interactions, preferences)\n"
                          "- Device data (e.g., operating system, device type)",
                    ),
                    SizedBox(height: 16),

                    _buildSection(
                      "2. Data Usage",
                      "We use your data to provide and improve our services, including:\n"
                          "- Personalizing your experience\n"
                          "- Improving application performance\n"
                          "- Sending notifications and updates",
                    ),
                    SizedBox(height: 16),

                    _buildSection(
                      "3. Data Security",
                      "We take reasonable measures to protect your data from unauthorized access, disclosure, or destruction. Security measures include:\n"
                          "- Encryption of sensitive data\n"
                          "- Regular security audits\n"
                          "- Secure server infrastructure",
                    ),
                    SizedBox(height: 16),

                    _buildSection(
                      "4. Third-Party Services",
                      "We may share data with trusted third-party services for specific purposes (e.g., analytics, payment processing). All third parties adhere to strict confidentiality agreements.",
                    ),
                    SizedBox(height: 16),

                    _buildSection(
                      "5. Your Rights",
                      "You have the right to access, update, or delete your personal data. Contact us at support@example.com for assistance.",
                    ),
                    SizedBox(height: 32),

                    // "I Agree" Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          context.go('/home');
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 32.0,
                          ),
                          backgroundColor: Colors.white.withOpacity(0.9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "I Agree",
                          style: TextStyle(fontSize: 16, color: Color(0xFF6A1B9A)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Card(
      color: Colors.white.withOpacity(0.9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      shadowColor: Colors.black45,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A1B9A), // Deep purple
              ),
            ),
            SizedBox(height: 8),

            // Content
            Text(
              content,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87, // Dark gray for better readability
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

class YodleeService {
  // final String clientId = 'YOUR_CLIENT_ID';  // Replace with your Client ID
  // final String secretKey = 'YOUR_SECRET_KEY';  // Replace with your Secret Key
  final String baseUrl = 'https://developer.api.yodlee.com/ysl'; // Yodlee API base URL




  Future<String?> getAccessToken() async {
    final url = Uri.parse('$baseUrl/auth/token');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Api-Version': '1.1',
      },
      body: {
        // 'clientId': clientId,
        // 'clientSecret': secretKey,
        'grant_type': 'client_credentials',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['access_token'];  // Extract the access token from the response
    } else {
      print('Error: ${response.body}');
      return null;
    }
  }

  Future<void> fetchUserData(String accessToken) async {
    final url = Uri.parse('$baseUrl/financialData');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Api-Version': '1.1',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('User Data: $data');  // You can parse and use the data as needed
    } else {
      print('Error: ${response.body}');
    }
  }
}

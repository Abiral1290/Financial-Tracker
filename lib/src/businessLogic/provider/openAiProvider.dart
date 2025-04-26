import 'package:fintechhackathonproject/src/services/api/openAi.dart';
import 'package:flutter/material.dart';

class OpenAIProvider with ChangeNotifier {
  final OpenAIService _openAIService;
  List<Map<String, String>> _messages = []; // List of messages with sender and content

  OpenAIProvider(this._openAIService);

  List<Map<String, String>> get messages => _messages;

  Future<void> sendMessage(String prompt) async {
    _messages.add({'role': 'user', 'content': prompt});
    notifyListeners();

    try {
      String response = await _openAIService.fetchFinancialAdvice(prompt);
      _messages.add({'role': 'assistant', 'content': response});
    } catch (e) {
      _messages.add({'role': 'assistant', 'content': 'Error: $e'});
    } finally {
      notifyListeners();
    }
  }
}

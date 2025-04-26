// import 'package:flutter/material.dart';
// import 'package:plaid_flutter/plaid_flutter.dart';
//
// class PlaidLinkPage extends StatefulWidget {
//   @override
//   _PlaidLinkPageState createState() => _PlaidLinkPageState();
// }
//
// class _PlaidLinkPageState extends State<PlaidLinkPage> {
//   String? _token;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializePlaidLink();
//   }
//
//   // Initialize Plaid Link
//   void _initializePlaidLink() async {
//     // Replace with your actual public key
//     String clientPublicKey = "your-public-key-here";
//
//     final result = await PlaidFlutter.createLinkToken(clientPublicKey);
//     if (result != null) {
//       _token = result.linkToken;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Link Your Bank Account")),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _token == null
//               ? null
//               : () async {
//             await PlaidFlutter.openLink(_token!);
//             // Listen for the success or error of the linking process
//             PlaidFlutter.onEvent.listen((event) {
//               if (event is PlaidLinkEventSuccess) {
//                 print("Link success: ${event.publicToken}");
//                 // Use the public token to make requests to the Plaid API
//                 // You would need to send this token to your backend for further processing
//               } else if (event is PlaidLinkEventExit) {
//                 print("Link exited: ${event.errorMessage}");
//               }
//             });
//           },
//           child: Text("Link Bank Account"),
//         ),
//       ),
//     );
//   }
// }

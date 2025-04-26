// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:local_auth/local_auth.dart';
//
// class AuthenticationProvider with ChangeNotifier {
//   User? _user;
//   final LocalAuthentication _localAuth = LocalAuthentication();
//
//   User? get user => _user;
//
//   void setUser(User? user) {
//     _user = user;
//     notifyListeners();
//   }
//
//   Future<void> signUpWithEmailAndPassword(String name, String email, String password) async {
//     try {
//       final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//
//       // Update display name
//       await userCredential.user?.updateDisplayName(name);
//       setUser(userCredential.user);
//     } on FirebaseAuthException catch (e) {
//       throw e.message ?? 'An error occurred during sign-up.';
//     }
//   }
//
//   Future<void> loginWithEmailAndPassword(String email, String password) async {
//     try {
//       final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       setUser(userCredential.user);
//     } on FirebaseAuthException catch (e) {
//       throw e.message ?? 'An error occurred during login.';
//     }
//   }
//
//   Future<void> signInWithGoogle() async {
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//     if (googleUser != null) {
//       final GoogleSignInAuthentication googleAuth =
//       await googleUser.authentication;
//       final OAuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       final userCredential =
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       setUser(userCredential.user);
//     }
//   }
//
//
//
//   Future<bool> authenticateWithBiometrics() async {
//     return await _localAuth.authenticate(
//       localizedReason: 'Authenticate to log in',
//       options: const AuthenticationOptions(
//         biometricOnly: true,
//       ),
//     );
//   }
//
//   Future<void> signOut() async {
//     await FirebaseAuth.instance.signOut();
//     setUser(null);
//   }
//
//
//
//
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences

class AuthenticationProvider with ChangeNotifier {
  User? _user;
  final LocalAuthentication _localAuth = LocalAuthentication();

  User? get user => _user;

  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }

  // Function to save login state to SharedPreferences
  Future<void> saveLoginState(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  // Function to check if the user is logged in
  Future<bool> checkLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false; // Return false if no value found
  }

  // Function to save user info to SharedPreferences
  Future<void> saveUserInfo(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  // Function to load user info from SharedPreferences
  Future<String?> loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId'); // Return null if no userId found
  }

  Future<void> signUpWithEmailAndPassword(String name, String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update display name
      await userCredential.user?.updateDisplayName(name);
      setUser(userCredential.user);

      // Save login state and user info
      await saveLoginState(true);
      await saveUserInfo(userCredential.user!.uid);

    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'An error occurred during sign-up.';
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      setUser(userCredential.user);

      // Save login state and user info
      await saveLoginState(true);
      await saveUserInfo(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'An error occurred during login.';
    }
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
      setUser(userCredential.user);

      // Save login state and user info
      await saveLoginState(true);
      await saveUserInfo(userCredential.user!.uid);
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    setUser(null);

    // Update login state
    await saveLoginState(false);
    await saveUserInfo('');
  }

  Future<bool> authenticateWithBiometrics() async {
    return await _localAuth.authenticate(
      localizedReason: 'Authenticate to log in',
      options: const AuthenticationOptions(
        biometricOnly: true,
      ),
    );
  }
}


import 'package:fintechhackathonproject/src/components/dataSecurity/ui/datSecurityPage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../loginIn/provider/AuthenticationProvider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _cardAnimation;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _cardAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleSignUp(BuildContext context, AuthenticationProvider authProvider) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        await authProvider.signUpWithEmailAndPassword(
          _nameController.text.trim(),
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );


        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DataSecurityPage(),
          ),
        );      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red,
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          // Enhanced Gradient Background with adjusted opacity
          AnimatedContainer(
            duration: Duration(seconds: 3),
            curve: Curves.easeInOut,
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

          // Animated Sign-Up Card
          Center(
            child: ScaleTransition(
              scale: _cardAnimation,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 10,
                  shadowColor: Colors.black26,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Title with adjusted color and opacity
                        Text(
                          'Create an Account',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6A1B9A).withOpacity(0.8), // Light purple with opacity
                          ),
                        ),
                        Text(
                          'Join us to get started',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF00BCD4).withOpacity(0.8), // Light cyan with opacity
                          ),
                        ),
                        SizedBox(height: 24),

                        // Sign-Up Form
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              // Name Field
                              TextFormField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  labelText: 'Name',
                                  labelStyle: TextStyle(color: Colors.white70), // Soft white for label
                                  prefixIcon: Icon(Icons.person, color: Colors.white70),
                                  filled: true,
                                  fillColor: Colors.grey[800],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                style: TextStyle(color: Colors.white), // Text inside input is white
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16),

                              // Email Field
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.white70), // Soft white for label
                                  prefixIcon: Icon(Icons.email, color: Colors.white70),
                                  filled: true,
                                  fillColor: Colors.grey[800],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(color: Colors.white),  // White text for email input
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                    return 'Enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16),

                              // Password Field
                              TextFormField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(color: Colors.white70), // Soft white for label
                                  prefixIcon: Icon(Icons.lock, color: Colors.white70),
                                  filled: true,
                                  fillColor: Colors.grey[800],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                obscureText: true,
                                style: TextStyle(color: Colors.white), // White text for password input
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters long';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 24),

                              // Sign-Up Button with opacity and gradient effect
                              _isLoading
                                  ? CircularProgressIndicator()
                                  : ElevatedButton(
                                onPressed: () => _handleSignUp(context, authProvider),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  backgroundColor: Color(0xFF8A2387).withOpacity(0.9), // Gradient effect
                                ),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(fontSize: 16, color: Colors.white), // White text for button
                                ),
                              ),
                              SizedBox(height: 16),

                              // Google Sign-Up Button
                              ElevatedButton.icon(
                                onPressed: () async {
                                  setState(() {
                                    _isLoading = true;
                                  });

                                  try {
                                    await authProvider.signInWithGoogle();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DataSecurityPage(),
                                      ),
                                    );
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Google Sign-Up failed: $e'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  } finally {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  }
                                },
                                icon: Icon(Icons.g_mobiledata, color: Colors.black),
                                label: Text(
                                  'Sign Up with Google',
                                  style: TextStyle(color: Colors.black), // Black text for Google button
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  backgroundColor: Colors.white,
                                  side: BorderSide(color: Colors.grey[300]!),
                                ),
                              ),
                              SizedBox(height: 16),

                              // Already Have an Account Button
                              TextButton(
                                onPressed: () {
                                  context.go('/login');
                                },
                                child: Text(
                                  'Already have an account? Log In',
                                  style: TextStyle(color: Colors.grey[400]), // Soft grey text
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

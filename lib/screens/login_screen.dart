import 'package:flutter/material.dart';
import 'student_reports_screen.dart';
import 'admin_reports_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // Check if either field is empty
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter both email/username and password.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // Dynamic transition based on email content
    if (email.contains('admin')) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const AdminReportsScreen(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => StudentReportsScreen(
            userName: email,
          ),
        ),
      );
    }
  }

  // MICROSOFT LOGIN
  void _microsoftLogin() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Microsoft login selected.'),
        backgroundColor: Color(0xFF0078D4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4285F4),
              Color(0xFFE8F0FE),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // MCC Logo
                    Image.asset(
                      'logo.jpg',
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'MCC',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const Text(
                      'AssetWatch',
                      style: TextStyle(
                        color: Color(0xFF1E3A8A),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Track and report campus asset issues',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email / Username',
                        hintText: 'name@mcc.edu.ph',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 12),

                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // SIGN IN BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1A73E8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: _login,
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // MICROSOFT LOGIN
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            color: Color(0xFFD1D5DB),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: _microsoftLogin,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Microsoft Logo
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 2,
                                physics:
                                    const NeverScrollableScrollPhysics(),
                                children: [
                                  Container(
                                    color: const Color(0xFFF25022),
                                  ),
                                  Container(
                                    color: const Color(0xFF7FBA00),
                                  ),
                                  Container(
                                    color: const Color(0xFF00A4EF),
                                  ),
                                  Container(
                                    color: const Color(0xFFFFB900),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 12),

                            const Text(
                              'Sign in with Microsoft',
                              style: TextStyle(
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';


class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(6, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Tabs
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFe0e0e0),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 3),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: const Color(0xFF77dd77),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black, width: 3),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black54,
                  labelStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: const [
                    Tab(text: "Login"),
                    Tab(text: "Register"),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Tab Views
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Login Form
                    LoginForm(),

                    // Registration Form
                    RegistrationForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Login Form Widget
class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Email Field
        _buildTextField(label: "Email", icon: Icons.email),
        const SizedBox(height: 20),

        // Password Field
        _buildTextField(label: "Password", icon: Icons.lock, obscureText: true),
        const SizedBox(height: 30),

        // Login Button
        _buildButton(label: "Login", color: const Color(0xFF77dd77)),
        const SizedBox(height: 20),

        // Social Logins
        _buildSocialLogins(),
      ],
    );
  }
}

// Registration Form Widget
class RegistrationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Email Field
        _buildTextField(label: "Email", icon: Icons.email),
        const SizedBox(height: 20),

        // Password Field
        _buildTextField(label: "Password", icon: Icons.lock, obscureText: true),
        const SizedBox(height: 20),

        // Confirm Password Field
        _buildTextField(
            label: "Confirm Password", icon: Icons.lock, obscureText: true),
        const SizedBox(height: 30),

        // Register Button
        _buildButton(label: "Register", color: const Color(0xFF77dd77)),
        const SizedBox(height: 20),

        // Social Logins
        _buildSocialLogins(),
      ],
    );
  }
}

// Helper function to build text fields
Widget _buildTextField(
    {required String label,
      required IconData icon,
      bool obscureText = false}) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFFe0e0e0),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.black, width: 2),
    ),
    child: TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black87),
        prefixIcon: Icon(icon, color: Colors.black),
        border: InputBorder.none,
      ),
    ),
  );
}

// Helper function to build buttons
Widget _buildButton({required String label, required Color color}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.black, width: 3),
      boxShadow: const [
        BoxShadow(
          color: Colors.black,
          offset: Offset(4, 4),
        ),
      ],
    ),
    child: TextButton(
      onPressed: () {}, // TODO: Implement login/register logic
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ),
  );
}

// Helper function to build social login buttons
Widget _buildSocialLogins() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildSocialButton(icon: Icons.g_mobiledata, color: const Color(0xFFdb4437)), // Google
      _buildSocialButton(icon: Icons.facebook, color: const Color(0xFF4267b2)), // Facebook
      _buildSocialButton(icon: Icons.abc_outlined, color: Colors.black), // Twitter (X)
    ],
  );
}

// Helper function to build individual social login buttons
Widget _buildSocialButton({required IconData icon, required Color color}) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.black, width: 2),
      color: color,
    ),
    child: IconButton(
      icon: Icon(icon, size: 30, color: Colors.white),
      onPressed: () {}, // TODO: Implement social login logic
    ),
  );
}
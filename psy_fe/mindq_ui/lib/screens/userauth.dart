import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart'; // Import for date formatting

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
      backgroundColor: const Color(0xffb74093),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(16),
            color: Color(0xfff4d738),
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
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff4d738),
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
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SingleChildScrollView(child: LoginForm()),
                    SingleChildScrollView(child: RegistrationForm()),
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

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTextField(label: "Email", icon: Icons.email),
        const SizedBox(height: 20),
        _buildTextField(label: "Password", icon: Icons.lock, obscureText: true),
        const SizedBox(height: 30),
        _buildButton(label: "Login", color: const Color(0xFF77dd77)),
        const SizedBox(height: 20),
        _buildSocialLogins(),
      ],
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  DateTime _selectedDate = DateTime.now();
  final TextEditingController _dateController = TextEditingController();
  String _selectedGender = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF77dd77),
              onPrimary: Colors.black,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTextField(label: "Username", icon: Icons.account_circle_rounded),
        const SizedBox(height: 20),
        _buildTextField(label: "Email", icon: Icons.email),
        const SizedBox(height: 20),
        _buildGenderField(),
        const SizedBox(height: 20),
        _buildTextField(label: "Password", icon: Icons.lock, obscureText: true),
        const SizedBox(height: 20),
        _buildTextField(
            label: "Confirm Password", icon: Icons.lock, obscureText: true),
        const SizedBox(height: 20),
        _buildDateOfBirthField(),
        const SizedBox(height: 30),
        _buildButton(label: "Register", color: const Color(0xFF77dd77), context: context),
        const SizedBox(height: 20),
        _buildSocialLogins(),
      ],
    );
  }

  Widget _buildDateOfBirthField() {
    return InkWell(
      onTap: () => _selectDate(context),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFe0e0e0),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: IgnorePointer(
          child: TextField(
            controller: _dateController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(16),
              labelText: "Date of Birth",
              labelStyle: TextStyle(color: Colors.black87),
              prefixIcon: Icon(Icons.calendar_today_rounded, color: Colors.black),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenderField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildGenderOption(Symbols.male, "M"),
        _buildGenderOption(Symbols.female, "F"),
        _buildGenderOption(Icons.transgender, "Others"),
      ],
    );
  }

  Widget _buildGenderOption(IconData icon, String gender) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedGender = gender;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _selectedGender == gender
              ? const Color(0xFF77dd77)
              : const Color(0xFFe0e0e0),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black, size: 30),
            const SizedBox(width: 4),
            Text(
              gender,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

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

  Widget _buildButton(
      {required String label,
        required Color color,
        required BuildContext context}) {
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
        onPressed: () {
          if (kDebugMode) {
            Navigator.pushNamed(context, '/startonboard');
          } else {
            // TODO: Implement login/register logic
            print("Login/Register logic in release mode");
          }
        },
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

  Widget _buildSocialLogins() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialButton(
            icon: Icons.g_mobiledata, color: const Color(0xFFdb4437)), // Google
        _buildSocialButton(
            icon: Icons.facebook, color: const Color(0xFF4267b2)), // Facebook
      ],
    );
  }

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
}

Widget _buildTextField(
      {required String label, required IconData icon, bool obscureText = false}) {
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

  Widget _buildSocialLogins() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialButton(
            icon: Icons.g_mobiledata, color: const Color(0xFFdb4437)), // Google
        _buildSocialButton(
            icon: Icons.facebook, color: const Color(0xFF4267b2)), // Facebook
      ],
    );
  }

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



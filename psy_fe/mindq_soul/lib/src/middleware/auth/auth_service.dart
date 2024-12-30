import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../models/user.dart'; // Import User model

class AuthService {
  final String _baseUrl; // Your API base URL
  final _storage = const FlutterSecureStorage();
  static const _tokenKey = 'auth_token';

  AuthService(this._baseUrl);

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: _tokenKey);
    return token != null;
  }

  // Get the currently logged-in user
  Future<User?> getCurrentUser() async {
    final token = await _storage.read(key: _tokenKey);
    if (token == null) {
      return null;
    }
    return User(id: 1, name: "Test User", email: "test@example.com", token: token);
  }

  Future<User?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final user = User.fromJson(data['user']);
      final token = data['token'];

      await _storage.write(key: _tokenKey, value: token);

      return user;
    } else {
      return null;
    }
  }

  Future<User?> register(
      String name,
      String email,
      String password,
      String gender,
      DateTime dob,
      ) async {
    final formattedDob =
        "${dob.year}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}";
    final response = await http.post(
      Uri.parse('$_baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'gender': gender,
        'dob': formattedDob,
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final user = User.fromJson(data['user']);
      final token = data['token'];
      await _storage.write(key: _tokenKey, value: token);
      return user;
    } else {
      return null;
    }
  }

  Future<void> logout() async {
    await _storage.delete(key: _tokenKey);
  }
}


//
// ElevatedButton(
// onPressed: () async {
// final email = _emailController.text;
// final password = _passwordController.text;
//
// final user = await _authService.login(email, password);
//
// if (user != null) {
// Navigator.pushReplacementNamed(context, '/home');
// } else {
// ScaffoldMessenger.of(context).showSnackBar(
// SnackBar(
// content: Text('Login failed. Please check your credentials.'),
// ),
// );
// }
// },
// child: Text('Login'),
// ),
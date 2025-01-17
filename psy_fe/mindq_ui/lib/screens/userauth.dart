import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
    );
  }
}

class AuthScreen extends StatefulWidget {
  @override
  _LoginRegistrationScreenState createState() =>
      _LoginRegistrationScreenState();
}

class _LoginRegistrationScreenState extends State<AuthScreen> {
  bool isLogin = true; // Initially set to login screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/background.jpg'), // Replace with your background image
                fit: BoxFit.cover,
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.yellow.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Make the column take minimum space
                children: [
                  Positioned(
                    top: 100,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'Welcome Back!',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'we missed you...',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Sliding Container for Login/Registration
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: isLogin ? buildLoginForm() : buildRegistrationForm(),
                  ),
                  SizedBox(height: 20),

                  // Sliding Button
                  buildSlidingButton(),
                  SizedBox(height: 20),

                  // Social Media Buttons
                  Text("Or continue with"),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSocialButton('lib/assets/icons/google.png'),
                      SizedBox(width: 20),
                      buildSocialButton('lib/assets/icons/twitter.png'),
                      SizedBox(width: 20),
                      buildSocialButton('lib/assets/icons/apple.png'),
                    ],
                  ),
                  SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Login Form
  Widget buildLoginForm() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Username',
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(), // Add border to all sides
            focusedBorder: OutlineInputBorder( // Customize border when focused
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder( // Customize border when not focused
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock),
            suffixIcon: Icon(Icons.visibility),
            border: OutlineInputBorder(), // Add border to all sides
            focusedBorder: OutlineInputBorder( // Customize border when focused
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder( // Customize border when not focused
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
          ),
          obscureText: true,
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text('Forgot Password?'),
          ),
        ),
      ],
    );
  }

  // Registration Form
  Widget buildRegistrationForm() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Full Name',
            prefixIcon: Icon(Icons.person_outline),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            ), // Add border to all sides
            focusedBorder: OutlineInputBorder( // Customize border when focused
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder( // Customize border when not focused
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(), // Add border to all sides
            focusedBorder: OutlineInputBorder( // Customize border when focused
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder( // Customize border when not focused
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock),
            suffixIcon: Icon(Icons.visibility),
            border: OutlineInputBorder(), // Add border to all sides
            focusedBorder: OutlineInputBorder( // Customize border when focused
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder( // Customize border when not focused
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
          ),
          obscureText: true,
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            labelText: 'Confirm Password',
            prefixIcon: Icon(Icons.lock_outline),
            suffixIcon: Icon(Icons.visibility),
            border: OutlineInputBorder(), // Add border to all sides
            focusedBorder: OutlineInputBorder( // Customize border when focused
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder( // Customize border when not focused
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
          ),
          obscureText: true,
        ),
      ],
    );
  }
  // Sliding Button Widget
  Widget buildSlidingButton() {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Color(0xFF99627A),
            Color(0xFFF08A5D),
          ],
        ),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: isLogin ? 0 : 150,
            top: 0,
            bottom: 0,
            width: 150,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLogin = !isLogin;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isLogin = true;
                      });
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: isLogin ? Colors.black : Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isLogin = false;
                      });
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: isLogin ? Colors.white : Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Social Media Button
  Widget buildSocialButton(String imagePath) {
    return InkWell(
      onTap: () {
        // TODO: Add your social media login logic here
        print("Social media button tapped: $imagePath");
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [ // Add the boxShadow here
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color with opacity
              blurRadius: 5.0, // Spread of the shadow
              offset: Offset(0, 2), // Offset of the shadow (x, y)
            ),
          ],
          shape: BoxShape.rectangle,
          borderRadius:  BorderRadius.circular(5),
          border: Border.all(
            color: Colors.grey.shade400, // Light grey border
            width: 0.5,
          ),
        ),
        child: Image.asset(
          imagePath,
          width: 10,
          height: 10,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mindq_ui/constants/string_const.dart';
import 'package:mindq_ui/constants/styles/color_const.dart';
import 'package:mindq_ui/widgets/TextBox.dart';

import '../widgets/DateTimePicker.dart';

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
  bool isLogin = true;
  int selectedGenderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/mindq_right_bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (isLogin)
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: constraints.maxHeight * 0.00,
                                left: constraints.maxWidth * 0.00,
                              ),
                              child: SizedBox(
                                width: constraints.maxWidth * 0.46,
                                height: constraints.maxHeight * 0.25,
                                child: Image.asset(
                                  'lib/assets/phobe-removebg-preview.png',
                                  fit: BoxFit.contain,
                                  color: Colors.white.withOpacity(0.8),
                                  colorBlendMode: BlendMode.modulate,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.only(top: constraints.maxHeight * 0.00),
                              decoration: BoxDecoration(
                                gradient: ThemeGradient.LoginGradient,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                    width: double.infinity,
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Color(0xff827327),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: isLogin
                                        ? buildLoginForm(constraints)
                                        : buildRegistrationForm(constraints),
                                  ),
                                  SizedBox(height: 20),
                                  buildSlidingButton(constraints),
                                  SizedBox(height: 20),
                                  Text("Or continue with"),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      buildSocialButton(
                                          'lib/assets/icons/google.png',
                                          constraints),
                                      SizedBox(width: 20),
                                      buildSocialButton(
                                          'lib/assets/icons/twitter.png',
                                          constraints),
                                      SizedBox(width: 20),
                                      buildSocialButton(
                                          'lib/assets/icons/apple.png',
                                          constraints),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoginForm(BoxConstraints constraints) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: constraints.maxHeight * 0.02,
              bottom: constraints.maxHeight * 0.01),
          child: Column(
            children: [
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.08,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'we missed you...',
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.03,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: constraints.maxHeight * 0.02),
        CustomTextbox(
            labelText: FormTableText.UsernameLabel,
            prefixIcon: Icons.person_2_outlined,
            fillColor: ThemeColor.fieldbg,
            constraints: constraints),
        SizedBox(height: constraints.maxHeight * 0.02),
        CustomTextbox(
            labelText: FormTableText.PasswordLabel,
            prefixIcon: Icons.key_outlined,
            suffixIcon: Icons.visibility,
            fillColor: ThemeColor.fieldbg,
            constraints: constraints),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Forgot Password?',
              style: TextStyle(fontSize: constraints.maxWidth * 0.03),
            ),
          ),
        ),
        SizedBox(height: constraints.maxHeight * 0.05),
      ],
    );
  }

  Widget buildRegistrationForm(BoxConstraints constraints) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: constraints.maxHeight * 0.02,
            bottom: constraints.maxHeight * 0.01,
          ),
          child: Column(
            children: [
              Text(
                'Get Started',
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.08,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'healing holistically',
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.03,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: constraints.maxHeight * 0.02),
        CustomTextbox(
            labelText: FormTableText.UsernameLabel,
            prefixIcon: Icons.person_2_outlined,
            fillColor: ThemeColor.fieldbg,
            constraints: constraints),
        SizedBox(height: constraints.maxHeight * 0.02),
        CustomTextbox(
            labelText: FormTableText.EmailLabel,
            prefixIcon: Icons.email_outlined,
            fillColor: ThemeColor.fieldbg,
            constraints: constraints),
        SizedBox(height: constraints.maxHeight * 0.02),
        CustomTextbox(
            labelText: FormTableText.PasswordLabel,
            prefixIcon: Icons.key_outlined,
            suffixIcon: Icons.visibility,
            fillColor: ThemeColor.fieldbg,
            constraints: constraints),
        SizedBox(height: constraints.maxHeight * 0.02),
        CustomTextbox(
            labelText: FormTableText.ConfirmPasswordLabel,
            prefixIcon: Icons.key_outlined,
            fillColor: ThemeColor.fieldbg,
            constraints: constraints),
        SizedBox(height: constraints.maxHeight * 0.02),
        DateAndTimePicker(),
        SizedBox(height: constraints.maxHeight * 0.02),
        buildGenderSlidingButton(constraints),
      ],
    );
  }

  Widget buildSlidingButton(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth * 0.8,
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
            left: isLogin ? 0 : constraints.maxWidth * 0.4,
            top: 0,
            bottom: 0,
            width: constraints.maxWidth * 0.4,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLogin = !isLogin;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF9C3FE4),
                      Color(0xFFC65647),
                    ],
                  ),
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
                        color: isLogin ? Colors.white : Colors.black38,
                        fontSize: constraints.maxWidth * 0.04,
                        fontWeight: FontWeight.bold,
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
                        color: isLogin ? Colors.black38 : Colors.white,
                        fontSize: constraints.maxWidth * 0.04,
                        fontWeight: FontWeight.bold,
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

  Widget buildGenderSlidingButton(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth * 0.8,
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
          ),
          BoxShadow(
            color: Colors.black12,
            spreadRadius: -12.0,
            blurRadius: 12.0,
          ),
        ],
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
            left: selectedGenderIndex * (constraints.maxWidth * 0.8 / 3),
            top: 0,
            bottom: 0,
            width: constraints.maxWidth * 0.8 / 3,
            child: GestureDetector(
              onTap: () {
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
                        selectedGenderIndex = 0;
                      });
                    },
                    child: Text(
                      'Male',
                      style: TextStyle(
                        color: selectedGenderIndex == 0
                            ? Colors.black
                            : Colors.white,
                        fontSize: constraints.maxWidth * 0.04,
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
                        selectedGenderIndex = 1;
                      });
                    },
                    child: Text(
                      'Female',
                      style: TextStyle(
                        color: selectedGenderIndex == 1
                            ? Colors.black
                            : Colors.white,
                        fontSize: constraints.maxWidth * 0.04,
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
                        selectedGenderIndex = 2;
                      });
                    },
                    child: Text(
                      'Others',
                      style: TextStyle(
                        color: selectedGenderIndex == 2
                            ? Colors.black
                            : Colors.white,
                        fontSize: constraints.maxWidth * 0.04,
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

  Widget buildSocialButton(String imagePath, BoxConstraints constraints) {
    return InkWell(
      onTap: () {
        // TODO: Add your social media login logic here
        print("Social media button tapped: $imagePath");
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5.0,
              offset: Offset(0, 2),
            ),
          ],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.grey.shade400,
            width: 0.5,
          ),
        ),
        child: Image.asset(
          imagePath,
          width: constraints.maxWidth * 0.09,
          height: constraints.maxWidth * 0.04,
        ),
      ),
    );
  }
}
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mindq_ui/constants/string_const.dart';
import 'package:mindq_ui/constants/styles/color_const.dart';
import '../constants/styles/font_const.dart';

import '../widgets/DateTimePicker.dart';
import '../widgets/TextBox.dart';

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
  bool isLoginButtonEnabled = false;
  bool isRegisterButtonEnabled = false;

  // Controllers for text fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _checkLoginButtonEnabled() {
    setState(() {
      isLoginButtonEnabled = _usernameController.text.length >= 3 &&
          _passwordController.text.isNotEmpty;
    });
  }

  void _checkRegisterButtonEnabled() {
    setState(() {
      isRegisterButtonEnabled = _usernameController.text.length >= 3 &&
          _emailController.text.isNotEmpty &&
          _passwordController.text.length >= 6 &&
          _passwordController.text == _confirmPasswordController.text;
    });
  }

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_checkLoginButtonEnabled);
    _passwordController.addListener(_checkLoginButtonEnabled);

    _usernameController.addListener(_checkRegisterButtonEnabled);
    _emailController.addListener(_checkRegisterButtonEnabled);
    _passwordController.addListener(_checkRegisterButtonEnabled);
    _confirmPasswordController.addListener(_checkRegisterButtonEnabled);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background Image
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
                          // Mascot Image (only for login)
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
                                    'lib/assets/Phoebe_welcome.png',
                                    fit: BoxFit.contain,
                                    color: Colors.white.withOpacity(0.8),
                                    colorBlendMode: BlendMode.modulate,
                                  ),
                                ),
                              ),
                            ),

                          // Main Content Container
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.only(
                                  top: constraints.maxHeight * 0.00),
                              decoration: BoxDecoration(
                                image: isLogin
                                    ? null
                                    : DecorationImage(
                                        image: AssetImage(
                                            'lib/assets/reg_logo.png'),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                          Colors.white.withOpacity(0.1),
                                          BlendMode.overlay,
                                        ),
                                      ),
                                gradient: ThemeGradient.LoginGradient,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Login/Registration Form Container
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                    width: double.infinity,
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: isLogin
                                          ? Colors.white24
                                          : Colors.white24,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: isLogin
                                        ? buildLoginForm(constraints)
                                        : buildRegistrationForm(constraints),
                                  ),
                                  SizedBox(height: 20),

                                  // Sliding Button with Conditional Logic
                                  buildSlidingButton(constraints),
                                  SizedBox(height: 20),

                                  // "Or continue with" Section
                                  Row(
                                    children: [
                                      // Left gradient divider
                                      Expanded(
                                        child: Container(
                                          height: 1,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.white30.withOpacity(
                                                    0.0), // Start transparent
                                                Colors
                                                    .white30, // Fully visible in the middle
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      // "Or continue with" text
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          "Or continue with",
                                          style: ThemeFont.primaryFont(
                                            fontSize: 14,
                                            color: Colors.white30,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      // Right gradient divider
                                      Expanded(
                                        child: Container(
                                          height: 1,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors
                                                    .white30, // Fully visible in the middle
                                                Colors.white30.withOpacity(
                                                    0.0), // End transparent
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 30),

                                  // Social Media Buttons
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
                style: ThemeFont.primaryFont(
                  fontSize: constraints.maxWidth * 0.1096,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ).copyWith(
                  shadows: [
                    Shadow(
                      color: Colors.black
                          .withOpacity(0.5), // Shadow color with opacity
                      offset: Offset(0, 2), // Horizontal and vertical offset
                      blurRadius: 6, // How blurry the shadow appears
                    ),
                  ],
                ),
              ),
              Text(
                'we missed you...',
                style: ThemeFont.primaryFont(
                  fontSize: constraints.maxWidth * 0.05,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: constraints.maxHeight * 0.04),
        CustomTextbox(
            labelText: FormTableText.UsernameLabel,
            prefixIcon: Icons.person_2_outlined,
            fillColor: ThemeColor.fieldbg,
            controller: _usernameController,
            constraints: constraints),
        SizedBox(height: constraints.maxHeight * 0.02),
        CustomTextbox(
            labelText: FormTableText.PasswordLabel,
            prefixIcon: Icons.key_outlined,
            suffixIcon: Icons.visibility,
            fillColor: ThemeColor.fieldbg,
            obscureText: true,
            controller: _passwordController,
            constraints: constraints),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Forgot Password?',
              style:
                  ThemeFont.primaryFont(fontSize: constraints.maxWidth * 0.03),
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
                style: ThemeFont.primaryFont(
                  fontSize: constraints.maxWidth * 0.1333,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ).copyWith(
                  shadows: [
                    Shadow(
                      color: Colors.black
                          .withOpacity(0.5), // Shadow color with opacity
                      offset: Offset(0, 2), // Horizontal and vertical offset
                      blurRadius: 6, // How blurry the shadow appears
                    ),
                  ],
                ),
              ),
              Text(
                'Healing Holistically',
                style: ThemeFont.primaryFont(
                  fontSize: constraints.maxWidth * 0.05,
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
          controller: _usernameController,
          constraints: constraints,
        ),
        SizedBox(height: constraints.maxHeight * 0.02),
        CustomTextbox(
          labelText: FormTableText.EmailLabel,
          prefixIcon: Icons.email_outlined,
          fillColor: ThemeColor.fieldbg,
          controller: _emailController,
          constraints: constraints,
        ),
        SizedBox(height: constraints.maxHeight * 0.02),
        CustomTextbox(
          labelText: FormTableText.PasswordLabel,
          prefixIcon: Icons.key_outlined,
          suffixIcon: Icons.visibility,
          fillColor: ThemeColor.fieldbg,
          controller: _passwordController,
          constraints: constraints,
        ),
        SizedBox(height: constraints.maxHeight * 0.02),
        CustomTextbox(
          labelText: FormTableText.ConfirmPasswordLabel,
          prefixIcon: Icons.key_outlined,
          suffixIcon: Icons.visibility,
          fillColor: ThemeColor.fieldbg,
          controller: _confirmPasswordController,
          constraints: constraints,
        ),
        SizedBox(height: constraints.maxHeight * 0.02),
        DateAndTimePicker(),
        SizedBox(height: constraints.maxHeight * 0.02),
        buildGenderSlidingButton(constraints),
        SizedBox(height: 44),
      ],
    );
  }

  Widget buildSlidingButton(BoxConstraints constraints) {
    double buttonWidth = constraints.maxWidth * 0.8;
    double toggleableWidth = buttonWidth / 2;

    return GestureDetector(
      onTap: () {
        if (isLogin && isLoginButtonEnabled) {
          Navigator.pushNamed(context, '/main');
          log('Login with: ${_usernameController.text}, ${_passwordController.text}');
        } else if (!isLogin && isRegisterButtonEnabled) {
          Navigator.pushNamed(context, '/test_onboarding');
          log('Register with: ${_usernameController.text}, ${_emailController.text}, ${_passwordController.text}, ${_confirmPasswordController.text}');
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: (isLogin && isLoginButtonEnabled) ||
                (!isLogin && isRegisterButtonEnabled)
            ? buttonWidth
            : buttonWidth,
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
            // Background shadow (if needed)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.44),
                    Colors.transparent,
                    Colors.transparent,
                    Colors.white.withOpacity(0.44),
                  ],
                  stops: [0.0, 0.2, 0.96, 1.0],
                ),
              ),
            ),
            // Sliding button (only when not enabled)
            if (!((isLogin && isLoginButtonEnabled) ||
                (!isLogin && isRegisterButtonEnabled)))
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                left: isLogin ? 0 : buttonWidth / 2,
                top: 0,
                bottom: 0,
                width: toggleableWidth,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF9C3FE4),
                        Color(0xFFC65647),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(4, 4),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
            // Text labels
            if (!(isLoginButtonEnabled) || !(isRegisterButtonEnabled))
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
                          style: ThemeFont.primaryFont(
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
                          style: ThemeFont.primaryFont(
                            color: !isLogin ? Colors.white : Colors.black38,
                            fontSize: constraints.maxWidth * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            // Centered text when enabled
            if ((isLogin && isLoginButtonEnabled) ||
                (!isLogin && isRegisterButtonEnabled))
              Center(
                child: Text(
                  isLogin ? 'Login' : 'Register',
                  style: ThemeFont.primaryFont(
                    color: Colors.white,
                    fontSize: constraints.maxWidth * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildGenderSlidingButton(BoxConstraints constraints) {
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
          // Background shadow (if needed)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.44), // Dark shadow on top-left
                  Colors.transparent, // Fades to transparent
                  Colors.transparent,
                  Colors.white
                      .withOpacity(0.44), // Light shadow on bottom-right
                ],
                stops: [
                  0.0,
                  0.2,
                  0.96,
                  1.0
                ], // Adjust gradient stops for smooth transition
              ),
            ),
          ),
          // Sliding selector
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: selectedGenderIndex * (constraints.maxWidth * 0.8 / 3),
            top: 0,
            bottom: 0,
            width: constraints.maxWidth * 0.8 / 3,
            child: GestureDetector(
              onTap: () {
                // You might want to add some logic here
                // if you are doing something specific on tap
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(4, 4),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                  color: Color(0xff99862A), // Changed color to gold
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          // Gender options
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Male option
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGenderIndex = 0;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.male_outlined,
                          color: selectedGenderIndex == 0
                              ? Colors.white
                              : Colors.black38,
                          size: constraints.maxWidth * 0.0691,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Male',
                          style: ThemeFont.primaryFont(
                            color: selectedGenderIndex == 0
                                ? Colors.white
                                : Colors.black38,
                            fontSize: constraints.maxWidth * 0.04,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Female option
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGenderIndex = 1;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.female_outlined,
                          color: selectedGenderIndex == 1
                              ? Colors.white
                              : Colors.black38,
                          size: constraints.maxWidth * 0.0691,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Female',
                          style: ThemeFont.primaryFont(
                            color: selectedGenderIndex == 1
                                ? Colors.white
                                : Colors.black38,
                            fontSize: constraints.maxWidth * 0.04,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Others option
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGenderIndex = 2;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.transgender_outlined,
                          color: selectedGenderIndex == 2
                              ? Colors.white
                              : Colors.black38,
                          size: constraints.maxWidth * 0.0691,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Others',
                          style: ThemeFont.primaryFont(
                            color: selectedGenderIndex == 2
                                ? Colors.white
                                : Colors.black38,
                            fontSize: constraints.maxWidth * 0.04,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
          color: Colors.white.withOpacity(0.1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5.0,
              offset: Offset(0, 4),
            ),
          ],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.grey.shade400.withOpacity(0.4),
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

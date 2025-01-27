import 'package:flutter/material.dart';
import 'package:mindq_ui/constants/string_const.dart';
import 'package:mindq_ui/constants/styles/color_const.dart';
import 'package:mindq_ui/widgets/TextBox.dart';
import '../constants/styles/font_const.dart';

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
                                      color: Colors.white.withOpacity(0.169),//(0xff827327),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: isLogin
                                        ? buildLoginForm(constraints)
                                        : buildRegistrationForm(constraints),
                                  ),
                                  SizedBox(height: 20),
                                  buildSlidingButton(constraints),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      // Left gradient divider
                                      Expanded(
                                        child: Container(
                                          height: 1,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.black26.withOpacity(0.0), // Start transparent
                                                Colors.black26, // Fully visible in the middle
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Text(
                                          "Or continue with",
                                          style: ThemeFont.primaryFont(
                                            color: Colors.black26, // Text color
                                            fontWeight: FontWeight.w500, // Text weight
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
                                                Colors.black26, // Fully visible in the middle
                                                Colors.black26.withOpacity(0.0), // End transparent
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 30),
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
                  color: Colors.black.withOpacity(0.5), // Shadow color with opacity
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
              style: ThemeFont.primaryFont(fontSize: constraints.maxWidth * 0.03),
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
                ).copyWith(shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.5), // Shadow color with opacity
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
            suffixIcon: Icons.visibility,
            fillColor: ThemeColor.fieldbg,
            constraints: constraints),
        SizedBox(height: constraints.maxHeight * 0.02),
        CustomTextbox(

            labelText: FormTableText.DOBLabel,
            prefixIcon: Icons.calendar_month_outlined,
            fillColor: ThemeColor.fieldbg,
            constraints: constraints),
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
          Colors.white.withOpacity(0.44), // Dark shadow on bottom-right
        ],
        stops: [0.0, 0.2, 0.96, 1.0], // Adjust gradient stops for smooth transition
      ),
    ),
    ),
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
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Shadow color with opacity
                      offset: Offset(4, 4), // Horizontal and vertical shadow offset
                      blurRadius: 10, // How blurry the shadow is
                      spreadRadius: 2, // How far the shadow spreads
                    ),
                  ],
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
                  Colors.white.withOpacity(0.44), // Dark shadow on bottom-right
                ],
                stops: [0.0, 0.2, 0.96, 1.0], // Adjust gradient stops for smooth transition
              ),
            ),
          ),
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
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Shadow color with opacity
                      offset: Offset(4, 4), // Horizontal and vertical shadow offset
                      blurRadius: 10, // How blurry the shadow is
                      spreadRadius: 2, // How far the shadow spreads
                    ),
                  ],color: Color(0xff99862A),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(width: 10),
              Icon(
                Icons.male_outlined,
                color: selectedGenderIndex == 0 ? Colors.white : Colors.black38,
                size: constraints.maxWidth * 0.0691, // Adjust the size based on your constraints
              ),
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
                      style: ThemeFont.primaryFont(
                        color: selectedGenderIndex == 0
                            ? Colors.white
                            : Colors.black38,
                        fontSize: constraints.maxWidth * 0.04,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.female_outlined,
                color: selectedGenderIndex == 1 ? Colors.white : Colors.black38,
                size: constraints.maxWidth * 0.0691, // Adjust the size based on your constraints
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
                      style: ThemeFont.primaryFont(
                        color: selectedGenderIndex == 1
                            ? Colors.white
                            : Colors.black38,
                        fontSize: constraints.maxWidth * 0.04,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.transgender_outlined,
                color: selectedGenderIndex == 0
                    ? Colors.black38
                    : Colors.white,
                size: constraints.maxWidth * 0.0691, // Adjust the size based on your constraints
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
                      style: ThemeFont.primaryFont(
                        color: selectedGenderIndex == 2
                            ? Colors.white
                            : Colors.black38,
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
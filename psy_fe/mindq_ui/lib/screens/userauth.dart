import 'package:flutter/material.dart';
import 'package:mindq_ui/constants/string_const.dart';
import 'package:mindq_ui/constants/styles/color_const.dart';
import 'package:mindq_ui/widgets/TextBox.dart';

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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/assets/mindq_right_bg.jpg'),
                fit: BoxFit.fill,
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'lib/assets/phobe-removebg-preview.png'),
                      ),
                    ),
                  ),
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
                  buildSlidingButton(),
                  SizedBox(height: 20),
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
          Positioned(
            top: 33,
            right: -4.4,
            child: Container(
              width: 200,
              height: 200,
              child: Image.asset(
                'lib/assets/phobe-removebg-preview.png',
                fit: BoxFit.contain,
                color: Colors.white.withOpacity(0.8),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoginForm() {
    return Column(
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
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'we missed you...',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 60),
        CustomTextbox(labelText: FormTableText.UsernameLabel, prefixIcon: Icon(Icons.person_2_outlined, color: ThemeColor.FormIconShade), fillColor: ThemeColor.fieldbg),
        SizedBox(height: 20),
        CustomTextbox(labelText: FormTableText.PasswordLabel, prefixIcon: Icon(Icons.key_outlined, color: ThemeColor.FormIconShade), suffixIcon: Icon(Icons.visibility, color: ThemeColor.FormIconShade), fillColor: ThemeColor.fieldbg),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text('Forgot Password?'),
          ),
        ),
        SizedBox(height: 123),
      ],
    );
  }
  Widget buildRegistrationForm() {
    return Column(
      children: [
        Positioned(
          top: 100,
          left: 0,
          right: 0,

          child: Center(
            child: Column(
              children: [
                Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 40.33  ,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                Text(
                  'Healing Holistically',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black12,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        CustomTextbox(labelText: FormTableText.UsernameLabel, prefixIcon: Icon(Icons.person_2_outlined, color: ThemeColor.FormIconShade), fillColor: ThemeColor.fieldbg),
        SizedBox(height: 20),
        CustomTextbox(labelText: FormTableText.EmailLabel, prefixIcon: Icon(Icons.email_outlined, color: ThemeColor.FormIconShade), fillColor: ThemeColor.fieldbg),
        SizedBox(height: 20),
        CustomTextbox(labelText: FormTableText.PasswordLabel, prefixIcon: Icon(Icons.key_outlined, color: ThemeColor.FormIconShade), suffixIcon: Icon(Icons.visibility, color: ThemeColor.FormIconShade), fillColor: ThemeColor.fieldbg),
        SizedBox(height: 20),
        CustomTextbox(labelText: FormTableText.ConfirmPasswordLabel, prefixIcon: Icon(Icons.key_outlined, color: ThemeColor.FormIconShade), fillColor: ThemeColor.fieldbg),
        SizedBox(height: 20),
        CustomTextbox(labelText: FormTableText.DOBLabel, prefixIcon: Icon(Icons.calendar_month_outlined, color: ThemeColor.FormIconShade), fillColor: ThemeColor.fieldbg),
        SizedBox(height: 20),
        buildGenderSlidingButton()
      ],
    );
  }
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
                        fontSize: 18, fontWeight:FontWeight.bold,
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
                        color: isLogin ? Colors.black38: Colors.white,
                        fontSize: 18, fontWeight:FontWeight.bold,
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

  Widget buildGenderSlidingButton() {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
          ),
          const BoxShadow(
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
          // Animated Slider
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: selectedGenderIndex * (300 / 3), // Calculate position based on index
            top: 0,
            bottom: 0,
            width: 300 / 3, // Each section is 1/3 of the total width
            child: GestureDetector(
              onTap: () {
                // We don't need to do anything here as the labels handle the tap
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          // Gender Labels
          Row(
            children: [
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGenderIndex = 0; // Male
                      });
                    },
                    child: Text(
                      'Male',
                      style: TextStyle(
                        color: selectedGenderIndex == 0 ? Colors.black : Colors.white,
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
                        selectedGenderIndex = 1; // Female
                      });
                    },
                    child: Text(
                      'Female',
                      style: TextStyle(
                        color: selectedGenderIndex == 1 ? Colors.black : Colors.white,
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
                        selectedGenderIndex = 2; // Others
                      });
                    },
                    child: Text(
                      'Others',
                      style: TextStyle(
                        color: selectedGenderIndex == 2 ? Colors.black : Colors.white,
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
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5.0,
              offset: Offset(0, 2),
            ),
          ],
          shape: BoxShape.rectangle,
          borderRadius:  BorderRadius.circular(5),
          border: Border.all(
            color: Colors.grey.shade400,
            width: 0.5,
          ),
        ),
        child: Image.asset(
          imagePath,
          width: 30,
          height: 10,
        ),
      ),
    );
  }
}
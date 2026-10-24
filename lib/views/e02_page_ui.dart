import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/app_widgets.dart';
import 'e03_page_ui.dart';
import 'e04_page_ui.dart';

// หน้า Login: Welcome back
class E02PageUI extends StatefulWidget {
  const E02PageUI({super.key});

  @override
  State<E02PageUI> createState() => _E02PageUIState();
}

class _E02PageUIState extends State<E02PageUI> {
  // ซ่อน/แสดงรหัสผ่าน
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderImage(),
            Text(
              'Welcome back',
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Login to your account',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const AppTextField(
                    hintText: 'Enter email or phone',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10),
                  AppTextField(
                    hintText: 'Password',
                    obscureText: _hidePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _hidePassword = !_hidePassword;
                        });
                      },
                      icon: Icon(
                        _hidePassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const E04PageUI(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Forgot Password ?',
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: AppColors.orange,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  PrimaryButton(text: 'Log In', onPressed: () {}),
                  const SizedBox(height: 16),
                  const OrDivider(),
                  const SizedBox(height: 30),
                  const SocialLoginRow(),
                  const SizedBox(height: 24),
                  BottomLinkText(
                    text: 'Don’t have an Account?',
                    linkText: 'Create Account',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const E03PageUI(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

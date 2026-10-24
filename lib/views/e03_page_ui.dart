import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/app_widgets.dart';
import 'e02_page_ui.dart';

// หน้าสมัครสมาชิก: Register
class E03PageUI extends StatelessWidget {
  const E03PageUI({super.key});

  // กลับไปหน้า Login (E02) โดยเหลือ E01 ไว้ข้างหลัง
  void _goToLogin(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const E02PageUI()),
      (route) => route.isFirst,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // รูปส้มแบบตัดด้านบนออก ให้เห็นแค่ส่วนล่าง
            Image.asset(
              'assets/images/img_orange2.png',
              width: double.infinity,
              height: screenWidth * 0.55,
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
            Text(
              'Register',
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Create your new account',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const AppTextField(hintText: 'Name'),
                  const SizedBox(height: 10),
                  const AppTextField(
                    hintText: 'E-mail',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10),
                  const AppTextField(
                    hintText: 'Phone',
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 10),
                  const AppTextField(hintText: 'Password', obscureText: true),
                  const SizedBox(height: 12),
                  Text.rich(
                    TextSpan(
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AppColors.text,
                      ),
                      children: const [
                        TextSpan(text: 'By signing up you agree to our '),
                        TextSpan(
                          text: 'Terms & Conditions',
                          style: TextStyle(
                            color: AppColors.orange,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.orange,
                          ),
                        ),
                        TextSpan(text: '\nand '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: AppColors.orange,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.orange,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  PrimaryButton(
                    text: 'Sign Up',
                    onPressed: () => _goToLogin(context),
                  ),
                  const SizedBox(height: 16),
                  const OrDivider(),
                  const SizedBox(height: 30),
                  const SocialLoginRow(),
                  const SizedBox(height: 24),
                  BottomLinkText(
                    text: 'Already have an Account?',
                    linkText: 'Log In',
                    onTap: () => _goToLogin(context),
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/app_widgets.dart';
import 'e03_page_ui.dart';
import 'e05_page_ui.dart';

// หน้าลืมรหัสผ่าน: Forgot your password?
class E04PageUI extends StatelessWidget {
  const E04PageUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderImage(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Forgot your password?',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Enter email address',
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  const AppTextField(keyboardType: TextInputType.emailAddress),
                  const SizedBox(height: 24),
                  PrimaryButton(
                    text: 'Send code',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const E05PageUI(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // ข้อความชิดด้านล่างของจอ
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: BottomLinkText(
            text: 'Don’t have an Account?',
            linkText: 'Create Account',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const E03PageUI()),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/app_widgets.dart';
import 'e02_page_ui.dart';

// หน้าตั้งรหัสผ่านใหม่: Create New Password
class E06PageUI extends StatelessWidget {
  const E06PageUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderImage(),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create New Password',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Enter new password',
                    style: GoogleFonts.poppins(fontSize: 18),
                  ),
                  const SizedBox(height: 24),
                  // ช่องแรกขอบสีเหลืองตาม Figma
                  const AppTextField(
                    hintText: 'Enter New password',
                    obscureText: true,
                    borderColor: AppColors.yellow,
                  ),
                  const SizedBox(height: 10),
                  const AppTextField(
                    hintText: 'Confirm password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 24),
                  PrimaryButton(
                    text: 'Submit',
                    onPressed: () {
                      // ตั้งรหัสใหม่เสร็จ กลับไปหน้า Login
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const E02PageUI(),
                        ),
                        (route) => route.isFirst,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

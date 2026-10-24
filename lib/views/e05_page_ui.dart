import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/app_widgets.dart';
import 'e06_page_ui.dart';

// หน้ายืนยันรหัส OTP
class E05PageUI extends StatelessWidget {
  const E05PageUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // แถวบนสุด: ปุ่มย้อนกลับ + ชื่อหน้า
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  children: [
                    const BackCircleButton(),
                    Expanded(
                      child: Text(
                        'OTP Verification',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    // ช่องว่างขนาดเท่าปุ่มย้อนกลับ ให้ชื่อหน้าอยู่กึ่งกลางจอ
                    const SizedBox(width: 32),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Image.asset(
                'assets/images/img_orange3.png',
                width: 270,
                height: 270,
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter OTP',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'An 4 digit code has been sent to your\nemail',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: AppColors.text,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        _otpBox(context),
                        const SizedBox(width: 6),
                        _otpBox(context),
                        const SizedBox(width: 6),
                        _otpBox(context),
                        const SizedBox(width: 6),
                        _otpBox(context),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: AppColors.text,
                          ),
                          children: const [
                            TextSpan(text: 'You should recieve the OTP in '),
                            TextSpan(
                              text: '30 Second',
                              style: TextStyle(color: AppColors.deepOrange),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    PrimaryButton(
                      text: 'Verify',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const E06PageUI(),
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
      ),
    );
  }

  // ช่องกรอก OTP 1 หลัก ขนาด 50 x 50
  Widget _otpBox(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextField(
        // ให้ช่องกรอกขยายเต็มกล่อง 50 x 50
        expands: true,
        maxLines: null,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        // พิมพ์ครบ 1 ตัวแล้วเลื่อนไปช่องถัดไป
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.zero,
          filled: true,
          fillColor: AppColors.otpBox,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.yellow, width: 1.5),
          ),
        ),
      ),
    );
  }
}

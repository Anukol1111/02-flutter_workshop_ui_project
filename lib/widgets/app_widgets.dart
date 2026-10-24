import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// สีที่ใช้ทั้งแอป (ดูดสีมาจาก Figma)
class AppColors {
  static const Color orange = Color(0xFFF7941D);
  static const Color deepOrange = Color(0xFFF2711C);
  static const Color yellow = Color(0xFFF2C94C);
  static const Color backCircle = Color(0xFFF7F0C8);
  static const Color border = Color(0xFF9E9E9E);
  static const Color hint = Color(0xFF9E9E9E);
  static const Color line = Color(0xFFF5B26B);
  static const Color otpBox = Color(0xFFE3E3E3);
  static const Color text = Color(0xFF333333);
}

// ปุ่มย้อนกลับวงกลมมุมซ้ายบน
class BackCircleButton extends StatelessWidget {
  const BackCircleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      customBorder: const CircleBorder(),
      child: Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
          color: AppColors.backCircle,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.arrow_back_ios_new,
          size: 14,
          color: Colors.white,
        ),
      ),
    );
  }
}

// รูปส้มด้านบน + ปุ่มย้อนกลับ (ใช้ใน E02, E04, E06)
class HeaderImage extends StatelessWidget {
  const HeaderImage({super.key, this.showBackButton = true});

  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/img_orange2.png',
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        if (showBackButton)
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: BackCircleButton(),
            ),
          ),
      ],
    );
  }
}

// ช่องกรอกข้อมูล ขนาดใน Figma 300 x 46
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.borderColor = AppColors.border,
  });

  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      textAlignVertical: TextAlignVertical.center,
      style: GoogleFonts.poppins(fontSize: 14),
      decoration: InputDecoration(
        // ล็อกความสูงช่องกรอกให้เท่ากับ Figma (46)
        constraints: const BoxConstraints(minHeight: 46, maxHeight: 46),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(fontSize: 12, color: AppColors.hint),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          // ขอบสีอื่นที่ไม่ใช่สีเทา (เช่นเหลืองใน E06) จะหนากว่าเล็กน้อยตาม Figma
          borderSide: BorderSide(
            color: borderColor,
            width: borderColor == AppColors.border ? 1 : 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.yellow, width: 1.5),
        ),
      ),
    );
  }
}

// ปุ่มสีส้ม ขนาดใน Figma 300 x 50
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.orange,
        foregroundColor: Colors.white,
        elevation: 0,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}

// เส้นคั่น ---- OR ----
class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        children: [
          const Expanded(child: Divider(color: AppColors.line, thickness: 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'OR',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Expanded(child: Divider(color: AppColors.line, thickness: 1)),
        ],
      ),
    );
  }
}

// ไอคอนเข้าสู่ระบบด้วย Google / Facebook / Apple
class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _socialIcon('assets/images/img_g.png'),
        const SizedBox(width: 30),
        _socialIcon('assets/images/img_f.png'),
        const SizedBox(width: 30),
        _socialIcon('assets/images/img_a.png'),
      ],
    );
  }

  Widget _socialIcon(String imagePath) {
    return InkWell(
      onTap: () {},
      customBorder: const CircleBorder(),
      child: Image.asset(imagePath, width: 32, height: 32),
    );
  }
}

// ข้อความด้านล่าง เช่น "Don’t have an Account? Create Account"
class BottomLinkText extends StatelessWidget {
  const BottomLinkText({
    super.key,
    required this.text,
    required this.linkText,
    required this.onTap,
  });

  final String text;
  final String linkText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // ใช้ Wrap เพื่อให้ขึ้นบรรทัดใหม่ได้ถ้าจอแคบหรือตัวอักษรใหญ่
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          '$text ',
          style: GoogleFonts.poppins(fontSize: 12, color: AppColors.text),
        ),
        TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            linkText,
            style: GoogleFonts.poppins(fontSize: 12, color: AppColors.orange),
          ),
        ),
      ],
    );
  }
}

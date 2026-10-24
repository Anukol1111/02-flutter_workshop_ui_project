import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/e01_page_ui.dart';
import 'widgets/app_widgets.dart';

void main() {
  runApp(const FlutterWorkshopUiProject());
}

class FlutterWorkshopUiProject extends StatelessWidget {
  const FlutterWorkshopUiProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orange ส้ม',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.orange),
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      // หน้าแรกของแอป
      home: const E01PageUI(),
    );
  }
}

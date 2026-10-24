import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_workshop_ui_project/main.dart';
import 'package:flutter_workshop_ui_project/views/e03_page_ui.dart';
import 'package:flutter_workshop_ui_project/views/e04_page_ui.dart';
import 'package:flutter_workshop_ui_project/views/e05_page_ui.dart';
import 'package:flutter_workshop_ui_project/views/e06_page_ui.dart';

void main() {
  // ไม่ให้ google_fonts โหลดฟอนต์จากอินเทอร์เน็ตตอนรันเทสต์
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  // ขนาดจอ iPhone 15 Pro Max (430 x 932)
  void useIphone15ProMax(WidgetTester tester) {
    tester.view.physicalSize = const Size(1290, 2796);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
  }

  testWidgets('E01 is the first page and opens E02', (tester) async {
    useIphone15ProMax(tester);
    await tester.pumpWidget(const FlutterWorkshopUiProject());

    expect(find.text('BERRY JUICE'), findsOneWidget);

    await tester.tap(find.text('Explore Now'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome back'), findsOneWidget);
  });

  testWidgets('Every page fits iPhone 15 Pro Max without overflow', (
    tester,
  ) async {
    useIphone15ProMax(tester);
    const pages = <Widget>[E03PageUI(), E04PageUI(), E05PageUI(), E06PageUI()];
    for (final page in pages) {
      await tester.pumpWidget(const MaterialApp(home: SizedBox()));
      await tester.pumpWidget(MaterialApp(home: page));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    }
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tomato_flutter/main.dart';

void main() {
  testWidgets('Five static pages render and keep the tomato', (tester) async {
    tester.view.physicalSize = const Size(1000, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    const pages = [
      RegistrationPage(),
      LoginPage(),
      MainPage(),
      SettingsPage(),
      StatisticsPage(),
    ];
    const titles = [
      'Create your account',
      'Welcome back',
      'Start focusing',
      'Settings',
      'Statistics',
    ];
    for (var i = 0; i < pages.length; i++) {
      await tester.pumpWidget(MaterialApp(home: pages[i]));
      await tester.pumpAndSettle();
      expect(find.text(titles[i]), findsOneWidget);
      expect(find.byType(SvgPicture), i < 3 ? findsOneWidget : findsNothing);
      for (final button in tester.widgetList<ElevatedButton>(
        find.byType(ElevatedButton),
      )) {
        expect(button.onPressed, isNull);
      }
      expect(find.byType(BackButton), findsNothing);
      expect(tester.takeException(), isNull);
    }
  });
}

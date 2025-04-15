import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:smart_meal_a_i/flutter_flow/flutter_flow_drop_down.dart';
import 'package:smart_meal_a_i/flutter_flow/flutter_flow_icon_button.dart';
import 'package:smart_meal_a_i/flutter_flow/flutter_flow_widgets.dart';
import 'package:smart_meal_a_i/flutter_flow/flutter_flow_theme.dart';
import 'package:smart_meal_a_i/index.dart';
import 'package:smart_meal_a_i/main.dart';
import 'package:smart_meal_a_i/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:smart_meal_a_i/backend/firebase/firebase_config.dart';
import 'package:smart_meal_a_i/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  group('Zach\'s Test Cases', () {
    testWidgets('Create New Acccont Success', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: const MyApp(),
      ));
      await GoogleFonts.pendingFonts();

      await tester.pumpAndSettle(const Duration(milliseconds: 10000));
      await tester.tap(find.descendant(
        of: find.byKey(const ValueKey('GlowingButton_6xa6')),
        matching: find.byKey(const ValueKey('Button_1eym')),
      ));
      await tester.pumpAndSettle(const Duration(milliseconds: 10000));
      await tester.tap(find.byKey(const ValueKey('emailAddress_Create_2cvo')));
      await tester.pumpAndSettle(const Duration(milliseconds: 10000));
      await tester.enterText(
          find.byKey(const ValueKey('emailAddress_Create_2cvo')),
          'zj_test123@gmail.com');
      await tester.pumpAndSettle(const Duration(milliseconds: 10000));
      await tester.tap(find.byKey(const ValueKey('password_Create_lung')));
      await tester.pumpAndSettle(const Duration(milliseconds: 10000));
      await tester.enterText(
          find.byKey(const ValueKey('password_Create_lung')), 'password');
      await tester.pumpAndSettle(const Duration(milliseconds: 10000));
      await tester
          .tap(find.byKey(const ValueKey('password_CreateConfirm_g8z7')));
      await tester.pumpAndSettle(const Duration(milliseconds: 10000));
      await tester.enterText(
          find.byKey(const ValueKey('password_CreateConfirm_g8z7')),
          'password');
      await tester.pumpAndSettle(const Duration(milliseconds: 10000));
      await tester.tap(find.byKey(const ValueKey('Get_Started_Button_ji47')));
      await tester.pumpAndSettle(const Duration(milliseconds: 10000));
      expect(find.byKey(const ValueKey('Dashboard_ifjm')), findsOneWidget);
    });
  });

  group('Qiang', () {
    testWidgets('US2 Login', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: LoginCopyWidget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.enterText(
          find.byKey(const ValueKey('emailAddress_mabs')), 'Test1@email.com');
      await tester.pumpAndSettle(const Duration(milliseconds: 10000));
      await tester.enterText(
          find.byKey(const ValueKey('password_4lwi')), '123456');
      await tester.pumpAndSettle(const Duration(milliseconds: 10000));
      await tester.tap(find.byKey(const ValueKey('Button_8ges')));
    });
  });

  testWidgets('US1 Account already exists', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.tap(find.byKey(const ValueKey('GlowingButton_6xa6')));
    await tester.pumpAndSettle(const Duration(milliseconds: 20000));
    await tester.enterText(
        find.byKey(const ValueKey('emailAddress_Create_2cvo')),
        'antmypelli@gmail.com');
    await tester.enterText(
        find.byKey(const ValueKey('password_Create_lung')), 'pswd123');
    await tester.enterText(
        find.byKey(const ValueKey('password_CreateConfirm_g8z7')), 'pswd123');
    await tester.tap(find.byKey(const ValueKey('Get_Started_Button_ji47')));
    await tester.pumpAndSettle(const Duration(milliseconds: 20000));
    expect(
        find.text('Error: The email is already in use by a different account '),
        findsOneWidget);
  });

  testWidgets('US2 Login', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: LoginCopyWidget(),
      ),
    ));
    await GoogleFonts.pendingFonts();

    await tester.enterText(
        find.byKey(const ValueKey('emailAddress_mabs')), 'Test1@email.com');
    await tester.pumpAndSettle(const Duration(milliseconds: 10000));
    await tester.enterText(
        find.byKey(const ValueKey('password_4lwi')), '123456');
    await tester.pumpAndSettle(const Duration(milliseconds: 10000));
    await tester.tap(find.byKey(const ValueKey('Button_8ges')));
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}

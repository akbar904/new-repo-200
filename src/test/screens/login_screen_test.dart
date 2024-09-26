
import 'package:flutter_test/flutter_test.dart';
import 'package:honeybird/screens/login_screen.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';

void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('should display email and password text fields', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: LoginScreen()));

			expect(find.byType(CustomTextField), findsNWidgets(2));
			expect(find.widgetWithText(CustomTextField, 'Email'), findsOneWidget);
			expect(find.widgetWithText(CustomTextField, 'Password'), findsOneWidget);
		});

		testWidgets('should display login button', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: LoginScreen()));

			expect(find.byType(CustomButton), findsOneWidget);
			expect(find.widgetWithText(CustomButton, 'Login'), findsOneWidget);
		});
	});
}

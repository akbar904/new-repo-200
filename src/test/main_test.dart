
import 'package:flutter_test/flutter_test.dart';
import 'package:honeybird/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
	group('Main App Initialization', () {
		testWidgets('App shows LoginScreen on startup', (WidgetTester tester) async {
			// Build the main app widget
			await tester.pumpWidget(MyApp());

			// Verify if the LoginScreen is displayed by checking for specific text or widgets
			expect(find.text('Login'), findsOneWidget);
			expect(find.byType(TextField), findsNWidgets(2)); // Assuming there are 2 text fields for email and password
			expect(find.byType(ElevatedButton), findsOneWidget); // Assuming there is one login button
		});
	});

	group('Cubits Initialization', () {
		test('AuthCubit is provided', () {
			final app = MyApp();
			final providedCubits = app.cubits;

			// Check if AuthCubit is among the provided cubits
			expect(providedCubits.any((cubit) => cubit is AuthCubit), isTrue);
		});

		test('DataCubit is provided', () {
			final app = MyApp();
			final providedCubits = app.cubits;

			// Check if DataCubit is among the provided cubits
			expect(providedCubits.any((cubit) => cubit is DataCubit), isTrue);
		});
	});
}

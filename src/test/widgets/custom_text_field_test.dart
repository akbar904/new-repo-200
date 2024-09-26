
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:com.example.honeybird/widgets/custom_text_field.dart';

void main() {
	group('CustomTextField Widget Tests', () {
		testWidgets('displays the correct hint text', (WidgetTester tester) async {
			const hintText = 'Enter text here';
			await tester.pumpWidget(
				const MaterialApp(
					home: Scaffold(
						body: CustomTextField(
							hint: hintText,
							controller: TextEditingController(),
						),
					),
				),
			);
			expect(find.byType(TextField), findsOneWidget);
			expect(find.text(hintText), findsOneWidget);
		});

		testWidgets('uses the provided TextEditingController', (WidgetTester tester) async {
			final controller = TextEditingController(text: 'Initial value');
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: CustomTextField(
							hint: 'Hint text',
							controller: controller,
						),
					),
				),
			);
			expect(find.byType(TextField), findsOneWidget);
			expect(find.text('Initial value'), findsOneWidget);
		});
	});
}

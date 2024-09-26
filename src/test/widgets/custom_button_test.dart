
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:honeybird/widgets/custom_button.dart';

void main() {
	group('CustomButton Widget Tests', () {
		testWidgets('should display the correct label text', (WidgetTester tester) async {
			// Arrange
			const testLabel = 'Press Me';

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: CustomButton(
							label: testLabel,
							onPressed: () {},
						),
					),
				),
			);

			// Assert
			expect(find.text(testLabel), findsOneWidget);
		});

		testWidgets('should call onPressed callback when tapped', (WidgetTester tester) async {
			// Arrange
			bool isPressed = false;

			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: CustomButton(
							label: 'Press Me',
							onPressed: () {
								isPressed = true;
							},
						),
					),
				),
			);

			// Act
			await tester.tap(find.byType(CustomButton));
			await tester.pump();

			// Assert
			expect(isPressed, isTrue);
		});

		testWidgets('should have a default padding', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: CustomButton(
							label: 'Press Me',
							onPressed: () {},
						),
					),
				),
			);

			// Assert
			final customButton = tester.widget<CustomButton>(find.byType(CustomButton));
			expect(customButton.padding, const EdgeInsets.all(16.0));
		});
	});
}

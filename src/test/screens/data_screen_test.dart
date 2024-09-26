
import 'package:flutter_test/flutter_test.dart';
import 'package:honeybird/screens/data_screen.dart';

void main() {
	group('DataScreen Widget Tests', () {
		testWidgets('should display title text', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(const DataScreen());

			// Act
			final titleFinder = find.text('Data Screen');

			// Assert
			expect(titleFinder, findsOneWidget);
		});

		testWidgets('should display CustomButton widget', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(const DataScreen());

			// Act
			final buttonFinder = find.byType(CustomButton);

			// Assert
			expect(buttonFinder, findsOneWidget);
		});
	});

	group('DataCubit Tests', () {
		blocTest<DataCubit, DataState>(
			'emits [DataLoading, DataLoaded] when fetchData is called',
			build: () => DataCubit(),
			act: (cubit) => cubit.fetchData(),
			expect: () => [
				isA<DataLoading>(),
				isA<DataLoaded>(),
			],
		);
	});
}


import 'package:flutter_test/flutter_test.dart';
import 'package:honeybird/models/data_model.dart';

void main() {
	group('DataModel', () {
		test('should correctly serialize from JSON', () {
			// Arrange
			final json = {'id': '123', 'value': 'testValue'};

			// Act
			final dataModel = DataModel.fromJson(json);

			// Assert
			expect(dataModel.id, '123');
			expect(dataModel.value, 'testValue');
		});

		test('should correctly serialize to JSON', () {
			// Arrange
			final dataModel = DataModel(id: '123', value: 'testValue');

			// Act
			final json = dataModel.toJson();

			// Assert
			expect(json['id'], '123');
			expect(json['value'], 'testValue');
		});

		test('should have correct equality', () {
			// Arrange
			final dataModel1 = DataModel(id: '123', value: 'testValue');
			final dataModel2 = DataModel(id: '123', value: 'testValue');
			final dataModel3 = DataModel(id: '456', value: 'anotherValue');

			// Assert
			expect(dataModel1, equals(dataModel2));
			expect(dataModel1, isNot(equals(dataModel3)));
		});
	});
}

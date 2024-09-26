
import 'package:flutter_test/flutter_test.dart';
import 'package:honeybird/models/user_model.dart';

void main() {
	group('UserModel', () {
		test('should create a UserModel instance with correct data', () {
			// Arrange
			const id = '1';
			const name = 'John Doe';
			const email = 'john.doe@example.com';

			// Act
			final user = UserModel(id: id, name: name, email: email);

			// Assert
			expect(user.id, id);
			expect(user.name, name);
			expect(user.email, email);
		});

		test('should serialize UserModel to JSON', () {
			// Arrange
			const id = '1';
			const name = 'John Doe';
			const email = 'john.doe@example.com';
			final user = UserModel(id: id, name: name, email: email);
			final expectedJson = {
				'id': id,
				'name': name,
				'email': email,
			};

			// Act
			final json = user.toJson();

			// Assert
			expect(json, expectedJson);
		});

		test('should deserialize UserModel from JSON', () {
			// Arrange
			const json = {
				'id': '1',
				'name': 'John Doe',
				'email': 'john.doe@example.com',
			};

			// Act
			final user = UserModel.fromJson(json);

			// Assert
			expect(user.id, json['id']);
			expect(user.name, json['name']);
			expect(user.email, json['email']);
		});
	});
}

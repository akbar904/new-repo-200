
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.honeybird/cubits/auth_cubit.dart';

class MockAuthCubit extends Mock implements AuthCubit {}

void main() {
	group('AuthCubit', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = AuthCubit();
		});

		tearDown(() {
			authCubit.close();
		});

		test('initial state is AuthInitial', () {
			expect(authCubit.state, equals(AuthInitial()));
		});

		blocTest<AuthCubit, AuthState>(
			'emits [AuthLoading, AuthAuthenticated] when login is successful',
			build: () => authCubit,
			act: (cubit) => cubit.login('test@example.com', 'password'),
			expect: () => [
				AuthLoading(),
				AuthAuthenticated(User(id: '123', name: 'Test User', email: 'test@example.com')),
			],
		);

		blocTest<AuthCubit, AuthState>(
			'emits [AuthLoading, AuthError] when login fails',
			build: () => authCubit,
			act: (cubit) => cubit.login('wrong@example.com', 'wrongpassword'),
			expect: () => [
				AuthLoading(),
				AuthError('Login failed'),
			],
		);

		blocTest<AuthCubit, AuthState>(
			'emits [AuthLoading, AuthInitial] when logout is called',
			build: () => authCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [
				AuthLoading(),
				AuthInitial(),
			],
		);
	});
}

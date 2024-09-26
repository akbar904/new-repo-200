
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:com.example.honeybird/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthInitial());

	void login(String email, String password) async {
		try {
			emit(AuthLoading());
			// Simulate network delay
			await Future.delayed(Duration(seconds: 1));
			if (email == 'test@example.com' && password == 'password') {
				final user = User(id: '123', name: 'Test User', email: email);
				emit(AuthAuthenticated(user));
			} else {
				emit(AuthError('Login failed'));
			}
		} catch (e) {
			emit(AuthError('An error occurred'));
		}
	}

	void logout() async {
		emit(AuthLoading());
		await Future.delayed(Duration(seconds: 1));
		emit(AuthInitial());
	}
}

abstract class AuthState extends Equatable {
	const AuthState();

	@override
	List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
	final User user;

	const AuthAuthenticated(this.user);

	@override
	List<Object> get props => [user];
}

class AuthError extends AuthState {
	final String message;

	const AuthError(this.message);

	@override
	List<Object> get props => [message];
}

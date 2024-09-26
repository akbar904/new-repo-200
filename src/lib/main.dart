
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/auth_cubit.dart';
import 'cubits/data_cubit.dart';
import 'screens/login_screen.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	final List<Cubit> cubits = [
		AuthCubit(),
		DataCubit(),
	];

	@override
	Widget build(BuildContext context) {
		return MultiBlocProvider(
			providers: cubits.map((cubit) => BlocProvider.value(value: cubit)).toList(),
			child: MaterialApp(
				title: 'Honeybird',
				theme: ThemeData(
					primarySwatch: Colors.blue,
				),
				home: LoginScreen(),
			),
		);
	}
}


import 'package:flutter/material.dart';
import 'package:honeybird/widgets/custom_button.dart';
import 'package:honeybird/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
	const LoginScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		TextEditingController emailController = TextEditingController();
		TextEditingController passwordController = TextEditingController();

		return Scaffold(
			appBar: AppBar(
				title: Text('Login'),
			),
			body: Padding(
				padding: const EdgeInsets.all(16.0),
				child: Column(
					children: [
						CustomTextField(
							hint: 'Email',
							controller: emailController,
						),
						SizedBox(height: 16.0),
						CustomTextField(
							hint: 'Password',
							controller: passwordController,
						),
						SizedBox(height: 16.0),
						CustomButton(
							label: 'Login',
							onPressed: () {
								// Handle login logic here
							},
						),
					],
				),
			),
		);
	}
}

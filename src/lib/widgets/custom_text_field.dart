
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
	final String hint;
	final TextEditingController controller;

	const CustomTextField({
		Key? key,
		required this.hint,
		required this.controller,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return TextField(
			controller: controller,
			decoration: InputDecoration(
				hintText: hint,
			),
		);
	}
}

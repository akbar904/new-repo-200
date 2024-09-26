
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
	const CustomButton({
		Key? key,
		required this.label,
		required this.onPressed,
		this.padding = const EdgeInsets.all(16.0),
	}) : super(key: key);

	final String label;
	final VoidCallback onPressed;
	final EdgeInsets padding;

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: padding,
			child: ElevatedButton(
				onPressed: onPressed,
				child: Text(label),
			),
		);
	}
}

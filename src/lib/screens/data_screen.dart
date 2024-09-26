
import 'package:flutter/material.dart';
import 'package:honeybird/widgets/custom_button.dart';

class DataScreen extends StatelessWidget {
	const DataScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Data Screen'),
			),
			body: Center(
				child: CustomButton(
					label: 'Fetch Data',
					onPressed: () {
						// Implement your logic here
					},
				),
			),
		);
	}
}

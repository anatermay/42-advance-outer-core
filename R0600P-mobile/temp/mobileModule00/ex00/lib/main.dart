import 'package:flutter/material.dart';

/// Flutter code sample for [ElevatedButton].

void main() => runApp(const MyFirstButtonApp());

class MyFirstButtonApp extends StatelessWidget {
	const MyFirstButtonApp({super.key});

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				body: const MyFirstButton(),
				backgroundColor: const Color(0xFFC0C0C0),
			),
		);
	}
}

class MyFirstButton extends StatefulWidget {
	const MyFirstButton({super.key});

	@override
	State<MyFirstButton> createState() => _MyFirstButtonState();
}

class _MyFirstButtonState extends State<MyFirstButton> {
	@override
	Widget build(BuildContext context) {
		final ButtonStyle style = ElevatedButton.styleFrom(
			textStyle: const TextStyle(fontSize: 20),
			minimumSize: const Size.fromHeight(50),
			backgroundColor: Colors.black,
			foregroundColor: const Color(0xFFC0C0C0),
		);

		return Center(
			child: Column(
				mainAxisSize: .min,
				children: <Widget>[
						const SizedBox(height: 30),
						const Text(
								'Hello, 42 Flutter!',
								style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
						),
					const SizedBox(height: 30),
					ElevatedButton(
						style: style,
						onPressed: () {
							debugPrint('I/flutter (5024): Button pressed');
							// Perform some action
						},
						child: const Text('Click Here'),
					),
				],
			),
		);
	}
}

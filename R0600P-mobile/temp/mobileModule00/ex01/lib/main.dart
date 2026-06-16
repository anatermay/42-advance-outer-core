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
				backgroundColor: const Color.fromARGB(255, 255, 247, 234),
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
	bool isON = false;
	String buttonText = '42 Flutter!';
	Color	colorBlack = Colors.black;
	Color	colorSilver = const Color(0xFFC0C0C0);

	@override
	Widget build(BuildContext context) {
		final ButtonStyle style = ElevatedButton.styleFrom(
			textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
			minimumSize: const Size.fromHeight(50),
			backgroundColor: isON ? colorBlack : colorSilver,
			foregroundColor: isON ? colorSilver : colorBlack,
		);

		return Center(
			child: Column(
				mainAxisSize: .min,
				children: <Widget>[
						const SizedBox(height: 30),
						Text(
								buttonText,
								style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
						),
					const SizedBox(height: 30),
					ElevatedButton(
						style: style,
						onPressed: () {
							setState(() {
								buttonText = isON ? '42 Flutter!' : 'Hello World';
								isON = !isON;
							});
							debugPrint('Button pressed');
							// Perform some action
						},
						child: const Text('Click Here'),
					),
				],
			),
		);
	}
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

//	* * * MY COLORS	* * *

//	ANALOG COLORS

Color analogBackgroundColor = const Color.fromARGB(255, 252, 255, 188);
Color analogTextColor = const Color.fromARGB(255, 22, 0, 7);
Color primaryAnalogColor = const Color.fromARGB(255, 255, 0, 60);
Color secondaryAnalogColor = const Color.fromARGB(255, 255, 180, 60);
TextStyle analogFont = GoogleFonts.cinzel(
	color: analogTextColor,
	fontSize: 36,
	shadows: [
	Shadow(
		color: const Color(0xFF1F261C).withValues(alpha: 0.15),
		offset: const Offset(1.5, 1.5),
		blurRadius: 1,
	),
	],
);

//	SCREEN COLORS

Color screenBackgroundColor = const Color.fromARGB(255, 5, 16, 0);
Color screenTextColor = const Color.fromARGB(255, 35, 132, 0);
Color primaryScreenColor = const Color(0xFF8BA382);
Color secondaryScreenColor = const Color(0xFF1F261C);
TextStyle screenFont = GoogleFonts.pixelifySans(
	color: screenTextColor,
	fontSize: 36,
	shadows: [
	Shadow(
		color: const Color(0xFF1F261C).withValues(alpha: 0.15),
		offset: const Offset(1.5, 1.5),
		blurRadius: 1,
	),
	],
);

//	* * * MY FIRST CALCULATOR APP * * *

class Calculator extends StatefulWidget {
	const Calculator({super.key});

	@override
	State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
	String expression = "0";
	String result = "0";

	@override
	Widget build(BuildContext context) {
	return MaterialApp(
		home: Padding(
		padding: const EdgeInsets.all(6),
		child: Container(
			decoration: BoxDecoration(
			color: analogBackgroundColor,
			borderRadius: BorderRadius.circular(12),
			boxShadow: [
				BoxShadow(
				color: Colors.black.withValues(alpha: 0.4),
				blurRadius: 12,
				spreadRadius: 1,
				),
			],
			),
			child: Scaffold(
			backgroundColor: Colors.transparent,
			appBar: AppBar(
					title: Padding(
						padding: const EdgeInsets.only(top: 27),
						child: Text('Calculator',
						style : analogFont.copyWith(
							fontSize: 30,
							fontWeight: FontWeight.bold,
					))),
					backgroundColor: analogBackgroundColor,
					centerTitle: true,
			),
			body: Column(
				mainAxisAlignment: MainAxisAlignment.spaceAround,
				children: [
					//	SCREEN
					SizedBox(height: 27),
					FractionallySizedBox(
					widthFactor: 0.9,
					child: Container(
						padding: const EdgeInsets.all(9),
						decoration: BoxDecoration(
						color: screenBackgroundColor,
						borderRadius: BorderRadius.circular(12),
						border: Border.all(
							color: primaryScreenColor.withValues(alpha: 0.4),
							width: 2,
						),
						boxShadow: [
							BoxShadow(
							color: Colors.black.withValues(alpha: 0.4),
							offset: const Offset(0, 0),
							blurRadius: 12,
							spreadRadius: 2,
							),
						],
						),
						child: Column(
						crossAxisAlignment: CrossAxisAlignment.end,
						children: [Text(expression, style: screenFont)],
						),
					),
					),
					Divider(
						color: analogBackgroundColor.withValues(alpha: 0.45),
						thickness: 2,
						height: 18,
					),
					FractionallySizedBox(
					widthFactor: 0.9,
					child: Container(
						padding: const EdgeInsets.all(9),
						decoration: BoxDecoration(
						color: screenBackgroundColor,
						borderRadius: BorderRadius.circular(12),
						border: Border.all(
							color: primaryScreenColor.withValues(alpha: 0.4),
							width: 2,
						),
						boxShadow: [
							BoxShadow(
							color: Colors.black.withValues(alpha: 0.4),
							offset: const Offset(0, 0),
							blurRadius: 12,
							spreadRadius: 2,
							),
						],
						),
						child: Column(
						crossAxisAlignment: CrossAxisAlignment.end,
						children: [
							Text(
							result,
							style: screenFont.copyWith(
								fontWeight: FontWeight.bold,
							),
							),
						],
						),
					),
					),
				Divider(
					color: analogBackgroundColor.withValues(alpha: 0.45),
					thickness: 2,
					height: 18,
				),
					//	BUTTONS
					Expanded(
						child: Padding(
							padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
							child: LayoutBuilder(
							builder: (context, constraints) {
								const int columns = 5;
								const double spacing = 8.0;
						
								final double itemWidth = (constraints.maxWidth - (spacing * (columns - 1))) / columns;
						
								final double itemHeight = (constraints.maxHeight > 100) ? (constraints.maxHeight - (spacing * 3)) / 4 : 60.0;
						
								final double childAspectRatio = (itemHeight > 0) ? (itemWidth / itemHeight) : 0.7;
						
								final buttons = _buildButtons(itemWidth, itemHeight);
								return GridView.count(
								padding: EdgeInsets.zero,
								crossAxisCount: columns,
								mainAxisSpacing: spacing,
								crossAxisSpacing: spacing,
								childAspectRatio: childAspectRatio.clamp(0.5, 2.0),
								children: buttons,
							);
							},
							),
						),
					),
				],
			),
			),
		),
	)
	);
	}
}

//	* * *	MY BUTTONS	* * *

//	Button Parser

//	Button Builder

enum ButtonType {
	number, // 0-9, 00
	decimal, // .
	equal, // =
	op, // +, -, *, /
	clear, // C, AC
}

Widget	_createButton(String label, double buttonWidth, double buttonHeight) {
	ButtonType type;
	Color 		buttonColor;

	//if (label == '?') {
	//	return (const SizedBox.shrink());
	//}
	//	Button Type
	if (['00', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'].contains(label)) {
		type = ButtonType.number;
	} else if (label == '.') {
		type = ButtonType.decimal;
	} else if (label == '=') {
		type = ButtonType.equal;
	} else if (['+', '-', '*', '/'].contains(label)) {
		type = ButtonType.op;
	} else {
		type = ButtonType.clear;
	}
	//	Button Color
	switch (type) {
		case ButtonType.number:
			buttonColor = analogTextColor;
			break;
		case ButtonType.decimal:
			buttonColor = analogTextColor;
			break;
		case ButtonType.equal:
			buttonColor = secondaryAnalogColor;
			break;
		case ButtonType.op:
			buttonColor = secondaryAnalogColor;
			break;
		case ButtonType.clear:
			buttonColor = primaryAnalogColor;
			break;
	}

	return ElevatedButton(
		onPressed: () {
		debugPrint('Button $label pressed');
		//	Here you would handle the button press logic, updating the expression and result as needed.
		},
		style: ElevatedButton.styleFrom(
		backgroundColor: analogBackgroundColor,
		padding: const EdgeInsets.all(16),
		textStyle: analogFont.copyWith(color: buttonColor, fontSize: (label == 'AC' || label == '00' ? math.min(buttonHeight, buttonWidth) * 0.42 * 0.60 : math.min(buttonHeight, buttonWidth) * 0.42), fontWeight: FontWeight.bold),
		elevation: 4,
		shape: RoundedRectangleBorder(
			borderRadius: BorderRadius.circular(12),
			side: BorderSide(color: Colors.black.withValues(alpha: 0.4), width: 2),
		),
		),
		child: Text(label, style: analogFont.copyWith(color: buttonColor, fontSize: (label == 'AC' || label == '00' ? math.min(buttonHeight, buttonWidth) * 0.42 * 0.60 : math.min(buttonHeight, buttonWidth) * 0.42), fontWeight: FontWeight.bold),),
	);
}

List<Widget> _buildButtons(double buttonWidth, double buttonHeight) {
	final List<String> buttonLabels = [
		'7', '8', '9', 'C', 'AC',
		'4', '5', '6', '+', '-',
		'1', '2', '3', '*', '/',
		'0', '.', '00', '=',
	];

	return buttonLabels.map((label) => _createButton(label, buttonWidth, buttonHeight)).toList();
}

//	* * *	MAIN		* * *

void main() => runApp(const Calculator());

//	* * * * * * * * * *	* * *
//	* * *	END OF CODE	* * *

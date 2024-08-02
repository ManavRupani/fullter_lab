import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './calculator_provider.dart';

void main() {
  
  runApp(
    ChangeNotifierProvider(
      create: (context) => CalculatorProvider(),
      child: CalculatorApp(),
    ),
  );
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Scientific Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey[900],
        accentColor: Colors.teal,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.grey[800],
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white70),
        ),
      ),
      home: CalculatorHomePage(title: 'Scientific Calculator'),
    );
  }
}

class CalculatorHomePage extends StatelessWidget {
  CalculatorHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<CalculatorProvider>(context);

    return Scaffold(
      
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              color: Colors.transparent,

              child: Text(
                calculator.output,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            
            flex: 6,
            child: Column(
              
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _buildButton("sin", calculator, color: Colors.white10, textColor: Colors.white54),
                    _buildButton("cos", calculator, color: Colors.white10, textColor: Colors.white54),
                    _buildButton("tan", calculator, color: Colors.white10, textColor: Colors.white54),
                    _buildButton("x²", calculator, color: Colors.white10, textColor: Colors.white54),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("log", calculator, color: Colors.white10, textColor: Colors.white54),
                    _buildButton("ln", calculator, color: Colors.white10, textColor: Colors.white54),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("AC", calculator, color: Colors.white70, textColor: Colors.black54),
                    _buildButton("%", calculator, color: Colors.white70, textColor: Colors.black54),
                    _buildButton("√", calculator, color: Colors.white70, textColor: Colors.black54),
                    _buildButton("/", calculator, color: Colors.white70, textColor: Colors.black54),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("7", calculator),
                    _buildButton("8", calculator),
                    _buildButton("9", calculator),
                    _buildButton("*", calculator, color: Colors.white70, textColor: Colors.black54),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("4", calculator),
                    _buildButton("5", calculator),
                    _buildButton("6", calculator),
                    _buildButton("-", calculator, color: Colors.white70, textColor: Colors.black54),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("1", calculator),
                    _buildButton("2", calculator),
                    _buildButton("3", calculator),
                    _buildButton("+", calculator, color: Colors.white70, textColor: Colors.black54),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("0", calculator),
                    _buildButton(".", calculator),
                    _buildButton("C", calculator),

                    _buildButton("=", calculator, color: Colors.white70, textColor: Colors.black54),
                  ],
                ),
                // 
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String buttonText, CalculatorProvider calculator,
      {Color? color, Color? textColor}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          onPressed: () => calculator.buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(24.0),
            primary: color ?? Colors.grey[800],
            onPrimary: textColor ?? Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Text(buttonText, style: TextStyle(fontSize: 40.0)),
        ),
      ),
    );
  }
}

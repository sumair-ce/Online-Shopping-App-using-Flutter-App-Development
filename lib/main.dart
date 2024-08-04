import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _input = '';
  String _result = '';

  void _buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _input = '';
        _result = '';
      } else if (value == '=') {
        _calculateResult();
      } else {
        _input += value;
      }
      _controller.text = _result.isNotEmpty ? _result : _input;
    });
  }

  void _calculateResult() {
    try {
      print('Evaluating: $_input');
      _result = _evaluateExpression(_input).toString();
      print('Result: $_result');
    } catch (e) {
      print('Error: $e');
      _result = 'Error';
    }
  }

  double _evaluateExpression(String expression) {
    // Trim any leading or trailing whitespace
    expression = expression.trim();

    // Validate if the expression is not empty
    if (expression.isEmpty) {
      throw FormatException("Invalid expression");
    }

    // Split the expression into tokens
    List<String> tokens = [];
    String currentToken = '';

    for (int i = 0; i < expression.length; i++) {
      String char = expression[i];

      if (char == '+' || char == '-' || char == 'x' || char == '/') {
        // If currentToken is not empty, add it to tokens list
        if (currentToken.isNotEmpty) {
          tokens.add(currentToken.trim());
        }
        // Add operator as separate token
        tokens.add(char);
        currentToken = ''; // Reset currentToken
      } else {
        currentToken += char; // Build current token character by character
      }
    }

    // Add the last token if it exists
    if (currentToken.isNotEmpty) {
      tokens.add(currentToken.trim());
    }

    // Validate tokens
    if (tokens.isEmpty || tokens.length < 3 || tokens.length % 2 == 0) {
      throw FormatException("Invalid expression");
    }

    // Parse and evaluate the expression
    double total = double.parse(tokens[0]);
    for (int i = 1; i < tokens.length; i += 2) {
      String operator = tokens[i];
      double nextNumber = double.parse(tokens[i + 1]);

      switch (operator) {
        case '+':
          total += nextNumber;
          break;
        case '-':
          total -= nextNumber;
          break;
        case 'x':
          total *= nextNumber;
          break;
        case '/':
          total /= nextNumber;
          break;
        default:
          throw FormatException("Invalid operator: $operator");
      }
    }

    return total;
  }

  Widget _buildButton(String text, {Color? backgroundColor, Widget? icon}) {
    return SizedBox(
      height: 76,
      width: 76,
      child: OutlinedButton(
        onPressed: () => _buttonPressed(text),
        style: OutlinedButton.styleFrom(
          side: BorderSide.none,
          backgroundColor:
              backgroundColor ?? Color(0xff4E505F), // Default color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          textStyle: TextStyle(
            fontSize: 32,
            color: Colors.white, // Default text color
          ),
        ),
        child: icon == null
            ? Center(
                child: Text(text,
                    style: TextStyle(fontSize: 32, color: Colors.white)),
              )
            : Center(child: icon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff17171C),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Spacer(),
            TextField(
              textAlign: TextAlign.right,
              controller: _controller,
              readOnly: true,
              style: TextStyle(color: Colors.white, fontSize: 55),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(24),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('C'),
                _buildButton('('),
                _buildButton(')'),
                _buildButton('/', backgroundColor: Color(0xff4B5EFC)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('7', backgroundColor: Color(0xff2E2F38)),
                _buildButton('8', backgroundColor: Color(0xff2E2F38)),
                _buildButton('9', backgroundColor: Color(0xff2E2F38)),
                _buildButton('x', backgroundColor: Color(0xff4B5EFC)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('4', backgroundColor: Color(0xff2E2F38)),
                _buildButton('5', backgroundColor: Color(0xff2E2F38)),
                _buildButton('6', backgroundColor: Color(0xff2E2F38)),
                _buildButton('-', backgroundColor: Color(0xff4B5EFC)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('1', backgroundColor: Color(0xff2E2F38)),
                _buildButton('2', backgroundColor: Color(0xff2E2F38)),
                _buildButton('3', backgroundColor: Color(0xff2E2F38)),
                _buildButton('+', backgroundColor: Color(0xff4B5EFC)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('0', backgroundColor: Color(0xff2E2F38)),
                _buildButton('.', backgroundColor: Color(0xff2E2F38)),
                SizedBox(
                  height: 76,
                  width: 167,
                  child: OutlinedButton(
                      onPressed: () => _buttonPressed('='),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide.none,
                        backgroundColor: Color(0xff4B5EFC), // Default color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        textStyle: TextStyle(
                          fontSize: 32,
                          color: Colors.white, // Default text color
                        ),
                      ),
                      child: Center(
                        child: Text('=',
                            style:
                                TextStyle(fontSize: 32, color: Colors.white)),
                      )),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

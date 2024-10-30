import 'package:flutter/material.dart';

class NumbersInput extends StatefulWidget {
  final String numbersLabelText;

  const NumbersInput({super.key, 
    this.numbersLabelText = "Numbers",
  });

  @override
  _NumbersInputState createState() => _NumbersInputState();
}

class _NumbersInputState extends State<NumbersInput> {

  @override
  Widget build(BuildContext context) {
    bool isNumbersRequired = widget.numbersLabelText.isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(234, 239, 255, 20),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNumbersInput(widget.numbersLabelText, isNumbersRequired),
          const SizedBox(height: 2),
        ],
      ),
    );
  }

  Widget _buildNumbersInput(String labelText, bool isRequired) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isRequired ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: labelText,
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
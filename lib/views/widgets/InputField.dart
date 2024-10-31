import 'package:flutter/material.dart';

class InputWidgetEmail extends StatefulWidget {
  final String emailLabelText;
  final String emailHintText;
  final TextEditingController controller;

  const InputWidgetEmail({
    super.key,
    this.emailLabelText = "Email",
    this.emailHintText = "Coloque seu email",
    required this.controller,
  });

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidgetEmail> {
  @override
  Widget build(BuildContext context) {
    bool isEmailRequired = widget.emailLabelText.isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(234, 239, 255, 20),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.emailLabelText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isEmailRequired ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: widget.emailHintText,
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }
}

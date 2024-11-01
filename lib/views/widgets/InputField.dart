import 'package:flutter/material.dart';

class InputWidgetEmail extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(234, 239, 255, 20),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEmailInput(emailLabelText, emailHintText),
          const SizedBox(height: 2),
        ],
      ),
    );
  }

  Widget _buildEmailInput(String labelText, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 16),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ],
    );
  }
}

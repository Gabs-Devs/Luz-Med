import 'package:flutter/material.dart';

class InputWidgetPswrd extends StatefulWidget {
  final String passwordLabelText;
  final String passwordHintText;
  final TextEditingController controller;

  const InputWidgetPswrd({
    super.key,
    this.passwordLabelText = "Senha",
    this.passwordHintText = "Coloque sua senha",
    required this.controller,
  });

  @override
  State<InputWidgetPswrd> createState() => _InputWidgetPswrdState();
}

class _InputWidgetPswrdState extends State<InputWidgetPswrd> {
  bool _isPasswordVisible = false;

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
          _buildPasswordInput(widget.passwordLabelText, widget.passwordHintText),
          const SizedBox(height: 2),
        ],
      ),
    );
  }

  Widget _buildPasswordInput(String labelText, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 16),
        ),
        TextField(
          controller: widget.controller,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

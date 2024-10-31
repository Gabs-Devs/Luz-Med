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
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidgetPswrd> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    bool isPasswordRequired = widget.passwordLabelText.isNotEmpty;

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
            widget.passwordLabelText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isPasswordRequired ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          TextField(
            controller: widget.controller,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              hintText: widget.passwordHintText,
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
      ),
    );
  }
}

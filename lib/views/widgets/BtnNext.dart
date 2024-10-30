import 'package:flutter/material.dart';

class Btnnext extends StatefulWidget {
  final String buttonText;

  const Btnnext({super.key, required this.buttonText});

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<Btnnext> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1, end: 0.95).animate(_controller);
    
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward().whenComplete(() {
          _controller.reverse();
        });
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: 200, // Aumente o tamanho do botão
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(width: 4, color: Colors.transparent),
                borderRadius: BorderRadius.circular(100),
                boxShadow: _controller.value == 1
                    ? []
                    : [const BoxShadow(
                        color: Color.fromRGBO(94, 110, 165, 50),
                        spreadRadius: 4,
                      )],
              ),
              child: Center(
                child: Text(
                  widget.buttonText,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: _controller.value == 1 ? const Color(0xff1f387e) : const Color(0xff212121),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

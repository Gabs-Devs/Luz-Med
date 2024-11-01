import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './views/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const LuzMed());
}

class LuzMed extends StatelessWidget {
  const LuzMed({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogIn(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './views/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Importante para garantir que o Flutter esteja pronto
  await Firebase.initializeApp(); // Inicializa o Firebase
  runApp(const LuzMed());
}

class LuzMed extends StatefulWidget {
  const LuzMed({super.key});

  @override
  State<LuzMed> createState() => _LuzMedState();
}

class _LuzMedState extends State<LuzMed> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogIn(),
    );
  }
}